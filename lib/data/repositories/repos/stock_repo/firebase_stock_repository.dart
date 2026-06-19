import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/stock_screen/stock_item.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseStockRepository extends IStockRepository {
  @override
  Future<Either<AppError, StockItem>?> addStockItem({required String stockId, required StockItem item, CancelToken? cancelToken}) {
    // TODO: implement addStockItem
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> deleteStockItem({required String stockId, required String itemId, CancelToken? cancelToken}) {
    // TODO: implement deleteStockItem
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<StockItem>>?> getStockItems({required String stockId, CancelToken? cancelToken}) {
    // TODO: implement getStockItems
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, StockItem>?> updateStockItem({required String stockId, required StockItem item, CancelToken? cancelToken}) {
    // TODO: implement updateStockItem
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, ProductTemplate>?> createProductTemplate({required ProductTemplate template, CancelToken? cancelToken}) {
    // TODO: implement createProductTemplate
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> deleteProductTemplate({required String productId, CancelToken? cancelToken}) {
    // TODO: implement deleteProductTemplate
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, ProductTemplate>?> updateProductTemplate({required ProductTemplate template, CancelToken? cancelToken}) {
    // TODO: implement updateProductTemplate
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, List<ProductTemplate>>?> getAllProductTemplates({CancelToken? cancelToken}) {
    // TODO: implement getAllProductTemplates
    throw UnimplementedError();
  }

}