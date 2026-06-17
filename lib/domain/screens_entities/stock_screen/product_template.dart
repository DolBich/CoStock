part of 'stock_item.dart';

/// Шаблон продукта, который можно переисвользовать для создания нескольких [StockItem]
@freezed
sealed class ProductTemplate with _$ProductTemplate {
  const factory ProductTemplate({
    required String id,
    required String name,
    /// Путь к локальному файлу изображения или URL
    /// Изображение продукта (может отсутствовать)
    ImageAsset? image,
    /// Флаг "избранное" — попадает ли в быстрый доступ
    @Default(false) bool isFavorite,
  }) = _ProductTemplate;

  factory ProductTemplate.fromJson(Map<String, dynamic> json) =>
      _$ProductTemplateFromJson(json);
}