import 'package:co_stock/application/services/image_cache_service.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/dto/stock_entities_dtos.dart';
import 'package:co_stock/domain/core/image/image_asset.dart';
import 'package:co_stock/domain/screens_entities/stock_screen/stock_item.dart';

class ProductTemplateService {
  static final ProductTemplateService _instance = ProductTemplateService._();
  factory ProductTemplateService() => _instance;
  ProductTemplateService._();

  final Map<String, ProductTemplate> _templates = {};

  /// Инициализация сервиса: загружает все шаблоны из локального хранилища,
  /// восстанавливает изображения и проставляет isFavorite на основе
  /// переданного списка [favoriteIds] (берётся из UserSettings).
  Future<void> initialize({List<String>? favoriteIds}) async {
    final ids = await LocalStorageService.getAllProductTemplateIds();
    final imageService = ImageCacheService();

    // Собираем все DTO и все необходимые ImageAsset для предзагрузки
    final dtoMap = <String, ProductTemplateDto>{};
    final assetsToLoad = <ImageAsset>[];

    for (final id in ids) {
      final dto = await LocalStorageService.getProductTemplateDto(id);
      if (dto != null) {
        dtoMap[id] = dto;
        if (dto.imageId != null) {
          // Попытаемся найти ImageAsset в локальном хранилище
          final existingAsset =
          await LocalStorageService.getImageAsset(dto.imageId!);
          if (existingAsset != null) {
            assetsToLoad.add(existingAsset);
          } else {
            // Если нет локально, создадим заглушку с url из будущего API.
            // Пока url будет пустым, но загрузка с сервера попробует скачать.
            // В реальности url должен быть сохранён вместе с imageId или получен с сервера.
            // TODO: получить url с сервера при синхронизации шаблонов.
            assetsToLoad.add(
              ImageAsset(
                id: dto.imageId!,
                url: '', // будет заменено при загрузке с сервера
                mime: ImageMimeType.unknown, // уточнится после загрузки
                isError: true, // временно
              ),
            );
          }
        }
      }
    }

    // Параллельно загружаем все изображения (локальные файлы или с сервера)
    final loadedAssets = await imageService.loadImages(assetsToLoad);
    final assetMap = {for (final a in loadedAssets) a.id: a};

    // Восстанавливаем доменные объекты
    for (final dto in dtoMap.values) {
      ImageAsset? image;
      if (dto.imageId != null) {
        image = assetMap[dto.imageId!];
      }
      final isFavorite = favoriteIds?.contains(dto.id) ?? false;
      _templates[dto.id] = dto.toDomain(image: image, isFavorite: isFavorite);
    }
  }

  /// Все шаблоны
  List<ProductTemplate> get all => _templates.values.toList();

  /// Избранные шаблоны
  List<ProductTemplate> get favorites =>
      _templates.values.where((t) => t.isFavorite).toList();

  /// Найти по id
  ProductTemplate? findById(String id) => _templates[id];

  /// Добавить новый шаблон.
  /// Если есть изображение, оно будет сохранено через ImageCacheService
  /// (с дедупликацией и записью в локальное хранилище).
  Future<void> addTemplate(ProductTemplate template) async {
    ImageAsset? image = template.image;
    if (image != null) {
      image = await ImageCacheService().deduplicateAndSave(image);
    }

    final finalTemplate = template.copyWith(image: image);
    final dto = ProductTemplateDto.fromDomain(finalTemplate);
    await LocalStorageService.saveProductTemplateDto(dto);

    _templates[finalTemplate.id] = finalTemplate;
    // TODO: отправить на сервер (IProductTemplateRepository.addTemplate)
  }

  /// Обновить существующий шаблон.
  Future<void> updateTemplate(ProductTemplate updatedTemplate) async {
    if (!_templates.containsKey(updatedTemplate.id)) return;

    ImageAsset? image = updatedTemplate.image;
    if (image != null) {
      image = await ImageCacheService().deduplicateAndSave(image);
    }

    final finalTemplate = updatedTemplate.copyWith(image: image);
    final dto = ProductTemplateDto.fromDomain(finalTemplate);
    await LocalStorageService.saveProductTemplateDto(dto);

    _templates[finalTemplate.id] = finalTemplate;
    // TODO: отправить на сервер
  }

  /// Удалить шаблон, его изображение (если нигде больше не используется),
  /// и убрать из избранного.
  Future<void> deleteTemplate(String id) async {
    final template = _templates[id];
    if (template == null) return;

    // Удаляем изображение, если оно не используется в других шаблонах
    if (template.image != null) {
      await ImageCacheService().deleteImageIfUnused(template.image!.id);
    }

    _templates.remove(id);
    await LocalStorageService.removeProductTemplateDto(id);

    // Удаляем из локального списка избранных ID
    final favIds = await _loadFavoriteIds();
    favIds.remove(id);
    await _saveFavoriteIds(favIds);

    // TODO: отправить удаление на сервер
  }

  /// Переключить флаг избранного для шаблона.
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    final template = _templates[id];
    if (template == null) return;

    _templates[id] = template.copyWith(isFavorite: isFavorite);

    // Обновляем локальный список избранных ID
    final favIds = await _loadFavoriteIds();
    if (isFavorite) {
      if (!favIds.contains(id)) favIds.add(id);
    } else {
      favIds.remove(id);
    }
    await _saveFavoriteIds(favIds);

    // TODO: синхронизировать с сервером (обновить UserSettings.favoriteTemplateIds)
  }

  /// Синхронизировать избранное с внешним списком (например, после загрузки профиля).
  Future<void> syncFavorites(List<String> favoriteIds) async {
    for (final entry in _templates.entries) {
      final updated = entry.value.copyWith(
        isFavorite: favoriteIds.contains(entry.key),
      );
      _templates[entry.key] = updated;
    }
    await _saveFavoriteIds(favoriteIds);
  }

  // ---------- приватные методы ----------

  Future<List<String>> _loadFavoriteIds() async {
    return await LocalStorageService.getData<List<String>>(
      key: LSKeys.favoriteTemplateIdsKey,
    ) ??
        [];
  }

  Future<void> _saveFavoriteIds(List<String> ids) async {
    await LocalStorageService.saveData<List<String>>(
      key: LSKeys.favoriteTemplateIdsKey,
      value: ids,
    );
  }
}
