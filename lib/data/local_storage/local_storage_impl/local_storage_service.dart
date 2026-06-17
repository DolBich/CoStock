import 'dart:convert';

import 'package:co_stock/data/local_storage/i_local_storage.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_keys.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_mappers.dart';
import 'package:co_stock/domain/core/image/image_asset.dart';
import 'package:co_stock/domain/extensions/color_ext.dart';
import 'package:co_stock/domain/extensions/iterable_ext.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/sort_filter/sort_filter.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';
import 'package:co_stock/presentation/prefs/locale/locale_data.dart';
import 'package:flutter/material.dart';

class LocalStorageService {
  ///
  /// Общие методы
  ///
  static Future<bool> saveData<T>({
    required String key,
    required T value,
  }) async {
    return await ILocalStorage.instance.saveData(key: key, value: value);
  }

  static Future<T?> getData<T>({required String key}) async {
    return await ILocalStorage.instance.getData<T>(key: key);
  }

  static Future<bool> removeData({required String key}) async {
    return await ILocalStorage.instance.removeData(key: key);
  }

  static Future<bool> clearAll() async {
    return await ILocalStorage.instance.clearAll();
  }

  static Future<bool> containsKey({required String key}) async {
    return await ILocalStorage.instance.containsKey(key: key);
  }

  ///
  /// Частные случаи
  ///

  ///
  /// Locale
  ///

  static Future<void> saveAppLocale(AppLocale locale) async {
    await saveData(key: LSKeys.appLocale, value: locale.name);
  }

  static Future<AppLocale?> getAppLocale() async {
    final str = await getData<String>(key: LSKeys.appLocale);
    if (str == null) return null;

    return AppLocale.byName(str);
  }

  static Future<void> savePhoneLocale(AppLocale locale) async {
    await saveData(key: LSKeys.phoneLocale, value: locale.name);
  }

  static Future<AppLocale?> getPhoneLocale() async {
    final str = await getData<String>(key: LSKeys.phoneLocale);
    if (str == null) return null;

    return AppLocale.byName(str);
  }

  ///
  /// Theme
  ///

  static Future<void> saveThemeMode(ThemeMode mode) async {
    await saveData(key: LSKeys.themeMode, value: mode.name);
  }

  static Future<ThemeMode?> getThemeMode() async {
    final str = await getData<String>(key: LSKeys.themeMode);
    if (str == null) return null;

    return ThemeMode.values.firstWhereOrNull((e) => e.name == str);
  }

  static Future<void> saveThemeSeed(Color seed) async {
    await saveData<Map<String, double>>(
      key: LSKeys.themeSeed,
      value: seed.toJson(),
    );
  }

  static Future<Color?> getThemeSeed() async {
    final map = await getData<Map<String, double>>(key: LSKeys.themeSeed);
    if (map == null) return null;

    return ColorExt.fromJsonOrNull(map);
  }

  static Future<void> saveUseSeed(bool useSeed) async {
    await saveData(key: LSKeys.useSeed, value: useSeed);
  }

  static Future<bool?> getUseSeed() async {
    final useSeed = await getData<bool>(key: LSKeys.useSeed);

    return useSeed;
  }

  ///
  /// Repositories
  ///

  static Future<void> saveUseMock(bool useMock) async {
    await saveData(key: LSKeys.useMock, value: useMock);
  }

  static Future<bool?> getUseMock() async {
    final useMock = await getData<bool>(key: LSKeys.useMock);

    return useMock;
  }

  ///
  /// Profile
  ///

  static Future<void> saveAuth(String id) async {
    await saveData(key: LSKeys.userId, value: id);
  }

  static Future<void> removeAuth() async {
    await removeData(key: LSKeys.userId);
  }

  static Future<String?> getAuth() async {
    final id = await getData<String>(key: LSKeys.userId);

    return id;
  }

  ///
  /// Images
  ///

  /// Сохранить информацию об ImageAsset (без bytes).
  static Future<void> saveImageAsset(ImageAsset asset) async {
    final map = asset.toJson();
    /// Сохраняем конкретный [ImageAsset]
    await saveData(
      key: '${LSKeys.imageAssetPrefix}${asset.id}',
      value: jsonEncode(map),
    );
    /// Обновляем список id
    final ids = await getData<List<String>>(key: LSKeys.imageAssetIds) ?? [];
    if (!ids.contains(asset.id)) {
      ids.add(asset.id);
      await saveData<List<String>>(key: LSKeys.imageAssetIds, value: ids);
    }
  }

  /// Загрузить информацию об ImageAsset (без bytes).
  static Future<ImageAsset?> getImageAsset(String id) async {
    final raw = await getData<String>(key: '${LSKeys.imageAssetPrefix}$id');
    if (raw == null) return null;
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return ImageAsset.fromJson(map);
  }

