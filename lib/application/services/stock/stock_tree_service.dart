import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';

/// Сервис для сборки, изменения, кэширования и трансформации данных о дереве
/// сущностей [StockEntity].
class StockTreeService {
  const StockTreeService._();

  /// Dependency Injector (DI)
  static const StockTreeService _internal = StockTreeService._();
  factory StockTreeService() => _internal;

  /// Хранилище всех сущностей: id → StockEntity.
  static final Map<String, StockEntity> _entities = {};

  /// Закэшированный список корневых сущностей.
  static List<StockEntity>? _cachedRoots;

  /// Идентификаторы корневых сущностей (для быстрой проверки).
  static List<String> _rootIds = [];

  /// Признак актуальности кэша корней.
  static bool _rootsValid = false;

  /// ---------------------------------------------------------------------------
  /// Публичный API
  /// ---------------------------------------------------------------------------

  /// Полностью заменяет текущее дерево сервиса на переданные корни.
  void replaceTree(List<StockEntity> newRoots) {
    _entities.clear();
    for (final root in newRoots) {
      _addEntityTreeInternal(root);
    }

    _rebuildRoots();
  }

  /// Возвращает корневые сущности (кэшировано).
  List<StockEntity> get rootEntities {
    if (!_rootsValid || _cachedRoots == null) {
      _rebuildRoots();
    }
    return _cachedRoots!;
  }

  /// Быстрый поиск сущности по id.
  StockEntity? findEntityById(String id) => _entities[id];

  /// Добавляет сущность в конец списка
  void addEntity(StockEntity entity, String? parentId) {
    final parent = parentId != null ? _entities[parentId] : null;
    final insertIndex = (parent is StockGroup) ? parent.children.length : 0;
    insertEntity(entity, parentId, insertIndex);
  }

  /// Удаляет всю ветку: сущность + все её потомки.
  void removeEntityTree(StockEntity root) {
    /// Удаляем из родителя
    final parent = root.parent;
    if (parent != null && _entities.containsKey(parent.id)) {
      if (parent is StockGroup) {
        final updatedChildren = parent.children
            .where((c) => c.id != root.id)
            .toList();
        _setParentChildren(parent, updatedChildren);
      }
    }

    /// Рекурсивно удаляем потомков
    if (root is StockGroup) {
      for (final child in root.children) {
        removeEntityTree(child);
      }
    }

    /// Удаляем саму сущность
    _entities.remove(root.id);
    _invalidateCache();
  }

  /// Вставляет новую сущность на конкретное место.
  /// [parentId] – id родителя (null для корня).
  /// [index] – позиция среди детей родителя.
  void insertEntity(StockEntity entity, String? parentId, int index) {
    /// Создаём копию с правильным родителем
    final parent = parentId != null ? _entities[parentId] : null;
    final entityWithParent = entity.copyWith(parent: parent);
    _entities[entity.id] = entityWithParent;

    /// Добавляем в детей родителю
    if (parent is StockGroup) {
      final children = List<StockEntity>.from(parent.children);
      final clampedIndex = index.clamp(0, children.length);
      children.insert(clampedIndex, entityWithParent);
      _setParentChildren(parent, children);
    }

    _invalidateCache();
  }

  /// Перемещает узел [nodeId] под нового родителя [newParentId] на позицию [newIndex].
  void moveNode(String nodeId, String? newParentId, int newIndex) {
    final entity = _entities[nodeId];
    if (entity == null) {
      AppError.client(
        type: .state,
        error: Exception('В дереве не найден узел с id: [$nodeId] для перемещения'),
        stackTrace: .current,
      ).report();
      return;
    }

    /// Удаляем из старого родителя
    final oldParent = entity.parent;
    if (oldParent is StockGroup) {
      final oldChildren = List<StockEntity>.from(oldParent.children);
      oldChildren.removeWhere((e) => e.id == nodeId);
      _setParentChildren(oldParent, oldChildren);
    }

    /// Новый родитель
    final newParent = newParentId != null ? _entities[newParentId] : null;

    /// Обновляем parent у всей ветки рекурсивно
    final updatedEntity = deepUpdateParent(entity, newParent);
    _entities[nodeId] = updatedEntity;

    /// Вставляем в нового родителя с учётом индекса
    if (newParent is StockGroup) {
      final newChildren = List<StockEntity>.from(newParent.children);
      final clampedIndex = newIndex.clamp(0, newChildren.length);
      newChildren.insert(clampedIndex, updatedEntity);
      _setParentChildren(newParent, newChildren);
    }

    _invalidateCache();
  }

