part of 'groups_bloc.dart';

@freezed
abstract class GroupsEvent with _$GroupsEvent {
  /// Подгружает всё дерево сущностей [StockEntity]
  const factory GroupsEvent.loadTree() = _LoadTree;

  /// Выбирает сущность для навигации
  /// Если [entity] == null - переводим в корневую папку
  const factory GroupsEvent.navigateNode(StockEntity? entity) = _NavigateNode;

  /// Добавляет новую сущность [StockEntity]
  const factory GroupsEvent.addNode({
    required String name,
    required StockEntityType type,
  }) = _AddNode;

  /// Удаляет сущность [StockEntity]
  const factory GroupsEvent.deleteNode(String nodeId) = _DeleteNode;

  /// Обновляет сущность [StockEntity]
  const factory GroupsEvent.updateNode({
    required String nodeId,
    required String newName,
    String? newParentId,
  }) = _UpdateNode;

  /// Применяет новые настройки фильтрации и сортировки
  /// [null] - отменяем сортировку/фильтрацию
  const factory GroupsEvent.applySortFilter({
    required SortMode? sortMode,
    required FilterMode? filterMode,
  }) = _ApplySortFilter;

  /// Перемещает сущность в пределах одного экрана
  const factory GroupsEvent.moveNode({
    required StockEntity node,
    required String? newParentId,
    required int newIndex,
    required int oldIndex,
  }) = _MoveNode;

  ///
  /// Режим редактирования
  ///

  /// Смена режима рабочий/редактирования
  const factory GroupsEvent.toggleEditMode() = _ToggleEditMode;

  /// Выбрать сущность для редактирования
  const factory GroupsEvent.selectEntity(StockEntity entity) = _SelectEntity;

  /// Перевод выбранных сущностей в категорию перемещаемых и обратно (в невыбранные)
  const factory GroupsEvent.toggleMoveEntities() = _ToggleMoveEntities;

  /// Подтвердить перенос единичной сущности на новое место
  const factory GroupsEvent.confirmMoveEntity(String id) = _ConfirmMoveEntity;

  /// Удалить все выбранные сущности
  const factory GroupsEvent.deleteSelectedEntities() = _DeleteSelectedEntities;

  /// Сохранение изменений
  const factory GroupsEvent.saveEditedTree() = _SaveEditedTree;
}