  /// Удалить информацию об ImageAsset и обновить список id.
  static Future<void> removeImageAsset(String id) async {
    await removeData(key: '${LSKeys.imageAssetPrefix}$id');
    final ids = await getData<List<String>>(key: LSKeys.imageAssetIds) ?? [];
    ids.remove(id);
    await saveData<List<String>>(key: LSKeys.imageAssetIds, value: ids);
  }

  /// Загрузить список всех ImageAsset (без bytes).
  static Future<List<ImageAsset>> getAllImageAssets() async {
    final ids = await getData<List<String>>(key: LSKeys.imageAssetIds) ?? [];
    final assets = <ImageAsset>[];
    for (final id in ids) {
      final asset = await getImageAsset(id);
      if (asset != null) assets.add(asset);
    }
    return assets;
  }

  ///
  /// Stock
  ///

  /// Ключ для обращения к конкретной сущности
  static String stockEntityKey(String id) => '${LSKeys.stockEntityPrefix}$id';

  /// Сохраняет одну сущность (точечно).
  static Future<void> saveStockEntity(StockEntity entity) async {
    final dto = StockEntityDto.fromDomain(entity).copyWith(
      parentId: entity.parent?.id,
      children: [], // не сохраняем рекурсию
    );
    await saveData(key: stockEntityKey(dto.id), value: jsonEncode(dto.toLocalJson()));

    /// Обновляем список всех id
    final ids = await getData<List<String>>(key: LSKeys.stockEntityIds) ?? [];
    if (!ids.contains(dto.id)) {
      ids.add(dto.id);
      await saveData<List<String>>(key: LSKeys.stockEntityIds, value: ids);
    }
  }

  /// Удаляет сущность и рекурсивно всех потомков.
  static Future<void> deleteStockEntityRecursive(String id) async {
    /// Удаляем запись самой сущности
    await removeData(key: stockEntityKey(id));

    /// Удаляем из общего списка
    final ids =
        (await getData<List<dynamic>>(
          key: LSKeys.stockEntityIds,
        ))?.cast<String>() ??
        [];
    ids.remove(id);
    await saveData<List<String>>(key: LSKeys.stockEntityIds, value: ids);

    /// Рекурсивно удаляем детей, если это группа
    final childrenIds = await _getChildrenIds(id);
    for (final childId in childrenIds) {
      await deleteStockEntityRecursive(childId);
    }
  }

  /// Обновляет имя сущности (не меняя связей).
  static Future<void> updateStockEntityName(String id, String newName) async {
    final raw = await getData<String>(key: stockEntityKey(id));
    if (raw != null) {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      json['name'] = newName;
      await saveData(key: stockEntityKey(id), value: jsonEncode(json));
    }
  }

  /// Сохраняет всё дерево целиком (используется при начальной загрузке с сервера).
  static Future<void> replaceAllStockEntities(List<StockEntity> roots) async {
    /// Очищаем все старые ключи
    final oldIds =
        (await getData<List<dynamic>>(
          key: LSKeys.stockEntityIds,
        ))?.cast<String>() ??
        [];
    for (final id in oldIds) {
      await removeData(key: stockEntityKey(id));
    }

    /// Сохраняем новые
    for (final root in roots) {
      await _saveSubtree(root);
    }
  }

  /// Загружает всё дерево из локального хранилища.
  static Future<List<StockEntity>?> loadStockTree() async {
    final allIds =
        (await getData<List<dynamic>>(
          key: LSKeys.stockEntityIds,
        ))?.cast<String>() ??
        [];
    final Map<String, StockEntityDto> dtoMap = {};
    for (final id in allIds) {
      final raw = await getData<String>(key: stockEntityKey(id));
      if (raw != null) {
        final json = jsonDecode(raw) as Map<String, dynamic>;
        final dto = StockEntityDto.fromJson({
          ...json,
          'children': [], // локально children не храним
        });
        dtoMap[dto.id] = dto;
      }
    }

    /// Восстанавливаем иерархию DTO (заполняем children)
    final rootDtos = _buildDtoTree(dtoMap);

    /// Восстанавливаем дерево
    final mapper = StockMapper();
    return mapper(rootDtos);
  }

  /// Строит список корневых DTO с вложенными children из плоского словаря.
  static List<StockEntityDto> _buildDtoTree(
    Map<String, StockEntityDto> dtoMap
  ) {
    /// Собираем id детей для каждого родителя
    final childrenMap = <String, List<String>>{};
    for (final dto in dtoMap.values) {
      if (dto.parentId != null) {
        childrenMap.putIfAbsent(dto.parentId!, () => []).add(dto.id);
      }
    }

    /// Строим DTO с заполненными children
    StockEntityDto buildWithChildren(String id) {
      final dto = dtoMap[id]!;
      final childIds = childrenMap[id] ?? [];
      final children = childIds.map(buildWithChildren).toList();
      return dto.copyWith(children: children);
    }

    /// Находим корни
    final rootIds = dtoMap.values
        .where((dto) => dto.parentId == null)
        .map((dto) => dto.id)
        .toList();

    return rootIds.map(buildWithChildren).toList();
  }

