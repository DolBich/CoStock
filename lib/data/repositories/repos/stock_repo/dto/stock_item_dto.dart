part of 'stock_dtos.dart';

/// DTO для объекта хранилища
@freezed
sealed class StockItemDto with _$StockItemDto {
  const StockItemDto._();

  const factory StockItemDto({
    required String id,
    required String stockId,

    /// Список существующих [ProductTemplate] храним отдельно, поскольку несколько
    /// [StockItem] могут содержать один и тот же [ProductTemplate]
    required String productId,

    /// [count] может превышать [preferredCount] и может быть ниже [lowLevelCount]
    /// Они служат исключительно в качестве индикаторов
    @Default(0) int count,
    @Default(0) int preferredCount,
    @Default(0) int lowLevelCount,
  }) = _StockItemDto;

  factory StockItemDto.fromJson(Map<String, dynamic> json) =>
      _$StockItemDtoFromJson(json);

  factory StockItemDto.fromDomain(StockItem item) {
    return StockItemDto(
      id: item.id,
      stockId: item.stockId,
      productId: item.product.id,
      count: item.count,
      preferredCount: item.preferredCount,
      lowLevelCount: item.lowLevelCount,
    );
  }

  /// Для восстановления нужен готовый ProductTemplate
  StockItem toDomain(ProductTemplate product) {
    return StockItem(
      id: id,
      stockId: stockId,
      product: product,
      count: count,
      preferredCount: preferredCount,
      lowLevelCount: lowLevelCount,
    );
  }
}