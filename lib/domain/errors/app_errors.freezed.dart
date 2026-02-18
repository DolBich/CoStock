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

 Enum get type; String? get msg;
/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppErrorCopyWith<AppError> get copyWith => _$AppErrorCopyWithImpl<AppError>(this as AppError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppError&&(identical(other.type, type) || other.type == type)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,type,msg);

@override
String toString() {
  return 'AppError(type: $type, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $AppErrorCopyWith<$Res>  {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) _then) = _$AppErrorCopyWithImpl;
@useResult
$Res call({
 String? msg
});




}
/// @nodoc
class _$AppErrorCopyWithImpl<$Res>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._self, this._then);

  final AppError _self;
  final $Res Function(AppError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? msg = freezed,}) {
  return _then(_self.copyWith(
msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthError value)?  auth,TResult Function( _ServerError value)?  server,TResult Function( _ClientError value)?  client,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that);case _ServerError() when server != null:
return server(_that);case _ClientError() when client != null:
return client(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthError value)  auth,required TResult Function( _ServerError value)  server,required TResult Function( _ClientError value)  client,}){
final _that = this;
switch (_that) {
case _AuthError():
return auth(_that);case _ServerError():
return server(_that);case _ClientError():
return client(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthError value)?  auth,TResult? Function( _ServerError value)?  server,TResult? Function( _ClientError value)?  client,}){
final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that);case _ServerError() when server != null:
return server(_that);case _ClientError() when client != null:
return client(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthErrorType type,  String? msg)?  auth,TResult Function( ServerErrorType type,  String? msg)?  server,TResult Function( ClientErrorType type,  String? msg)?  client,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that.type,_that.msg);case _ServerError() when server != null:
return server(_that.type,_that.msg);case _ClientError() when client != null:
return client(_that.type,_that.msg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthErrorType type,  String? msg)  auth,required TResult Function( ServerErrorType type,  String? msg)  server,required TResult Function( ClientErrorType type,  String? msg)  client,}) {final _that = this;
switch (_that) {
case _AuthError():
return auth(_that.type,_that.msg);case _ServerError():
return server(_that.type,_that.msg);case _ClientError():
return client(_that.type,_that.msg);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthErrorType type,  String? msg)?  auth,TResult? Function( ServerErrorType type,  String? msg)?  server,TResult? Function( ClientErrorType type,  String? msg)?  client,}) {final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that.type,_that.msg);case _ServerError() when server != null:
return server(_that.type,_that.msg);case _ClientError() when client != null:
return client(_that.type,_that.msg);case _:
  return null;

}
}

}

/// @nodoc


class _AuthError extends AppError {
  const _AuthError({required this.type, this.msg}): super._();
  

@override final  AuthErrorType type;
@override final  String? msg;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? msg = freezed,}) {
  return _then(_AuthError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AuthErrorType,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ServerError extends AppError {
  const _ServerError({required this.type, this.msg}): super._();
  

@override final  ServerErrorType type;
@override final  String? msg;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorCopyWith<_ServerError> get copyWith => __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError&&(identical(other.type, type) || other.type == type)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,type,msg);

@override
String toString() {
  return 'AppError.server(type: $type, msg: $msg)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(_ServerError value, $Res Function(_ServerError) _then) = __$ServerErrorCopyWithImpl;
@override @useResult
$Res call({
 ServerErrorType type, String? msg
});




}
/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? msg = freezed,}) {
  return _then(_ServerError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServerErrorType,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ClientError extends AppError {
  const _ClientError({required this.type, this.msg}): super._();
  

@override final  ClientErrorType type;
@override final  String? msg;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientErrorCopyWith<_ClientError> get copyWith => __$ClientErrorCopyWithImpl<_ClientError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientError&&(identical(other.type, type) || other.type == type)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,type,msg);

@override
String toString() {
  return 'AppError.client(type: $type, msg: $msg)';
}


}

/// @nodoc
abstract mixin class _$ClientErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$ClientErrorCopyWith(_ClientError value, $Res Function(_ClientError) _then) = __$ClientErrorCopyWithImpl;
@override @useResult
$Res call({
 ClientErrorType type, String? msg
});




}
/// @nodoc
class __$ClientErrorCopyWithImpl<$Res>
    implements _$ClientErrorCopyWith<$Res> {
  __$ClientErrorCopyWithImpl(this._self, this._then);

  final _ClientError _self;
  final $Res Function(_ClientError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? msg = freezed,}) {
  return _then(_ClientError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClientErrorType,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
