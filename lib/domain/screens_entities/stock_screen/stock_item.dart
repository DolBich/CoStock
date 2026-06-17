import 'package:co_stock/domain/core/image/image_asset.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_template.dart';

part 'stock_item.freezed.dart';
part 'stock_item.g.dart';

/// Элемент внутри хранилища
/// Состоит из продукта, который менеджментится и из его настроек/нынешних
/// характеристик в этом хранилище
@freezed
sealed class StockItem with _$StockItem {
  const factory StockItem({
    required String id,
    /// К какому хранилищу относится этот элемент
    required String stockId,

    /// Продукт, который менеджментится в этом хранилище этим элементом
    required ProductTemplate product,

    /// [count] может превышать [preferredCount] и может быть ниже [lowLevelCount]
    /// Они служат исключительно в качестве индикаторов
    @Default(0) int count,
    /// Желательное число этих элементов
    @Default(0) int preferredCount,
    /// Значение от которого мы считаем, что этих элементов мало
    @Default(0) int lowLevelCount,
  }) = _StockItem;
}