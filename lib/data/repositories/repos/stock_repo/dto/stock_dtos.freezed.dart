// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductTemplateDto {

 String get id; String get name;/// Идентификатор изображения (ссылка на [ImageAsset.id])
 String? get imageId;
/// Create a copy of ProductTemplateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductTemplateDtoCopyWith<ProductTemplateDto> get copyWith => _$ProductTemplateDtoCopyWithImpl<ProductTemplateDto>(this as ProductTemplateDto, _$identity);

  /// Serializes this ProductTemplateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageId, imageId) || other.imageId == imageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageId);

@override
String toString() {
  return 'ProductTemplateDto(id: $id, name: $name, imageId: $imageId)';
}


}

/// @nodoc
abstract mixin class $ProductTemplateDtoCopyWith<$Res>  {
  factory $ProductTemplateDtoCopyWith(ProductTemplateDto value, $Res Function(ProductTemplateDto) _then) = _$ProductTemplateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? imageId
});




}
/// @nodoc
class _$ProductTemplateDtoCopyWithImpl<$Res>
    implements $ProductTemplateDtoCopyWith<$Res> {
  _$ProductTemplateDtoCopyWithImpl(this._self, this._then);

  final ProductTemplateDto _self;
  final $Res Function(ProductTemplateDto) _then;

/// Create a copy of ProductTemplateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductTemplateDto].
extension ProductTemplateDtoPatterns on ProductTemplateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductTemplateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductTemplateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductTemplateDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductTemplateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductTemplateDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductTemplateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? imageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.imageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? imageId)  $default,) {final _that = this;
switch (_that) {
case _ProductTemplateDto():
return $default(_that.id,_that.name,_that.imageId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? imageId)?  $default,) {final _that = this;
switch (_that) {
case _ProductTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.imageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductTemplateDto extends ProductTemplateDto {
  const _ProductTemplateDto({required this.id, required this.name, this.imageId}): super._();
  factory _ProductTemplateDto.fromJson(Map<String, dynamic> json) => _$ProductTemplateDtoFromJson(json);

@override final  String id;
@override final  String name;
/// Идентификатор изображения (ссылка на [ImageAsset.id])
@override final  String? imageId;

/// Create a copy of ProductTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductTemplateDtoCopyWith<_ProductTemplateDto> get copyWith => __$ProductTemplateDtoCopyWithImpl<_ProductTemplateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductTemplateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageId, imageId) || other.imageId == imageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageId);

@override
String toString() {
  return 'ProductTemplateDto(id: $id, name: $name, imageId: $imageId)';
}


}

/// @nodoc
abstract mixin class _$ProductTemplateDtoCopyWith<$Res> implements $ProductTemplateDtoCopyWith<$Res> {
  factory _$ProductTemplateDtoCopyWith(_ProductTemplateDto value, $Res Function(_ProductTemplateDto) _then) = __$ProductTemplateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? imageId
});




}
/// @nodoc
class __$ProductTemplateDtoCopyWithImpl<$Res>
    implements _$ProductTemplateDtoCopyWith<$Res> {
  __$ProductTemplateDtoCopyWithImpl(this._self, this._then);

  final _ProductTemplateDto _self;
  final $Res Function(_ProductTemplateDto) _then;

/// Create a copy of ProductTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageId = freezed,}) {
  return _then(_ProductTemplateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StockItemDto {

 String get id; String get stockId;/// Список существующих [ProductTemplate] храним отдельно, поскольку несколько
/// [StockItem] могут содержать один и тот же [ProductTemplate]
 String get productId;/// [count] может превышать [preferredCount] и может быть ниже [lowLevelCount]
/// Они служат исключительно в качестве индикаторов
 int get count; int get preferredCount; int get lowLevelCount;
/// Create a copy of StockItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockItemDtoCopyWith<StockItemDto> get copyWith => _$StockItemDtoCopyWithImpl<StockItemDto>(this as StockItemDto, _$identity);

  /// Serializes this StockItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.stockId, stockId) || other.stockId == stockId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.count, count) || other.count == count)&&(identical(other.preferredCount, preferredCount) || other.preferredCount == preferredCount)&&(identical(other.lowLevelCount, lowLevelCount) || other.lowLevelCount == lowLevelCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,stockId,productId,count,preferredCount,lowLevelCount);

@override
String toString() {
  return 'StockItemDto(id: $id, stockId: $stockId, productId: $productId, count: $count, preferredCount: $preferredCount, lowLevelCount: $lowLevelCount)';
}


}

/// @nodoc
abstract mixin class $StockItemDtoCopyWith<$Res>  {
  factory $StockItemDtoCopyWith(StockItemDto value, $Res Function(StockItemDto) _then) = _$StockItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String stockId, String productId, int count, int preferredCount, int lowLevelCount
});




}
/// @nodoc
class _$StockItemDtoCopyWithImpl<$Res>
    implements $StockItemDtoCopyWith<$Res> {
  _$StockItemDtoCopyWithImpl(this._self, this._then);

  final StockItemDto _self;
  final $Res Function(StockItemDto) _then;

/// Create a copy of StockItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? stockId = null,Object? productId = null,Object? count = null,Object? preferredCount = null,Object? lowLevelCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,stockId: null == stockId ? _self.stockId : stockId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,preferredCount: null == preferredCount ? _self.preferredCount : preferredCount // ignore: cast_nullable_to_non_nullable
as int,lowLevelCount: null == lowLevelCount ? _self.lowLevelCount : lowLevelCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StockItemDto].
extension StockItemDtoPatterns on StockItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockItemDto value)  $default,){
final _that = this;
switch (_that) {
case _StockItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _StockItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String stockId,  String productId,  int count,  int preferredCount,  int lowLevelCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockItemDto() when $default != null:
return $default(_that.id,_that.stockId,_that.productId,_that.count,_that.preferredCount,_that.lowLevelCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String stockId,  String productId,  int count,  int preferredCount,  int lowLevelCount)  $default,) {final _that = this;
switch (_that) {
case _StockItemDto():
return $default(_that.id,_that.stockId,_that.productId,_that.count,_that.preferredCount,_that.lowLevelCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String stockId,  String productId,  int count,  int preferredCount,  int lowLevelCount)?  $default,) {final _that = this;
switch (_that) {
case _StockItemDto() when $default != null:
return $default(_that.id,_that.stockId,_that.productId,_that.count,_that.preferredCount,_that.lowLevelCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockItemDto extends StockItemDto {
  const _StockItemDto({required this.id, required this.stockId, required this.productId, this.count = 0, this.preferredCount = 0, this.lowLevelCount = 0}): super._();
  factory _StockItemDto.fromJson(Map<String, dynamic> json) => _$StockItemDtoFromJson(json);

@override final  String id;
@override final  String stockId;
/// Список существующих [ProductTemplate] храним отдельно, поскольку несколько
/// [StockItem] могут содержать один и тот же [ProductTemplate]
@override final  String productId;
/// [count] может превышать [preferredCount] и может быть ниже [lowLevelCount]
/// Они служат исключительно в качестве индикаторов
@override@JsonKey() final  int count;
@override@JsonKey() final  int preferredCount;
@override@JsonKey() final  int lowLevelCount;

/// Create a copy of StockItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockItemDtoCopyWith<_StockItemDto> get copyWith => __$StockItemDtoCopyWithImpl<_StockItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.stockId, stockId) || other.stockId == stockId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.count, count) || other.count == count)&&(identical(other.preferredCount, preferredCount) || other.preferredCount == preferredCount)&&(identical(other.lowLevelCount, lowLevelCount) || other.lowLevelCount == lowLevelCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,stockId,productId,count,preferredCount,lowLevelCount);

@override
String toString() {
  return 'StockItemDto(id: $id, stockId: $stockId, productId: $productId, count: $count, preferredCount: $preferredCount, lowLevelCount: $lowLevelCount)';
}


}

/// @nodoc
abstract mixin class _$StockItemDtoCopyWith<$Res> implements $StockItemDtoCopyWith<$Res> {
  factory _$StockItemDtoCopyWith(_StockItemDto value, $Res Function(_StockItemDto) _then) = __$StockItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String stockId, String productId, int count, int preferredCount, int lowLevelCount
});




}
/// @nodoc
class __$StockItemDtoCopyWithImpl<$Res>
    implements _$StockItemDtoCopyWith<$Res> {
  __$StockItemDtoCopyWithImpl(this._self, this._then);

  final _StockItemDto _self;
  final $Res Function(_StockItemDto) _then;

/// Create a copy of StockItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? stockId = null,Object? productId = null,Object? count = null,Object? preferredCount = null,Object? lowLevelCount = null,}) {
  return _then(_StockItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,stockId: null == stockId ? _self.stockId : stockId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,preferredCount: null == preferredCount ? _self.preferredCount : preferredCount // ignore: cast_nullable_to_non_nullable
as int,lowLevelCount: null == lowLevelCount ? _self.lowLevelCount : lowLevelCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
