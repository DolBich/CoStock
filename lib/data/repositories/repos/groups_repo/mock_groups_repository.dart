import 'package:co_stock/application/handlers/stock/stock_entity_searcher.dart';
import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/application/tools/id_setter.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/dto/stock_entities_dtos.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/dto/stock_mappers.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/i_groups_repository.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';
import 'package:fpdart/fpdart.dart';

class MockGroupsRepository extends IGroupsRepository with MockRepoDelay {
  /// Мы разделаем информацию на [_entities], [_parentMap], [_childrenMap],
  /// [_items] для лучшей имитации бэкэнда, а также для избегания рекурсивного
  /// перестраивания дерева - можем обойтись только изменением связей как например
  /// в методах [addNode], [deleteNode], [updateNode]
  /// А само дерево собирается только при возврате данных клиенту через [_buildRootEntities]

  MockGroupsRepository() {
    /// Получаем начальные данные репозитория из локального хранилища
    init();
  }

  /// Инициализирует репозиторий данными из локального хранилища.
  /// Вызовите этот метод перед началом использования.
  Future<void> init() async {
    final roots = await LocalStorageService.loadStockTree();
    if (roots == null) return;

    /// Рекурсивно обходим дерево и заполняем структуры
    void traverse(StockEntity entity, String? parentId) {
      /// [children] будут потом сохранены отдельно в [_childrenMap]
      final dto = StockEntityDto.fromDomain(entity).copyWith(children: []);

      /// обновляет [_entities], [_parentMap] и [_childrenMap[parentId]]
      _saveEntity(dto, parentId);

      if (entity is StockGroup) {
        for (final child in entity.children) {
          traverse(child, entity.id);
        }
      }
    }

    for (final root in roots) {
      /// корни: parentId = null
      traverse(root, null);
    }
  }

  /// Данные DTO в плоском виде
  final Map<String, StockEntityDto> _entities = {};

  /// Хранит только связь того, чей это родитель id -> parentId
  final Map<String, String?> _parentMap = {};

  /// Связь какие у узла дети id -> [childId, ...]
  final Map<String, List<String>> _childrenMap = {};

  /// Единая точка обновления наших разделённых данных
  void _saveEntity(StockEntityDto dto, String? parentId) {
    final id = dto.id;
    _entities[id] = dto;
    _parentMap[id] = parentId;
    _childrenMap.putIfAbsent(id, () => []);

    if (parentId != null) {
      _childrenMap.putIfAbsent(parentId, () => []);
      if (!_childrenMap[parentId]!.contains(id)) {
        _childrenMap[parentId]!.add(id);
      }
    }
  }

  /// Строит [StockEntityDto] для заданного id исходя из его связей с детьми
  StockEntityDto _buildDtoWithChildren(String id) {
    final dto = _entities[id]!;
    final childIds = _childrenMap[id] ?? [];
    final childrenDtos = childIds
        .map((childId) => _buildDtoWithChildren(childId))
        .toList();
    return dto.copyWith(children: childrenDtos);
  }

  /// Возвращает список корневых DTO (с вложенными детьми).
  List<StockEntityDto> _buildRootDtos() {
    /// Находит корневые сущности (у них нет родителей)
    final rootIds = _parentMap.entries
        .where((entry) => entry.value == null)
        .map((entry) => entry.key)
        .toList();

    /// Строим для них [StockEntityDto]
    return rootIds.map((id) => _buildDtoWithChildren(id)).toList();
  }

  /// Возвращаем наше дерево [StockEntity]
  List<StockEntity> _buildRootEntities() {
    /// Строим дерево [StockEntityDto]
    final rootDtos = _buildRootDtos();

    /// Переводим дерево [StockEntityDto] в дерево [StockEntity]
    final mapper = StockMapper();
    return mapper(rootDtos);
  }

  /// Ищет узел среди всех корней и их потомков
  StockEntity? _findEntityById(String id) =>
      _buildRootEntities().findEntityById(id);

