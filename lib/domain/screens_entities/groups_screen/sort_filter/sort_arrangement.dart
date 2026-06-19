import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/dto/stock_entities_dtos.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_arrangement.freezed.dart';
part 'sort_arrangement.g.dart';

/// [parentId -> List<childId>] - порядок расположение детей в родителе
typedef Arrangement = Map<String, List<String>>;

/// Класс для управлением расположения сущностей относительно друг друга в
/// отрисовке
@freezed
abstract class SortArrangement with _$SortArrangement {
  /// Собственный стандартный конструктор (не factory) позволяет в файле
  /// .freezed унаследовать класс через extends, а не через implements
  /// что позволяет нам расписать все методы здесь, а не в extension
  const SortArrangement._();

  const factory SortArrangement({
    /// Порядок для кастомного режима (sortMode == null).
    @Default({}) Arrangement customOrder,

    /// Порядок для режима сортировки (sortMode != null).
    /// Ключ: parentId (или '__roots__').
    /// Значение: key - parentId, value - распределение сущностей
    /// среди всех сущностей одного типа
    @Default({}) Map<String, Map<StockEntityType, List<String>>> sortOrder,
  }) = _SortArrangement;

  factory SortArrangement.fromJson(Map<String, dynamic> json) =>
      _$SortArrangementFromJson(json);

  /// parentId для корневых сущностей для сохранения в локальном хранилище
  static const String roots = '__roots__';

  /// ---------------------------------------------------------------------------
  /// LocalStorage
  /// ---------------------------------------------------------------------------
  static Future<SortArrangement> load() async {
    final data = await LocalStorageService.loadSortArrangementData();
    return data != null
        ? SortArrangement.fromJson(data)
        : const SortArrangement(customOrder: {}, sortOrder: {});
  }

  Future<void> save() async {
    await LocalStorageService.saveSortArrangementData(toJson());
  }

  /// ---------------------------------------------------------------------------
  /// Получение отображаемого распорядка
  /// ---------------------------------------------------------------------------

  /// Порядок для кастомного режима (без сортировки).
  /// [parentId] == null - корневая группа
  List<StockEntity> getCustomOrderedList({
    required String? parentId,
    required List<StockEntity> physicalChildren,
  }) {
    final order = customOrder[parentId ?? roots];
    if (order == null) return physicalChildren;
    return _buildList(physicalChildren, order);
  }

  /// Получение отображаемых секций при сортировке
  /// [parentId] == null - корневая группа
  ({List<StockEntity> groups, List<StockEntity> stocks}) getSortedSections({
    required String? parentId,
    required List<StockEntity> physicalChildren,
  }) {
    final parentOrders = sortOrder[parentId ?? roots];
    final groupOrder = parentOrders?[StockEntityType.group] ?? [];
    final stockOrder = parentOrders?[StockEntityType.stock] ?? [];

    final groups = _buildTypedList(physicalChildren, groupOrder, .group);
    final stocks = _buildTypedList(physicalChildren, stockOrder, .stock);
    return (groups: groups, stocks: stocks);
  }

  /// ---------------------------------------------------------------------------
  /// Публичные методы обновления (иммутабельные)
  /// ---------------------------------------------------------------------------

  /// Обновление кастомного порядка (без сортировки)
  /// [parentId] == null - корневая группа
  /// После использования надо не забыть сохранить изменения локально через [save]
  SortArrangement withUpdatedCustomOrder(
      String? parentId,
      List<String> newOrder,
      ) {
    final newCustom = Map<String, List<String>>.from(customOrder);
    newCustom[parentId ?? roots] = newOrder;
    return copyWith(customOrder: newCustom);
  }

  /// Обновления порядка сортировки
  /// [parentId] == null - корневая группа
  /// После использования надо не забыть сохранить изменения локально через [save]
  SortArrangement withUpdatedSortOrder({
    required String? parentId,
    required StockEntityType type,
    required List<String> newOrder,
  }) {
    final newSortOrder = Map<String, Map<StockEntityType, List<String>>>.from(
      sortOrder,
    );
    newSortOrder[parentId ?? roots] ??= {};
    newSortOrder[parentId ?? roots] = Map<StockEntityType, List<String>>.from(
      newSortOrder[parentId ?? roots]!,
    );
    newSortOrder[parentId ?? roots]![type] = newOrder;
    return copyWith(sortOrder: newSortOrder);
  }

  /// ---------------------------------------------------------------------------
  /// Приватные
  /// ---------------------------------------------------------------------------

  /// Построение упорядоченного списка сущностей из физического списка
  List<StockEntity> _buildTypedList(
      List<StockEntity> allChildren,
      List<String> order,
      StockEntityType type,
      ) {
    final typedEntities = allChildren.where((e) => e.type == type).toList();
    return _buildList(typedEntities, order);
  }

  /// Приватный метод, строящий список по сохранённому порядку id (для кастомного)
  List<StockEntity> _buildList(List<StockEntity> entities, List<String> order) {
    final entityMap = {for (final e in entities) e.id: e};
    final result = <StockEntity>[];
    final seen = <String>{};

    /// Пропускаем в результат недублирующиеся сущности
    /// Пропускаем из order те, что были удалены (нет в физических)
    /// Пропускаем из физических [allChildren] те, что ещё не были обновлены,
    /// т.е. добавлены в [order]
    for (final id in order) {
      if (entityMap.containsKey(id) && seen.add(id)) {
        result.add(entityMap[id]!);
      }
    }

    /// Добавляем в конец списка физические сущности, которые ещё не были обновлены,
    /// добавлены в [order]
    /// По идее, они могли оказаться только в конце списка в таком сценарии
    for (final e in entities) {
      if (seen.add(e.id)) {
        result.add(e);
      }
    }
    return result;
  }
}