  /// Точечно заменяет сущность (например, после переименования).
  void updateEntity(StockEntity updatedEntity) {
    if (_entities.containsKey(updatedEntity.id)) {
      _entities[updatedEntity.id] = updatedEntity;
      _invalidateCache();
    }
  }

  /// Возвращает минимальный уникальный префикс из имён для заданного пути.
  ///
  /// Алгоритм: идём от самого глубокого узла вверх и собираем суффикс из имён.
  /// Как только суффикс становится уникальным среди всех узлов с таким же именем,
  /// возвращаем накопленные имена в порядке от корня к текущему узлу.
  List<String> getSmartBreadcrumbs(List<StockEntity> path) {
    if (path.isEmpty) return [];

    /// от текущего к корню
    final reversed = path.reversed.toList();
    final List<String> namesStack = [];

    for (final entity in reversed) {
      /// вставляем в начало, чтобы порядок от корня
      namesStack.insert(0, entity.name);
      if (_isUniqueSuffix(path, namesStack.length)) {
        return namesStack;
      }
    }

    /// Если весь путь уникален
    return path.map((e) => e.name).toList();
  }

  /// Рекурсивно обновляет parent у переданного узла и всех его потомков.
  StockEntity deepUpdateParent(StockEntity entity, StockEntity? newParent) {
    final withParent = entity.copyWith(parent: newParent);
    if (withParent is StockGroup) {
      final updatedChildren = withParent.children
          .map((child) => deepUpdateParent(child, withParent))
          .toList();
      return withParent.copyWith(children: updatedChildren);
    }
    return withParent;
  }

  /// ---------------------------------------------------------------------------
  /// Приватные методы
  /// ---------------------------------------------------------------------------

  /// Приватный метод массового добавления ветки в плоскую карту.
  void _addEntityTreeInternal(StockEntity root) {
    _entities[root.id] = root;
    if (root is StockGroup) {
      for (final child in root.children) {
        _addEntityTreeInternal(child);
      }
    }
  }

  /// Обновляет связь родителя-детей
  void _setParentChildren(StockEntity parent, List<StockEntity> newChildren) {
    if (parent is StockGroup) {
      final updated = parent.copyWith(children: newChildren);
      _entities[parent.id] = updated;
    }
  }

  /// Перестраивает кэш корней на основе текущих сущностей.
  void _rebuildRoots() {
    _rootIds = _entities.values
        .where((e) => e.parent == null)
        .map((e) => e.id)
        .toList();
    _cachedRoots = _rootIds.map((id) => _entities[id]!).toList();
    _rootsValid = true;
  }

  /// Сбрасывает кэш корней.
  void _invalidateCache() {
    _rootsValid = false;
    _cachedRoots = null;
  }

  /// Проверяет, что суффикс пути, начиная с конца длиной [suffixLength],
  /// является уникальным среди всех сущностей дерева.
  ///
  /// [fullPath] – полный путь от корня до целевого узла.
  /// [suffixLength] – сколько последних элементов пути составляют проверяемый суффикс.
  bool _isUniqueSuffix(List<StockEntity> fullPath, int suffixLength) {
    final suffixStart = fullPath.length - suffixLength;
    final suffix = fullPath.sublist(suffixStart);
    final suffixNames = suffix.map((e) => e.name).toList();

    int count = 0;
    for (final entity in _entities.values) {
      if (_matchesSuffix(entity, suffixNames)) {
        count++;
        if (count > 1) return false;
      }
    }
    return count == 1;
  }

  /// Проверяет, что цепочка предков от [entity] вверх на [suffixNames.length]
  /// совпадает по именам с [suffixNames] (от самой сущности вверх).
  bool _matchesSuffix(StockEntity entity, List<String> suffixNames) {
    StockEntity? current = entity;
    for (int i = suffixNames.length - 1; i >= 0; i--) {
      if (current == null || current.name != suffixNames[i]) return false;
      current = current.parent;
    }
    return true;
  }
}