  @override
  Future<Either<AppError, List<StockEntity>?>?> getUserTreeIfChanged({
    required String userId,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    /// всегда "изменений нет"
    return right(null);
  }

  @override
  Future<Either<AppError, List<StockEntity>>?> getUserTree({
    required String userId,
    CancelToken? cancelToken,
  }) async {
    /// Имитация задержки с возможностью отмены операции через cancelToken
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      /// Построение дерева [StockEntity]
      final roots = _buildRootEntities();
      return right(roots);
    } catch (e, st) {
      return left(.client(type: .smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, Unit>?> saveFullTree({
    required String userId,
    required List<StockEntity> roots,
    CancelToken? cancelToken,
  }) async {
    ///Имитация задержки с возможной отменой
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      /// Очищаем текущее состояние
      _entities.clear();
      _parentMap.clear();
      _childrenMap.clear();

      /// Рекурсивно сохраняем дерево
      void saveRecursive(StockEntityDto dto, String? parentId) {
        _saveEntity(dto, parentId);
        if (dto.children.isNotEmpty) {
          for (final childDto in dto.children) {
            saveRecursive(childDto, dto.id);
          }
        }
      }

      for (final root in roots) {
        final dto = StockEntityDto.fromDomain(root);
        saveRecursive(dto, null);
      }

      return right(unit);
    } catch (e, st) {
      return left(.client(type: .smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, StockEntity>?> addNode({
    required String userId,
    required String name,
    required StockEntityType type,
    String? parentId,
    CancelToken? cancelToken,
  }) async {
    /// Имитация задержки с возможностью отмены операции через cancelToken
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      /// Добавление id сущности на сервере
      final id = IdSetter()();
      final dto = StockEntityDto(id: id, name: name, type: type, children: []);

      /// Сохранение на сервере и проверка, что сохранилось корректно
      _saveEntity(dto, parentId);
      final created = _findEntityById(id);
      if (created == null) {
        return left(
          .client(
            type: .state,
            error: Exception('Failed to create node'),
            stackTrace: .current,
          ),
        );
      }

      return right(created);
    } catch (e, st) {
      return left(.client(type: .smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, StockEntity>?> updateNode({
    required String userId,
    required String nodeId,
    required String newName,
    CancelToken? cancelToken,
  }) async {
    /// Имитация задержки с возможностью отмены операции через cancelToken
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      /// Поиск изменяемой сущности [StockEntity]
      final oldDto = _entities[nodeId];
      if (oldDto == null) {
        return left(
          .client(
            type: .state,
            error: Exception('Node $nodeId not found on [updateNode]'),
          ),
        );
      }

      /// Обновляем только имя
      final updatedDto = oldDto.copyWith(name: newName);
      _entities[nodeId] = updatedDto;

      /// Проверка на правильность измененения дерева
      final updatedNode = _findEntityById(nodeId);
      if (updatedNode == null) {
        return left(
          .client(
            type: .state,
            error: Exception('Failed to retrieve updated node'),
          ),
        );
      }
      return right(updatedNode);
    } catch (e, st) {
      return left(.client(type: .smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, Unit>?> deleteNode({
    required String userId,
    required String nodeId,
    CancelToken? cancelToken,
  }) async {
    /// Имитация задержки с возможностью отмены операции через cancelToken
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      /// Проверка на наличие удаляемой сущности [StockEntity]
      if (!_entities.containsKey(nodeId)) {
        return left(
          .server(type: .notFound, error: Exception('Node $nodeId not found')),
        );
      }

      /// Удаление всей ветки сущностей [StockEntity] из всех зависимостей
      /// Если удаляется не конечный элемент (isLeaf), то надо также удалить
      /// его children
      void deleteRecursive(String id) {
        final children = List<String>.from(_childrenMap[id] ?? []);
        for (final childId in children) {
          deleteRecursive(childId);
        }
        _entities.remove(id);
        _parentMap.remove(id);
        _childrenMap.remove(id);
      }

      /// Если удаляемая сущность [StockEntity] не корневая, то у его родителя
      /// надо убрать его из списка детей
      final parentId = _parentMap[nodeId];
      if (parentId != null && _childrenMap.containsKey(parentId)) {
        _childrenMap[parentId]!.remove(nodeId);
      }

      /// Удаляем [StockEntity], его ветки и всех зависимостей от это ветки
      deleteRecursive(nodeId);
      return right(unit);
    } catch (e, st) {
      return left(.client(type: .smth, error: e, stackTrace: st));
    }
  }
}
