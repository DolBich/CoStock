// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageAsset _$ImageAssetFromJson(Map<String, dynamic> json) => _ImageAsset(
  id: json['id'] as String,
  url: json['url'] as String,
  localPath: json['localPath'] as String?,
  isError: json['isError'] as bool? ?? false,
  mime: $enumDecode(_$ImageMimeTypeEnumMap, json['mime']),
);

Map<String, dynamic> _$ImageAssetToJson(_ImageAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'localPath': instance.localPath,
      'isError': instance.isError,
      'mime': _$ImageMimeTypeEnumMap[instance.mime]!,
    };

const _$ImageMimeTypeEnumMap = {
  ImageMimeType.jpeg: 'jpeg',
  ImageMimeType.png: 'png',
  ImageMimeType.gif: 'gif',
  ImageMimeType.webp: 'webp',
  ImageMimeType.bmp: 'bmp',
  ImageMimeType.unknown: 'unknown',
};
