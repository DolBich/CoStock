// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductTemplateDto _$ProductTemplateDtoFromJson(Map<String, dynamic> json) =>
    _ProductTemplateDto(
      id: json['id'] as String,
      name: json['name'] as String,
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$ProductTemplateDtoToJson(_ProductTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageId': instance.imageId,
    };

_StockItemDto _$StockItemDtoFromJson(Map<String, dynamic> json) =>
    _StockItemDto(
      id: json['id'] as String,
      stockId: json['stockId'] as String,
      productId: json['productId'] as String,
      count: (json['count'] as num?)?.toInt() ?? 0,
      preferredCount: (json['preferredCount'] as num?)?.toInt() ?? 0,
      lowLevelCount: (json['lowLevelCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$StockItemDtoToJson(_StockItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stockId': instance.stockId,
      'productId': instance.productId,
      'count': instance.count,
      'preferredCount': instance.preferredCount,
      'lowLevelCount': instance.lowLevelCount,
    };
