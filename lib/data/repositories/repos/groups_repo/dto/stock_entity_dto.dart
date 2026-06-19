part of 'stock_entities_dtos.dart';

enum StockEntityType { group, stock }

/// Передаёт нам полное дерево хранилищей, без элементов внутри [Stock] для
/// оптимизации. Их подгружаем только при переходе не соответствующую страницу
@freezed
sealed class StockEntityDto with _$StockEntityDto {
  const factory StockEntityDto({
    required String id,
    required String name,
    required StockEntityType type,
    /// Только для [StockGroup]: вложенные DTO детей (для stock – пустой список или null)
    @Default([]) List<StockEntityDto> children,
    @JsonKey(includeIfNull: false) String? parentId,
  }) = _StockEntityDto;

  factory StockEntityDto.fromJson(Map<String, dynamic> json) =>
      _$StockEntityDtoFromJson(json);

  /// Преобразование доменной модели в DTO (для отправки на сервер при необходимости)
  factory StockEntityDto.fromDomain(StockEntity entity) {
    return StockEntityDto(
      id: entity.id,
      name: entity.name,
      type: entity is StockGroup ? .group : .stock,
      children: entity is StockGroup
          ? entity.children.map(StockEntityDto.fromDomain).toList()
          : [],
    );
  }
}

extension StockEntityDtoToDomain on StockEntityDto {
  /// Превращает DTO в доменную модель БЕЗ связей (parent = null, children = [])
  /// Связи формируем в
  StockEntity toDomain() {
    switch (type) {
      case .group:
        return StockGroup(id: id, name: name);
      case .stock:
        return Stock(id: id, name: name);
    }
  }
}

extension StockEntityDtoLocalSave on StockEntityDto {
  /// Для локального сохранения – без вложенных children, но с parentId
  Map<String, dynamic> toLocalJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      if (parentId != null) 'parentId': parentId,
    };
  }
}
