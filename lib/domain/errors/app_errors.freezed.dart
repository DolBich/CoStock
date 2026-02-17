// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppError {

 Enum get type;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'AppError(type: $type)';
}


}

/// @nodoc
class $AppErrorCopyWith<$Res>  {
$AppErrorCopyWith(AppError _, $Res Function(AppError) __);
}


/// Adds pattern-matching-related methods to [AppError].
extension AppErrorPatterns on AppError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthError value)?  auth,TResult Function( _NetworkError value)?  network,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that);case _NetworkError() when network != null:
return network(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthError value)  auth,required TResult Function( _NetworkError value)  network,}){
final _that = this;
switch (_that) {
case _AuthError():
return auth(_that);case _NetworkError():
return network(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthError value)?  auth,TResult? Function( _NetworkError value)?  network,}){
final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that);case _NetworkError() when network != null:
return network(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthErrorType type,  String? msg)?  auth,TResult Function( NetworkErrorType type,  String? message)?  network,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that.type,_that.msg);case _NetworkError() when network != null:
return network(_that.type,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthErrorType type,  String? msg)  auth,required TResult Function( NetworkErrorType type,  String? message)  network,}) {final _that = this;
switch (_that) {
case _AuthError():
return auth(_that.type,_that.msg);case _NetworkError():
return network(_that.type,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthErrorType type,  String? msg)?  auth,TResult? Function( NetworkErrorType type,  String? message)?  network,}) {final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that.type,_that.msg);case _NetworkError() when network != null:
return network(_that.type,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AuthError extends AppError {
  const _AuthError({required this.type, this.msg}): super._();
  

@override final  AuthErrorType type;
 final  String? msg;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthErrorCopyWith<_AuthError> get copyWith => __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthError&&(identical(other.type, type) || other.type == type)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,type,msg);

@override
String toString() {
  return 'AppError.auth(type: $type, msg: $msg)';
}


}

/// @nodoc
abstract mixin class _$AuthErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$AuthErrorCopyWith(_AuthError value, $Res Function(_AuthError) _then) = __$AuthErrorCopyWithImpl;
@useResult
$Res call({
 AuthErrorType type, String? msg
});




}
/// @nodoc
class __$AuthErrorCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(this._self, this._then);

  final _AuthError _self;
  final $Res Function(_AuthError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? msg = freezed,}) {
  return _then(_AuthError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AuthErrorType,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _NetworkError extends AppError {
  const _NetworkError({required this.type, this.message}): super._();
  

@override final  NetworkErrorType type;
 final  String? message;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkErrorCopyWith<_NetworkError> get copyWith => __$NetworkErrorCopyWithImpl<_NetworkError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkError&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,type,message);

@override
String toString() {
  return 'AppError.network(type: $type, message: $message)';
}


}

/// @nodoc
abstract mixin class _$NetworkErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$NetworkErrorCopyWith(_NetworkError value, $Res Function(_NetworkError) _then) = __$NetworkErrorCopyWithImpl;
@useResult
$Res call({
 NetworkErrorType type, String? message
});




}
/// @nodoc
class __$NetworkErrorCopyWithImpl<$Res>
    implements _$NetworkErrorCopyWith<$Res> {
  __$NetworkErrorCopyWithImpl(this._self, this._then);

  final _NetworkError _self;
  final $Res Function(_NetworkError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? message = freezed,}) {
  return _then(_NetworkError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NetworkErrorType,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
