// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_entities_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockEntityDto _$StockEntityDtoFromJson(Map<String, dynamic> json) =>
    _StockEntityDto(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$StockEntityTypeEnumMap, json['type']),
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => StockEntityDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$StockEntityDtoToJson(_StockEntityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$StockEntityTypeEnumMap[instance.type]!,
      'children': instance.children,
      'parentId': ?instance.parentId,
    };

const _$StockEntityTypeEnumMap = {
  StockEntityType.group: 'group',
  StockEntityType.stock: 'stock',
};
