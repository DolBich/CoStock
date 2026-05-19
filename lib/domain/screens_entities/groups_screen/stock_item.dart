import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item.freezed.dart';

/// Элемент внутри хранилища
@freezed
sealed class StockItem with _$StockItem {
  const factory StockItem({
    required String id,
    required String name,
    @Default(0) int count,

    /// Желательное число этих элементов
    @Default(0) int preferredCount,

    /// Значение от которого мы считаем, что этих элементов мало
    @Default(0) int lowLevelCount,
  }) = _StockItem;
}
