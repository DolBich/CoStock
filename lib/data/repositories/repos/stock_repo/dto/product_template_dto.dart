part of 'stock_dtos.dart';

@freezed
sealed class ProductTemplateDto with _$ProductTemplateDto {
  const ProductTemplateDto._();

  const factory ProductTemplateDto({
    required String id,
    required String name,
    /// Идентификатор изображения (ссылка на [ImageAsset.id])
    String? imageId,
    /// [isFavorite] не отправляем на сервер, их список хранится отдельно
    /// для каждого аккаунта в их [UserSettings] для персонального выбора
    /// избранных продуктов
  }) = _ProductTemplateDto;

  factory ProductTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$ProductTemplateDtoFromJson(json);

  factory ProductTemplateDto.fromDomain(ProductTemplate template) {
    return ProductTemplateDto(
      id: template.id,
      name: template.name,
      imageId: template.image?.id,
    );
  }

  /// Для восстановления нужен готовый ImageAsset (из кеша)
  /// Если картинки нет в кэше - отдельная команда на загрузку по [ImageAsset.url]
  /// [isFavorite] получаем из настроек аккаунта [UserSettings.favoriteTemplateIds]
  ProductTemplate toDomain({ImageAsset? image, bool? isFavorite}) {
    return ProductTemplate(
      id: id,
      name: name,
      image: image,
      isFavorite: isFavorite ?? false
    );
  }
}
