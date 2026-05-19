// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sort_arrangement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SortArrangement {

/// Порядок для кастомного режима (sortMode == null).
 Arrangement get customOrder;/// Порядок для режима сортировки (sortMode != null).
/// Ключ: parentId (или '__roots__').
/// Значение: key - parentId, value - распределение сущностей
/// среди всех сущностей одного типа
 Map<String, Map<StockEntityType, List<String>>> get sortOrder;
/// Create a copy of SortArrangement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortArrangementCopyWith<SortArrangement> get copyWith => _$SortArrangementCopyWithImpl<SortArrangement>(this as SortArrangement, _$identity);

  /// Serializes this SortArrangement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortArrangement&&const DeepCollectionEquality().equals(other.customOrder, customOrder)&&const DeepCollectionEquality().equals(other.sortOrder, sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(customOrder),const DeepCollectionEquality().hash(sortOrder));

@override
String toString() {
  return 'SortArrangement(customOrder: $customOrder, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $SortArrangementCopyWith<$Res>  {
  factory $SortArrangementCopyWith(SortArrangement value, $Res Function(SortArrangement) _then) = _$SortArrangementCopyWithImpl;
@useResult
$Res call({
 Arrangement customOrder, Map<String, Map<StockEntityType, List<String>>> sortOrder
});




}
/// @nodoc
class _$SortArrangementCopyWithImpl<$Res>
    implements $SortArrangementCopyWith<$Res> {
  _$SortArrangementCopyWithImpl(this._self, this._then);

  final SortArrangement _self;
  final $Res Function(SortArrangement) _then;

/// Create a copy of SortArrangement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customOrder = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
customOrder: null == customOrder ? _self.customOrder : customOrder // ignore: cast_nullable_to_non_nullable
as Arrangement,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as Map<String, Map<StockEntityType, List<String>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [SortArrangement].
extension SortArrangementPatterns on SortArrangement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SortArrangement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SortArrangement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SortArrangement value)  $default,){
final _that = this;
switch (_that) {
case _SortArrangement():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SortArrangement value)?  $default,){
final _that = this;
switch (_that) {
case _SortArrangement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Arrangement customOrder,  Map<String, Map<StockEntityType, List<String>>> sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SortArrangement() when $default != null:
return $default(_that.customOrder,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Arrangement customOrder,  Map<String, Map<StockEntityType, List<String>>> sortOrder)  $default,) {final _that = this;
switch (_that) {
case _SortArrangement():
return $default(_that.customOrder,_that.sortOrder);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Arrangement customOrder,  Map<String, Map<StockEntityType, List<String>>> sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _SortArrangement() when $default != null:
return $default(_that.customOrder,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SortArrangement extends SortArrangement {
  const _SortArrangement({final  Arrangement customOrder = const {}, final  Map<String, Map<StockEntityType, List<String>>> sortOrder = const {}}): _customOrder = customOrder,_sortOrder = sortOrder,super._();
  factory _SortArrangement.fromJson(Map<String, dynamic> json) => _$SortArrangementFromJson(json);

/// Порядок для кастомного режима (sortMode == null).
 final  Arrangement _customOrder;
/// Порядок для кастомного режима (sortMode == null).
@override@JsonKey() Arrangement get customOrder {
  if (_customOrder is EqualUnmodifiableMapView) return _customOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customOrder);
}

/// Порядок для режима сортировки (sortMode != null).
/// Ключ: parentId (или '__roots__').
/// Значение: key - parentId, value - распределение сущностей
/// среди всех сущностей одного типа
 final  Map<String, Map<StockEntityType, List<String>>> _sortOrder;
/// Порядок для режима сортировки (sortMode != null).
/// Ключ: parentId (или '__roots__').
/// Значение: key - parentId, value - распределение сущностей
/// среди всех сущностей одного типа
@override@JsonKey() Map<String, Map<StockEntityType, List<String>>> get sortOrder {
  if (_sortOrder is EqualUnmodifiableMapView) return _sortOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sortOrder);
}


/// Create a copy of SortArrangement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortArrangementCopyWith<_SortArrangement> get copyWith => __$SortArrangementCopyWithImpl<_SortArrangement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SortArrangementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortArrangement&&const DeepCollectionEquality().equals(other._customOrder, _customOrder)&&const DeepCollectionEquality().equals(other._sortOrder, _sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_customOrder),const DeepCollectionEquality().hash(_sortOrder));

@override
String toString() {
  return 'SortArrangement(customOrder: $customOrder, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$SortArrangementCopyWith<$Res> implements $SortArrangementCopyWith<$Res> {
  factory _$SortArrangementCopyWith(_SortArrangement value, $Res Function(_SortArrangement) _then) = __$SortArrangementCopyWithImpl;
@override @useResult
$Res call({
 Arrangement customOrder, Map<String, Map<StockEntityType, List<String>>> sortOrder
});




}
/// @nodoc
class __$SortArrangementCopyWithImpl<$Res>
    implements _$SortArrangementCopyWith<$Res> {
  __$SortArrangementCopyWithImpl(this._self, this._then);

  final _SortArrangement _self;
  final $Res Function(_SortArrangement) _then;

/// Create a copy of SortArrangement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customOrder = null,Object? sortOrder = null,}) {
  return _then(_SortArrangement(
customOrder: null == customOrder ? _self._customOrder : customOrder // ignore: cast_nullable_to_non_nullable
as Arrangement,sortOrder: null == sortOrder ? _self._sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as Map<String, Map<StockEntityType, List<String>>>,
  ));
}


}

// dart format on
