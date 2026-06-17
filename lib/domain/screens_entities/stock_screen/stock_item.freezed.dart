// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockItem {

 String get id;/// К какому хранилищу относится этот элемент
 String get stockId;/// Продукт, который менеджментится в этом хранилище этим элементом
 ProductTemplate get product;/// [count] может превышать [preferredCount] и может быть ниже [lowLevelCount]
/// Они служат исключительно в качестве индикаторов
 int get count;/// Желательное число этих элементов
 int get preferredCount;/// Значение от которого мы считаем, что этих элементов мало
 int get lowLevelCount;
/// Create a copy of StockItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockItemCopyWith<StockItem> get copyWith => _$StockItemCopyWithImpl<StockItem>(this as StockItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockItem&&(identical(other.id, id) || other.id == id)&&(identical(other.stockId, stockId) || other.stockId == stockId)&&(identical(other.product, product) || other.product == product)&&(identical(other.count, count) || other.count == count)&&(identical(other.preferredCount, preferredCount) || other.preferredCount == preferredCount)&&(identical(other.lowLevelCount, lowLevelCount) || other.lowLevelCount == lowLevelCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,stockId,product,count,preferredCount,lowLevelCount);

@override
String toString() {
  return 'StockItem(id: $id, stockId: $stockId, product: $product, count: $count, preferredCount: $preferredCount, lowLevelCount: $lowLevelCount)';
}


}

/// @nodoc
abstract mixin class $StockItemCopyWith<$Res>  {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) _then) = _$StockItemCopyWithImpl;
@useResult
$Res call({
 String id, String stockId, ProductTemplate product, int count, int preferredCount, int lowLevelCount
});


$ProductTemplateCopyWith<$Res> get product;

}
/// @nodoc
class _$StockItemCopyWithImpl<$Res>
    implements $StockItemCopyWith<$Res> {
  _$StockItemCopyWithImpl(this._self, this._then);

  final StockItem _self;
  final $Res Function(StockItem) _then;

/// Create a copy of StockItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? stockId = null,Object? product = null,Object? count = null,Object? preferredCount = null,Object? lowLevelCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,stockId: null == stockId ? _self.stockId : stockId // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductTemplate,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,preferredCount: null == preferredCount ? _self.preferredCount : preferredCount // ignore: cast_nullable_to_non_nullable
as int,lowLevelCount: null == lowLevelCount ? _self.lowLevelCount : lowLevelCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of StockItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductTemplateCopyWith<$Res> get product {
  
  return $ProductTemplateCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockItem].
extension StockItemPatterns on StockItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockItem value)  $default,){
final _that = this;
switch (_that) {
case _StockItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockItem value)?  $default,){
final _that = this;
switch (_that) {
case _StockItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String stockId,  ProductTemplate product,  int count,  int preferredCount,  int lowLevelCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockItem() when $default != null:
return $default(_that.id,_that.stockId,_that.product,_that.count,_that.preferredCount,_that.lowLevelCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String stockId,  ProductTemplate product,  int count,  int preferredCount,  int lowLevelCount)  $default,) {final _that = this;
switch (_that) {
case _StockItem():
return $default(_that.id,_that.stockId,_that.product,_that.count,_that.preferredCount,_that.lowLevelCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String stockId,  ProductTemplate product,  int count,  int preferredCount,  int lowLevelCount)?  $default,) {final _that = this;
switch (_that) {
case _StockItem() when $default != null:
return $default(_that.id,_that.stockId,_that.product,_that.count,_that.preferredCount,_that.lowLevelCount);case _:
  return null;

}
}

}

/// @nodoc


class _StockItem implements StockItem {
  const _StockItem({required this.id, required this.stockId, required this.product, this.count = 0, this.preferredCount = 0, this.lowLevelCount = 0});
  

@override final  String id;
/// К какому хранилищу относится этот элемент
@override final  String stockId;
/// Продукт, который менеджментится в этом хранилище этим элементом
@override final  ProductTemplate product;
/// [count] может превышать [preferredCount] и может быть ниже [lowLevelCount]
/// Они служат исключительно в качестве индикаторов
@override@JsonKey() final  int count;
/// Желательное число этих элементов
@override@JsonKey() final  int preferredCount;
/// Значение от которого мы считаем, что этих элементов мало
@override@JsonKey() final  int lowLevelCount;

/// Create a copy of StockItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockItemCopyWith<_StockItem> get copyWith => __$StockItemCopyWithImpl<_StockItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockItem&&(identical(other.id, id) || other.id == id)&&(identical(other.stockId, stockId) || other.stockId == stockId)&&(identical(other.product, product) || other.product == product)&&(identical(other.count, count) || other.count == count)&&(identical(other.preferredCount, preferredCount) || other.preferredCount == preferredCount)&&(identical(other.lowLevelCount, lowLevelCount) || other.lowLevelCount == lowLevelCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,stockId,product,count,preferredCount,lowLevelCount);

@override
String toString() {
  return 'StockItem(id: $id, stockId: $stockId, product: $product, count: $count, preferredCount: $preferredCount, lowLevelCount: $lowLevelCount)';
}


}

/// @nodoc
abstract mixin class _$StockItemCopyWith<$Res> implements $StockItemCopyWith<$Res> {
  factory _$StockItemCopyWith(_StockItem value, $Res Function(_StockItem) _then) = __$StockItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String stockId, ProductTemplate product, int count, int preferredCount, int lowLevelCount
});