  /// Собирает Ids детей группы [StockGroup]
  static Future<List<String>> _getChildrenIds(String parentId) async {
    final allIds =
        (await getData<List<dynamic>>(
          key: LSKeys.stockEntityIds,
        ))?.cast<String>() ??
        [];
    final children = <String>[];
    for (final id in allIds) {
      final raw = await getData<String>(key: stockEntityKey(id));
      final json = raw != null ? jsonDecode(raw) as Map<String, dynamic> : null;
      if (json?['parentId'] == parentId) {
        children.add(id);
      }
    }
    return children;
  }

  /// Сохраняет ветку
  static Future<void> _saveSubtree(StockEntity node) async {
    await saveStockEntity(node);
    if (node is StockGroup) {
      for (final child in node.children) {
        await _saveSubtree(child);
      }
    }
  }

  /// Сохраняет данные SortArrangement как JSON-строку
  static Future<void> saveSortArrangementData(Map<String, dynamic> data) async {
    await saveData(key: LSKeys.sortArrangementKey, value: jsonEncode(data));
  }

  /// Загружает данные SortArrangement; возвращает null, если данных нет
  static Future<Map<String, dynamic>?> loadSortArrangementData() async {
    final raw = await getData<String>(key: LSKeys.sortArrangementKey);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  /// Сохраняет выбранный режим сортировки (null = без сортировки)
  static Future<void> saveSortMode(SortMode? mode) async {
    if(mode == null) {
      await removeData(key: LSKeys.sortModeKey);
      return;
    }

    await saveData(key: LSKeys.sortModeKey, value: mode.name);
  }

  /// Загружает сохранённый режим сортировки
  static Future<SortMode?> getSortMode() async {
    final str = await getData<String>(key: LSKeys.sortModeKey);
    if (str == null) return null;
    return SortMode.values.firstWhereOrNull((e) => e.name == str);
  }

  ///
  /// Stock Items
  ///

  /// Ключ для обращения к конкретному предмету хранилища
  static String stockItemKey(String stockId, String itemId) =>
      '${LSKeys.stockItemPrefix}${stockId}_$itemId';

  /// Ключ для обращения ко всем предметам определённого хранилища
  static String stockItemsKey(String stockId) =>
      '${LSKeys.stockItemIdsPrefix}$stockId';

  /// Сохраняет/обновляет один StockItem.
  static Future<void> saveStockItem(String stockId, StockItemDto item) async {
    await saveData(key: stockItemKey(stockId, item.id), value: jsonEncode(item.toJson()));

    /// Обновляем список id предметов этого склада
    final ids =
        (await getData<List<dynamic>>(key: stockItemsKey(stockId)) ?? [])
            .cast<String>();
    if (!ids.contains(item.id)) {
      ids.add(item.id);
      await saveData<List<String>>(key: stockItemsKey(stockId), value: ids);
    }
  }

  /// Удаляет один StockItem.
  static Future<void> deleteStockItem(String stockId, String itemId) async {
    await removeData(key: stockItemKey(stockId, itemId));

    final ids =
        (await getData<List<dynamic>>(key: stockItemsKey(stockId)) ?? [])
            .cast<String>();
    ids.remove(itemId);
    await saveData<List<String>>(key: stockItemsKey(stockId), value: ids);
  }

  /// Загружает все предметы конкретного склада.
  static Future<List<StockItemDto>?> loadStockItems(String stockId) async {
    final ids =
        (await getData<List<dynamic>>(key: stockItemsKey(stockId)) ?? [])
            .cast<String>();
    if (ids.isEmpty) return [];

    final items = <StockItemDto>[];
    for (final itemId in ids) {
      final raw = await getData<String>(
        key: stockItemKey(stockId, itemId),
      );
      if (raw != null) {
        final json = jsonDecode(raw) as Map<String, dynamic>;
        items.add(StockItemDto.fromJson(json));
      }
    }
    return items;
  }

  /// Полностью заменяет все предметы склада (после синхронизации с сервером).
  static Future<void> replaceStockItems(
    String stockId,
    List<StockItemDto> items,
  ) async {
    /// Удаляем старые предметы
    final oldIds =
        (await getData<List<dynamic>>(key: stockItemsKey(stockId)) ?? [])
            .cast<String>();
    for (final id in oldIds) {
      await removeData(key: stockItemKey(stockId, id));
    }

    /// Сохраняем новые
    final newIds = <String>[];
    for (final item in items) {
      await saveData(key: stockItemKey(stockId, item.id), value: jsonEncode(item.toJson()));
      newIds.add(item.id);
    }
    await saveData<List<String>>(key: stockItemsKey(stockId), value: newIds);
  }
}
