import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/stock_screen/stock_item.dart';
import 'package:fpdart/fpdart.dart';

abstract class IStockRepository extends IRepository {
  ///
  /// Элементы хранилища
  ///

  /// Получить список StockItem для указанного склада.
  Future<Either<AppError, List<StockItem>>?> getStockItems({
    required String stockId,
    CancelToken? cancelToken,
  });

  /// Добавить новый StockItem на склад.
  Future<Either<AppError, StockItem>?> addStockItem({
    required String stockId,
    required StockItem item,
    CancelToken? cancelToken,
  });

  /// Обновить существующий StockItem.
  Future<Either<AppError, StockItem>?> updateStockItem({
    required String stockId,
    required StockItem item,
    CancelToken? cancelToken,
  });

  /// Удалить StockItem по id.
  Future<Either<AppError, Unit>?> deleteStockItem({
    required String stockId,
    required String itemId,
    CancelToken? cancelToken,
  });

  ///
  /// Шаблоны продуктов
  ///

  /// Получение всех шаблонов продуктов
  Future<Either<AppError, List<ProductTemplate>>?> getAllProductTemplates({
    CancelToken? cancelToken,
  });

  /// Создать новый ProductTemplate.
  Future<Either<AppError, ProductTemplate>?> createProductTemplate({
    required ProductTemplate template,
    CancelToken? cancelToken,
  });

  /// Обновить существующий ProductTemplate.
  Future<Either<AppError, ProductTemplate>?> updateProductTemplate({
    required ProductTemplate template,
    CancelToken? cancelToken,
  });

  /// Удалить ProductTemplate.
  /// Если он используется в элементах, их productId может остаться, но связь потеряется –
  /// в будущем нужно обработать в сервисе.
  Future<Either<AppError, Unit>?> deleteProductTemplate({
    required String productId,
    CancelToken? cancelToken,
  });
}