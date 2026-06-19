import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/stock_screen/stock_item.dart';
import 'package:fpdart/fpdart.dart';

class MockStockRepository extends IStockRepository with MockRepoDelay {
  /// Имитация серверного хранилища элементов: stockId → список StockItemDto.
  final Map<String, List<StockItemDto>> _items = {};

  /// Имитация серверного хранилища шаблонов продуктов.
  final Map<String, ProductTemplate> _serverTemplates = {};

  /// Внутренний хелпер: по productId возвращает ProductTemplate из «серверного»
  /// хранилища. В реальном репозитории такой метод не нужен – сервер сам вернёт
  /// полную модель ProductTemplate внутри ответа на getStockItems / addStockItem.
  ProductTemplate _getTemplate(String productId) {
    return _serverTemplates[productId] ??
        ProductTemplate(id: productId, name: 'Unknown product');
  }

  // ---------------------------------------------------------------------------
  // StockItem CRUD
  // ---------------------------------------------------------------------------

  @override
  Future<Either<AppError, List<StockItem>>?> getStockItems({
    required String stockId,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      final dtos = _items[stockId] ?? [];
      final items = dtos
          .map((dto) => dto.toDomain(_getTemplate(dto.productId)))
          .toList();
      return right(items);
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, StockItem>?> addStockItem({
    required String stockId,
    required StockItem item,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      final dto = StockItemDto.fromDomain(item);
      _items.putIfAbsent(stockId, () => []);
      _items[stockId]!.add(dto);
      // Имитация ответа сервера: возвращаем тот же элемент, но с шаблоном,
      // который уже должен быть в _serverTemplates (если нет – заглушка).
      return right(dto.toDomain(_getTemplate(dto.productId)));
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, StockItem>?> updateStockItem({
    required String stockId,
    required StockItem item,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      final list = _items[stockId];
      if (list == null) {
        return left(AppError.client(
          type: ClientErrorType.state,
          error: Exception('Stock $stockId not found'),
        ));
      }
      final index = list.indexWhere((dto) => dto.id == item.id);
      if (index == -1) {
        return left(AppError.client(
          type: ClientErrorType.state,
          error: Exception('StockItem ${item.id} not found'),
        ));
      }
      list[index] = StockItemDto.fromDomain(item);
      // Возвращаем обновлённый элемент с заполненным ProductTemplate
      return right(item.copyWith(product: _getTemplate(item.product.id)));
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, Unit>?> deleteStockItem({
    required String stockId,
    required String itemId,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      final list = _items[stockId];
      if (list == null) {
        return left(AppError.client(
          type: ClientErrorType.state,
          error: Exception('Stock $stockId not found'),
        ));
      }
      final initialLength = list.length;
      list.removeWhere((dto) => dto.id == itemId);
      if (list.length == initialLength) {
        return left(AppError.client(
          type: ClientErrorType.state,
          error: Exception('StockItem $itemId not found'),
        ));
      }
      return right(unit);
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }

  // ---------------------------------------------------------------------------
  // ProductTemplate CRUD (имитация серверного API)
  // ---------------------------------------------------------------------------

  @override
  Future<Either<AppError, List<ProductTemplate>>?> getAllProductTemplates({
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      return right(_serverTemplates.values.toList());
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, ProductTemplate>?> createProductTemplate({
    required ProductTemplate template,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      _serverTemplates[template.id] = template;
      return right(template);
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, ProductTemplate>?> updateProductTemplate({
    required ProductTemplate template,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      if (!_serverTemplates.containsKey(template.id)) {
        return left(AppError.client(
          type: ClientErrorType.state,
          error: Exception('Template ${template.id} not found'),
        ));
      }
      _serverTemplates[template.id] = template;
      return right(template);
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }

  @override
  Future<Either<AppError, Unit>?> deleteProductTemplate({
    required String productId,
    CancelToken? cancelToken,
  }) async {
    final canceled = await cancelableDelay(cancelToken);
    if (canceled) return null;

    try {
      _serverTemplates.remove(productId);
      return right(unit);
    } catch (e, st) {
      return left(AppError.client(type: ClientErrorType.smth, error: e, stackTrace: st));
    }
  }
}