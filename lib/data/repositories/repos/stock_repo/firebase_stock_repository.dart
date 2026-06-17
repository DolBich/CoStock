import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/stock_screen/stock_item.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseStockRepository extends IStockRepository {
  @override
  Future<Either<AppError, List<StockEntity>>?> getUserTree({
    required String userId,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, StockEntity>?> updateNode({
    required String userId,
    required String nodeId,
    required String newName,
    String? newParentId,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> deleteNode({
    required String userId,
    required String nodeId,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<StockItem>>?> getStockItems({
    required String stockId,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, StockItem>?> addStockItem({
    required StockItem item,
    required String stockId,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, StockItem>?> updateStockItem({
    required String stockId,
    required StockItem item,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> deleteStockItem({
    required String stockId,
    required String itemId,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<StockEntity>?>?> getUserTreeIfChanged({
    required String userId,
    CancelToken? cancelToken,
  }) {
    // TODO: implement getUserTreeIfChanged
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Stock>?> addNode({
    required String userId,
    required String name,
    required StockEntityType type,
    String? parentId,
    CancelToken? cancelToken,
  }) {
    // TODO: implement addNode
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> saveFullTree({required String userId, required List<StockEntity> roots, CancelToken? cancelToken}) {
    // TODO: implement saveFullTree
    throw UnimplementedError();
  }
}
