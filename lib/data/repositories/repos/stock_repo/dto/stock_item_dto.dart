part of 'stock_dtos.dart';

/// DTO для объекта хранилища
@freezed
sealed class StockItemDto with _$StockItemDto {
  const factory StockItemDto({
    required String id,
    required String name,

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
      name: item.name,
      count: item.count,
      preferredCount: item.preferredCount,
      lowLevelCount: item.lowLevelCount,
    );
  }
}

extension StockItemDtoToDomain on StockItemDto {
  StockItem toDomain() {
    return StockItem(
      id: id,
      name: name,
      count: count,
      preferredCount: preferredCount,
      lowLevelCount: lowLevelCount,
    );
  }
}