@override $ProductTemplateCopyWith<$Res> get product;

}
/// @nodoc
class __$StockItemCopyWithImpl<$Res>
    implements _$StockItemCopyWith<$Res> {
  __$StockItemCopyWithImpl(this._self, this._then);

  final _StockItem _self;
  final $Res Function(_StockItem) _then;

/// Create a copy of StockItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? stockId = null,Object? product = null,Object? count = null,Object? preferredCount = null,Object? lowLevelCount = null,}) {
  return _then(_StockItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,stockId: null == stockId ? _self.stockId : stockId // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductTemplate,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,preferredCount: null == preferredCount ? _self.preferredCount : preferredCount // ignore: cast_nullable_to_non_nullable
as int,lowLevelCount: null == lowLevelCount ? _self.lowLevelCount : lowLevelCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of StockItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductTemplateCopyWith<$Res> get product {
  
  return $ProductTemplateCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$ProductTemplate {

 String get id; String get name;/// Путь к локальному файлу изображения или URL
/// Изображение продукта (может отсутствовать)
 ImageAsset? get image;/// Флаг "избранное" — попадает ли в быстрый доступ
 bool get isFavorite;
/// Create a copy of ProductTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductTemplateCopyWith<ProductTemplate> get copyWith => _$ProductTemplateCopyWithImpl<ProductTemplate>(this as ProductTemplate, _$identity);

  /// Serializes this ProductTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,isFavorite);

@override
String toString() {
  return 'ProductTemplate(id: $id, name: $name, image: $image, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $ProductTemplateCopyWith<$Res>  {
  factory $ProductTemplateCopyWith(ProductTemplate value, $Res Function(ProductTemplate) _then) = _$ProductTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String name, ImageAsset? image, bool isFavorite
});


$ImageAssetCopyWith<$Res>? get image;

}
/// @nodoc
class _$ProductTemplateCopyWithImpl<$Res>
    implements $ProductTemplateCopyWith<$Res> {
  _$ProductTemplateCopyWithImpl(this._self, this._then);

  final ProductTemplate _self;
  final $Res Function(ProductTemplate) _then;

/// Create a copy of ProductTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageAsset?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProductTemplate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageAssetCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductTemplate].
extension ProductTemplatePatterns on ProductTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductTemplate value)  $default,){
final _that = this;
switch (_that) {
case _ProductTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _ProductTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ImageAsset? image,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductTemplate() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ImageAsset? image,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _ProductTemplate():
return $default(_that.id,_that.name,_that.image,_that.isFavorite);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ImageAsset? image,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _ProductTemplate() when $default != null:
return $default(_that.id,_that.name,_that.image,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductTemplate implements ProductTemplate {
  const _ProductTemplate({required this.id, required this.name, this.image, this.isFavorite = false});
  factory _ProductTemplate.fromJson(Map<String, dynamic> json) => _$ProductTemplateFromJson(json);

@override final  String id;
@override final  String name;
/// Путь к локальному файлу изображения или URL
/// Изображение продукта (может отсутствовать)
@override final  ImageAsset? image;
/// Флаг "избранное" — попадает ли в быстрый доступ
@override@JsonKey() final  bool isFavorite;

/// Create a copy of ProductTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductTemplateCopyWith<_ProductTemplate> get copyWith => __$ProductTemplateCopyWithImpl<_ProductTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,image,isFavorite);

@override
String toString() {
  return 'ProductTemplate(id: $id, name: $name, image: $image, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ProductTemplateCopyWith<$Res> implements $ProductTemplateCopyWith<$Res> {
  factory _$ProductTemplateCopyWith(_ProductTemplate value, $Res Function(_ProductTemplate) _then) = __$ProductTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ImageAsset? image, bool isFavorite
});


@override $ImageAssetCopyWith<$Res>? get image;

}
/// @nodoc
class __$ProductTemplateCopyWithImpl<$Res>
    implements _$ProductTemplateCopyWith<$Res> {
  __$ProductTemplateCopyWithImpl(this._self, this._then);

  final _ProductTemplate _self;
  final $Res Function(_ProductTemplate) _then;

/// Create a copy of ProductTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? image = freezed,Object? isFavorite = null,}) {
  return _then(_ProductTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageAsset?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProductTemplate
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageAssetCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
