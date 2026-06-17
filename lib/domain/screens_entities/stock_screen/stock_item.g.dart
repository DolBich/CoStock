// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductTemplate _$ProductTemplateFromJson(Map<String, dynamic> json) =>
    _ProductTemplate(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] == null
          ? null
          : ImageAsset.fromJson(json['image'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductTemplateToJson(_ProductTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'isFavorite': instance.isFavorite,
    };
