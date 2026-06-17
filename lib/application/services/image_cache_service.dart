import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:co_stock/application/services/stock/product_template_service.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/image_repo/i_image_repository.dart';
import 'package:co_stock/domain/core/image/image_asset.dart';
import 'package:co_stock/domain/extensions/iterable_ext.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:path_provider/path_provider.dart';

class ImageCacheService {
  /// DI
  static final ImageCacheService _instance = ImageCacheService._();

  factory ImageCacheService() => _instance;

  ImageCacheService._();

  /// Обращаемся к репозиторию изображений
  final IImageRepository _imageRepository =
      InjectorManager().current.imageRepository;

  /// Создание/получение локальной папки для хранения картинок
  Future<Directory> get _buildImageDir async {
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDir.path}/product_images');
    if (!await dir.exists()) await dir.create(recursive: true);
    _imageDir = dir;
    return dir;
  }

  /// Кэшированные данные директории хранения картинок
  Directory? _imageDir;

  /// Получить директорию хранения картинок
  FutureOr<Directory> get _getImageDir => _imageDir ?? _buildImageDir;

  /// Локальный кэш всех известных ImageAsset (c bytes)
  final List<ImageAsset> _assets = [];

  /// Загрузить и подготовить список ImageAsset.
  /// Для каждого проверяет локальный файл, если нет – качает с сервера.
  /// Возвращает обновлённый список, в котором у некоторых может быть isError = true.
  Future<List<ImageAsset>> loadImages(List<ImageAsset> assets) async {
    /// Готовим список Future, каждый из которых завершается обновлённым ассетом
    final futures = assets.map((asset) async {
      try {
        /// Проверяем локальный файл
        if (asset.localPath != null) {
          final file = File(asset.localPath!);
          if (await file.exists()) {
            final bytes = await file.readAsBytes();
            return asset.copyWith(bytes: bytes);
          }
        }

        /// Если локального нет – загружаем с сервера
        final res = await _imageRepository.downloadImage(asset.url);

        /// Сохраняем файл и обновляем localPath
        return res.fold<FutureOr<ImageAsset>>(
          (f) {
            f.report();
            return asset.copyWith(isError: true);
          },
          (result) async {
            final dir = await _getImageDir;
            final mime = result.$2;
            final bytes = result.$1;
            final ext = mime.extension;
            final fileName = '${asset.id}.$ext';
            final file = File('${dir.path}/$fileName');
            await file.writeAsBytes(bytes);

            final updated = asset.copyWith(
              localPath: file.path,
              bytes: bytes,
              mime: mime,
              isError: false,
            );

            /// Сохраняем метаданные (уже через LocalStorageService)
            await LocalStorageService.saveImageAsset(updated);
            return updated;
          },
        );
      } catch (e, st) {
        AppError.client(type: .smth, error: e, stackTrace: st).report();
        return asset.copyWith(isError: true);
      }
    });

    /// Запускаем параллельно и ждём все
    return await Future.wait(futures);
  }

  /// Удалить изображение, если оно больше не используется ни в одном сервисе.
  Future<void> deleteImageIfUnused(String imageId) async {
    /// Проверка использования в других местах (пока только ProductTemplateService)
    final usedInTemplates = ProductTemplateService().all.any(
      (t) => t.image?.id == imageId,
    );
    if (usedInTemplates) return;

    /// Если нигде ольше не используется - удаляем
    final asset =
        _assets.firstWhereOrNull((a) => a.id == imageId) ??
        await LocalStorageService.getImageAsset(imageId);

    if (asset?.localPath != null) {
      final file = File(asset!.localPath!);
      if (await file.exists()) await file.delete();
    }
    await LocalStorageService.removeImageAsset(imageId);
    _assets.removeWhere((a) => a.id == imageId);
  }

  /// Добавить новое изображение (с дедупликацией по содержимому).
  /// Используется, когда пользователь выбирает картинку из галереи.
  Future<ImageAsset> deduplicateAndSave(ImageAsset newAsset) async {
    if (newAsset.bytes == null) return newAsset; // нечего сохранять

    /// Поиск дубликата по хешу (сравниваем побайтово через файлы)
    final existing = await _findDuplicate(newAsset.bytes!);
    if (existing != null) {
      /// Переиспользуем существующий ассет (не создаём новый файл)
      return existing;
    }

    /// Сохраняем как новый
    final dir = await _getImageDir;
    const ext = 'jpg'; // можно определить из mime, но пока так
    final fileName = '${newAsset.id}.$ext';
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(newAsset.bytes!);
    final updated = newAsset.copyWith(localPath: file.path);
    await LocalStorageService.saveImageAsset(updated);
    _updateCache(updated);
    return updated;
  }

  /// Поиск дубликата по байтам (сравниваем с уже сохранёнными файлами).
  Future<ImageAsset?> _findDuplicate(Uint8List newBytes) async {
    final allAssets = await LocalStorageService.getAllImageAssets();
    for (final asset in allAssets) {
      if (asset.localPath == null) continue;
      final file = File(asset.localPath!);
      if (await file.exists()) {
        final existingBytes = await file.readAsBytes();
        if (bytesEqual(existingBytes, newBytes)) {
          return asset;
        }
      }
    }
    return null;
  }

  /// Сравнение списков байтов
  bool bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  /// Обновление кэшированного списка [_assets]
  void _updateCache(ImageAsset asset) {
    final index = _assets.indexWhere((a) => a.id == asset.id);
    if (index >= 0) {
      _assets[index] = asset;
    } else {
      _assets.add(asset);
    }
  }
}
