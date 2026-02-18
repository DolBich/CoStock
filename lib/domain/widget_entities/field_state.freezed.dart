// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FieldState {

 String get value; String? get error; bool get isLoading;/// нужно для показа ошибки только после взаимодействия
 bool get hasInteracted; ValidationRule? get instantValidator; ValidationRule? get finalValidator;
/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldStateCopyWith<FieldState> get copyWith => _$FieldStateCopyWithImpl<FieldState>(this as FieldState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldState&&(identical(other.value, value) || other.value == value)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasInteracted, hasInteracted) || other.hasInteracted == hasInteracted)&&(identical(other.instantValidator, instantValidator) || other.instantValidator == instantValidator)&&(identical(other.finalValidator, finalValidator) || other.finalValidator == finalValidator));
}


@override
int get hashCode => Object.hash(runtimeType,value,error,isLoading,hasInteracted,instantValidator,finalValidator);

@override
String toString() {
  return 'FieldState(value: $value, error: $error, isLoading: $isLoading, hasInteracted: $hasInteracted, instantValidator: $instantValidator, finalValidator: $finalValidator)';
}


}

/// @nodoc
abstract mixin class $FieldStateCopyWith<$Res>  {
  factory $FieldStateCopyWith(FieldState value, $Res Function(FieldState) _then) = _$FieldStateCopyWithImpl;
@useResult
$Res call({
 String value, String? error, bool isLoading, bool hasInteracted, ValidationRule? instantValidator, ValidationRule? finalValidator
});




}
/// @nodoc
class _$FieldStateCopyWithImpl<$Res>
    implements $FieldStateCopyWith<$Res> {
  _$FieldStateCopyWithImpl(this._self, this._then);

  final FieldState _self;
  final $Res Function(FieldState) _then;

/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? error = freezed,Object? isLoading = null,Object? hasInteracted = null,Object? instantValidator = freezed,Object? finalValidator = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasInteracted: null == hasInteracted ? _self.hasInteracted : hasInteracted // ignore: cast_nullable_to_non_nullable
as bool,instantValidator: freezed == instantValidator ? _self.instantValidator : instantValidator // ignore: cast_nullable_to_non_nullable
as ValidationRule?,finalValidator: freezed == finalValidator ? _self.finalValidator : finalValidator // ignore: cast_nullable_to_non_nullable
as ValidationRule?,
  ));
}

}


/// Adds pattern-matching-related methods to [FieldState].
extension FieldStatePatterns on FieldState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FieldState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FieldState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FieldState value)  $default,){
final _that = this;
switch (_that) {
case _FieldState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FieldState value)?  $default,){
final _that = this;
switch (_that) {
case _FieldState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String? error,  bool isLoading,  bool hasInteracted,  ValidationRule? instantValidator,  ValidationRule? finalValidator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldState() when $default != null:
return $default(_that.value,_that.error,_that.isLoading,_that.hasInteracted,_that.instantValidator,_that.finalValidator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String? error,  bool isLoading,  bool hasInteracted,  ValidationRule? instantValidator,  ValidationRule? finalValidator)  $default,) {final _that = this;
switch (_that) {
case _FieldState():
return $default(_that.value,_that.error,_that.isLoading,_that.hasInteracted,_that.instantValidator,_that.finalValidator);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String? error,  bool isLoading,  bool hasInteracted,  ValidationRule? instantValidator,  ValidationRule? finalValidator)?  $default,) {final _that = this;
switch (_that) {
case _FieldState() when $default != null:
return $default(_that.value,_that.error,_that.isLoading,_that.hasInteracted,_that.instantValidator,_that.finalValidator);case _:
  return null;

}
}

}

/// @nodoc


class _FieldState implements FieldState {
  const _FieldState({this.value = '', this.error, this.isLoading = false, this.hasInteracted = false, this.instantValidator, this.finalValidator});
  

@override@JsonKey() final  String value;
@override final  String? error;
@override@JsonKey() final  bool isLoading;
/// нужно для показа ошибки только после взаимодействия
@override@JsonKey() final  bool hasInteracted;
@override final  ValidationRule? instantValidator;
@override final  ValidationRule? finalValidator;

/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldStateCopyWith<_FieldState> get copyWith => __$FieldStateCopyWithImpl<_FieldState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldState&&(identical(other.value, value) || other.value == value)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasInteracted, hasInteracted) || other.hasInteracted == hasInteracted)&&(identical(other.instantValidator, instantValidator) || other.instantValidator == instantValidator)&&(identical(other.finalValidator, finalValidator) || other.finalValidator == finalValidator));
}


@override
int get hashCode => Object.hash(runtimeType,value,error,isLoading,hasInteracted,instantValidator,finalValidator);

@override
String toString() {
  return 'FieldState(value: $value, error: $error, isLoading: $isLoading, hasInteracted: $hasInteracted, instantValidator: $instantValidator, finalValidator: $finalValidator)';
}


}

/// @nodoc
abstract mixin class _$FieldStateCopyWith<$Res> implements $FieldStateCopyWith<$Res> {
  factory _$FieldStateCopyWith(_FieldState value, $Res Function(_FieldState) _then) = __$FieldStateCopyWithImpl;
@override @useResult
$Res call({
 String value, String? error, bool isLoading, bool hasInteracted, ValidationRule? instantValidator, ValidationRule? finalValidator
});




}
/// @nodoc
class __$FieldStateCopyWithImpl<$Res>
    implements _$FieldStateCopyWith<$Res> {
  __$FieldStateCopyWithImpl(this._self, this._then);

  final _FieldState _self;
  final $Res Function(_FieldState) _then;

/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? error = freezed,Object? isLoading = null,Object? hasInteracted = null,Object? instantValidator = freezed,Object? finalValidator = freezed,}) {
  return _then(_FieldState(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasInteracted: null == hasInteracted ? _self.hasInteracted : hasInteracted // ignore: cast_nullable_to_non_nullable
as bool,instantValidator: freezed == instantValidator ? _self.instantValidator : instantValidator // ignore: cast_nullable_to_non_nullable
as ValidationRule?,finalValidator: freezed == finalValidator ? _self.finalValidator : finalValidator // ignore: cast_nullable_to_non_nullable
as ValidationRule?,
  ));
}


}

// dart format on
