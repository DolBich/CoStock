import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_item.dart';
import 'package:fpdart/fpdart.dart';

///Если возвращается [null] - отменён через [cancelToken]
abstract class IStockRepository {
  /// Узнать менялось ли дерево сущностей [StockEntity] с последнего раз
  /// когда мы получали данные
  /// right(null) - изменений не было
  /// right([...]) -  обновлённые данные
  Future<Either<AppError, List<StockEntity>?>?> getUserTreeIfChanged({
    required String userId,
    CancelToken? cancelToken,
  });

  /// Полностью заменяет дерево сущностей пользователя на новое.
  Future<Either<AppError, Unit>?> saveFullTree({
    required String userId,
    required List<StockEntity> roots,
    CancelToken? cancelToken,
  });

  /// Возвращает корневую группу пользователя или null, если дерево пусто.
  Future<Either<AppError, List<StockEntity>>?> getUserTree({
    required String userId,
    CancelToken? cancelToken,
  });

  /// Добавить инвентарь
  Future<Either<AppError, StockEntity>?> addNode({
    required String userId,
    required String name,
    required StockEntityType type,
    String? parentId,
    CancelToken? cancelToken,
  });

  /// Обновить узел (без учёта перемещения по дереву, перемещение учитывается только на локальном устройстве)
  Future<Either<AppError, StockEntity>?> updateNode({
    required String userId,
    required String nodeId,
    required String newName,
    CancelToken? cancelToken,
  });

  /// Удалить узел и всех потомков
  Future<Either<AppError, Unit>?> deleteNode({
    required String userId,
    required String nodeId,
    CancelToken? cancelToken,
  });

  /// ----- StockItem методы -----
  Future<Either<AppError, List<StockItem>>?> getStockItems({
    required String stockId,
    CancelToken? cancelToken,
  });

  Future<Either<AppError, StockItem>?> addStockItem({
    required String stockId,
    required StockItem item,
    CancelToken? cancelToken,
  });

  Future<Either<AppError, StockItem>?> updateStockItem({
    required String stockId,
    required StockItem item,
    CancelToken? cancelToken,
  });

  Future<Either<AppError, Unit>?> deleteStockItem({
    required String stockId,
    required String itemId,
    CancelToken? cancelToken,
  });
}