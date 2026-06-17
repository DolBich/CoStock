// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageAsset {

 String get id;/// Постоянный URL на сервере (нужен для первоначальной загрузки или расшаривания)
 String get url;/// Локальный путь к файлу (например, из path_provider)
 String? get localPath;/// Байты изображения [bytes] только для оперативной работы, не подходят для
/// api и локального хранения из-за своих размеров
@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? get bytes;/// Если по каким-то причинам не удалось загрузить картинку
 bool get isError;/// MIME-тип изображения, например 'image/jpeg', 'image/png'
 ImageMimeType get mime;
/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<ImageAsset> get copyWith => _$ImageAssetCopyWithImpl<ImageAsset>(this as ImageAsset, _$identity);

  /// Serializes this ImageAsset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.mime, mime) || other.mime == mime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,localPath,const DeepCollectionEquality().hash(bytes),isError,mime);

@override
String toString() {
  return 'ImageAsset(id: $id, url: $url, localPath: $localPath, bytes: $bytes, isError: $isError, mime: $mime)';
}


}

/// @nodoc
abstract mixin class $ImageAssetCopyWith<$Res>  {
  factory $ImageAssetCopyWith(ImageAsset value, $Res Function(ImageAsset) _then) = _$ImageAssetCopyWithImpl;
@useResult
$Res call({
 String id, String url, String? localPath,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? bytes, bool isError, ImageMimeType mime
});




}
/// @nodoc
class _$ImageAssetCopyWithImpl<$Res>
    implements $ImageAssetCopyWith<$Res> {
  _$ImageAssetCopyWithImpl(this._self, this._then);

  final ImageAsset _self;
  final $Res Function(ImageAsset) _then;

/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? localPath = freezed,Object? bytes = freezed,Object? isError = null,Object? mime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,localPath: freezed == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as ImageMimeType,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageAsset].
extension ImageAssetPatterns on ImageAsset {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageAsset() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageAsset value)  $default,){
final _that = this;
switch (_that) {
case _ImageAsset():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageAsset value)?  $default,){
final _that = this;
switch (_that) {
case _ImageAsset() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String? localPath, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? bytes,  bool isError,  ImageMimeType mime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageAsset() when $default != null:
return $default(_that.id,_that.url,_that.localPath,_that.bytes,_that.isError,_that.mime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String? localPath, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? bytes,  bool isError,  ImageMimeType mime)  $default,) {final _that = this;
switch (_that) {
case _ImageAsset():
return $default(_that.id,_that.url,_that.localPath,_that.bytes,_that.isError,_that.mime);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String? localPath, @JsonKey(includeToJson: false, includeFromJson: false)  Uint8List? bytes,  bool isError,  ImageMimeType mime)?  $default,) {final _that = this;
switch (_that) {
case _ImageAsset() when $default != null:
return $default(_that.id,_that.url,_that.localPath,_that.bytes,_that.isError,_that.mime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageAsset implements ImageAsset {
  const _ImageAsset({required this.id, required this.url, this.localPath, @JsonKey(includeToJson: false, includeFromJson: false) this.bytes, this.isError = false, required this.mime});
  factory _ImageAsset.fromJson(Map<String, dynamic> json) => _$ImageAssetFromJson(json);

@override final  String id;
/// Постоянный URL на сервере (нужен для первоначальной загрузки или расшаривания)
@override final  String url;
/// Локальный путь к файлу (например, из path_provider)
@override final  String? localPath;
/// Байты изображения [bytes] только для оперативной работы, не подходят для
/// api и локального хранения из-за своих размеров
@override@JsonKey(includeToJson: false, includeFromJson: false) final  Uint8List? bytes;
/// Если по каким-то причинам не удалось загрузить картинку
@override@JsonKey() final  bool isError;
/// MIME-тип изображения, например 'image/jpeg', 'image/png'
@override final  ImageMimeType mime;

/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageAssetCopyWith<_ImageAsset> get copyWith => __$ImageAssetCopyWithImpl<_ImageAsset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageAssetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.mime, mime) || other.mime == mime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,localPath,const DeepCollectionEquality().hash(bytes),isError,mime);

@override
String toString() {
  return 'ImageAsset(id: $id, url: $url, localPath: $localPath, bytes: $bytes, isError: $isError, mime: $mime)';
}


}

/// @nodoc
abstract mixin class _$ImageAssetCopyWith<$Res> implements $ImageAssetCopyWith<$Res> {
  factory _$ImageAssetCopyWith(_ImageAsset value, $Res Function(_ImageAsset) _then) = __$ImageAssetCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String? localPath,@JsonKey(includeToJson: false, includeFromJson: false) Uint8List? bytes, bool isError, ImageMimeType mime
});




}
/// @nodoc
class __$ImageAssetCopyWithImpl<$Res>
    implements _$ImageAssetCopyWith<$Res> {
  __$ImageAssetCopyWithImpl(this._self, this._then);

  final _ImageAsset _self;
  final $Res Function(_ImageAsset) _then;

/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? localPath = freezed,Object? bytes = freezed,Object? isError = null,Object? mime = null,}) {
  return _then(_ImageAsset(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,localPath: freezed == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as ImageMimeType,
  ));
}


}

// dart format on
