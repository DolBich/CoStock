part of 'groups_bloc.dart';

@freezed
sealed class GroupsState with _$GroupsState {
  const GroupsState._();

  const factory GroupsState({
    @Default(false) bool isLoading,
    @Default([]) List<StockEntity> savedRootEntities,

    /// id открытой группы (null = корневой уровень)
    StockEntity? currentNode,

    /// Физические сущности из [_treeService]
    @Default([]) List<StockEntity> currentChildren,

    /// Фильтрация + сортировка
    SortMode? sortMode,
    FilterMode? filterMode,

    /// Управление порядком отображения
    @Default(SortArrangement()) SortArrangement arrangement,

    @Default('') String searchQuery,

    /// Режим редактирования
    @Default(false) bool isEditMode,
    @Default([]) List<MovingEntityInfo> movingEntities,
    @Default([]) List<StockEntity> selectedEntities,
    @Default([]) List<StockEntity> editRootEntities,
  }) = _GroupsState;

  String? get currentNodeId => currentNode?.id;

  List<String> get movingIds => movingEntities.map((e) => e.entity.id).toList();

  List<String> get selectedIds => selectedEntities.map((e) => e.id).toList();

  /// В режиме редактирования мы отдельно прибавляем moving entities к нынешним
  /// детям в соответствии с их индексами
  List<StockEntity> get children {
    if (!isEditMode) return currentChildren;

    /// Извлекаем id перемещаемых, чтобы исключить дубли
    final baseChildren = currentChildren
        .where((c) => !movingIds.contains(c.id))
        .toList();

    /// Сортируем перемещаемые по originalIndex, затем по порядку в списке (стабильно)
    final sortedMoving = List<MovingEntityInfo>.from(movingEntities)
      ..sort((a, b) => a.originalIndex.compareTo(b.originalIndex));

    /// Вставляем перемещаемые на их originalIndex (с clamp)
    /// Учитываем увеличение списка при добавлении перемещаемых элементов
    for (int i = 0; i < sortedMoving.length; i++) {
      final moving = sortedMoving[i];
      final insertIndex = moving.originalIndex.clamp(
        0,
        baseChildren.length + i,
      );
      baseChildren.insert(insertIndex, moving.entity);
    }

    return baseChildren;
  }

  List<StockEntity> applySearch(List<StockEntity> entities) {
    if (searchQuery.isEmpty) return entities;
    final query = searchQuery.toLowerCase();
    return entities
        .where((e) => e.name.toLowerCase().contains(query))
        .toList();
  }

  /// Отображаемый список для кастомного режима (без сортировки).
  List<StockEntity> get customOrderedChildren =>
      arrangement.getCustomOrderedList(
        parentId: currentNodeId,
        physicalChildren: currentChildren,
      );

  /// Отображаемые секции для режима сортировки.
  ({List<StockEntity> groups, List<StockEntity> stocks}) get sortedSections =>
      arrangement.getSortedSections(
        parentId: currentNodeId,
        physicalChildren: currentChildren,
      );

  /// Проверка на доступность/необходимости сохранится
  bool get hasChanges =>
      !_areStockTreesEqual(savedRootEntities, editRootEntities);

  bool _areStockTreesEqual(List<StockEntity> a, List<StockEntity> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (!_areEntitiesEqual(a[i], b[i])) return false;
    }
    return true;
  }

  bool _areEntitiesEqual(StockEntity a, StockEntity b) {
    if (a.id != b.id) return false;
    if (a.name != b.name) return false;
    if (a.type != b.type) return false;
    if (a is StockGroup && b is StockGroup) {
      if (a.children.length != b.children.length) return false;
      for (int i = 0; i < a.children.length; i++) {
        if (!_areEntitiesEqual(a.children[i], b.children[i])) return false;
      }
    } else if (a is StockGroup || b is StockGroup) {
      return false;
    }
    return true;
  }
}



/// Нужен исключительно для того, чтобы отслеживать на какое место в новом списке
/// детей вставить перемещаемый объект
class MovingEntityInfo {
  final StockEntity entity;

  /// индекс в родителе, когда сущность была взята
  final int originalIndex;

  const MovingEntityInfo({required this.entity, required this.originalIndex});
}
