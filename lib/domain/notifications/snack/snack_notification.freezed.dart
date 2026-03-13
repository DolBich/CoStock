// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snack_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SnackNotification {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnackNotification);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SnackNotification()';
}


}

/// @nodoc
class $SnackNotificationCopyWith<$Res>  {
$SnackNotificationCopyWith(SnackNotification _, $Res Function(SnackNotification) __);
}


/// Adds pattern-matching-related methods to [SnackNotification].
extension SnackNotificationPatterns on SnackNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SnackError value)?  error,TResult Function( SnackSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SnackError() when error != null:
return error(_that);case SnackSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SnackError value)  error,required TResult Function( SnackSuccess value)  success,}){
final _that = this;
switch (_that) {
case SnackError():
return error(_that);case SnackSuccess():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SnackError value)?  error,TResult? Function( SnackSuccess value)?  success,}){
final _that = this;
switch (_that) {
case SnackError() when error != null:
return error(_that);case SnackSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppError error)?  error,TResult Function( AppSuccess success)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SnackError() when error != null:
return error(_that.error);case SnackSuccess() when success != null:
return success(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppError error)  error,required TResult Function( AppSuccess success)  success,}) {final _that = this;
switch (_that) {
case SnackError():
return error(_that.error);case SnackSuccess():
return success(_that.success);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppError error)?  error,TResult? Function( AppSuccess success)?  success,}) {final _that = this;
switch (_that) {
case SnackError() when error != null:
return error(_that.error);case SnackSuccess() when success != null:
return success(_that.success);case _:
  return null;

}
}

}

/// @nodoc


class SnackError extends SnackNotification {
  const SnackError(this.error): super._();
  

 final  AppError error;

/// Create a copy of SnackNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnackErrorCopyWith<SnackError> get copyWith => _$SnackErrorCopyWithImpl<SnackError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnackError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SnackNotification.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $SnackErrorCopyWith<$Res> implements $SnackNotificationCopyWith<$Res> {
  factory $SnackErrorCopyWith(SnackError value, $Res Function(SnackError) _then) = _$SnackErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$SnackErrorCopyWithImpl<$Res>
    implements $SnackErrorCopyWith<$Res> {
  _$SnackErrorCopyWithImpl(this._self, this._then);

  final SnackError _self;
  final $Res Function(SnackError) _then;

/// Create a copy of SnackNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SnackError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of SnackNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc


class SnackSuccess extends SnackNotification {
  const SnackSuccess(this.success): super._();
  

 final  AppSuccess success;

/// Create a copy of SnackNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnackSuccessCopyWith<SnackSuccess> get copyWith => _$SnackSuccessCopyWithImpl<SnackSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnackSuccess&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'SnackNotification.success(success: $success)';
}


}

/// @nodoc
abstract mixin class $SnackSuccessCopyWith<$Res> implements $SnackNotificationCopyWith<$Res> {
  factory $SnackSuccessCopyWith(SnackSuccess value, $Res Function(SnackSuccess) _then) = _$SnackSuccessCopyWithImpl;
@useResult
$Res call({
 AppSuccess success
});


$AppSuccessCopyWith<$Res> get success;

}
/// @nodoc
class _$SnackSuccessCopyWithImpl<$Res>
    implements $SnackSuccessCopyWith<$Res> {
  _$SnackSuccessCopyWithImpl(this._self, this._then);

  final SnackSuccess _self;
  final $Res Function(SnackSuccess) _then;

/// Create a copy of SnackNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(SnackSuccess(
null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as AppSuccess,
  ));
}

/// Create a copy of SnackNotification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSuccessCopyWith<$Res> get success {
  
  return $AppSuccessCopyWith<$Res>(_self.success, (value) {
    return _then(_self.copyWith(success: value));
  });
}
}

/// @nodoc
mixin _$AppSuccess {

 AuthSuccessType get type; String? get msg;
/// Create a copy of AppSuccess
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSuccessCopyWith<AppSuccess> get copyWith => _$AppSuccessCopyWithImpl<AppSuccess>(this as AppSuccess, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSuccess&&(identical(other.type, type) || other.type == type)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,type,msg);

@override
String toString() {
  return 'AppSuccess(type: $type, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $AppSuccessCopyWith<$Res>  {
  factory $AppSuccessCopyWith(AppSuccess value, $Res Function(AppSuccess) _then) = _$AppSuccessCopyWithImpl;
@useResult
$Res call({
 AuthSuccessType type, String? msg
});




}
/// @nodoc
class _$AppSuccessCopyWithImpl<$Res>
    implements $AppSuccessCopyWith<$Res> {
  _$AppSuccessCopyWithImpl(this._self, this._then);

  final AppSuccess _self;
  final $Res Function(AppSuccess) _then;

/// Create a copy of AppSuccess
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? msg = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AuthSuccessType,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSuccess].
extension AppSuccessPatterns on AppSuccess {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthSuccess value)?  auth,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSuccess() when auth != null:
return auth(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthSuccess value)  auth,}){
final _that = this;
switch (_that) {
case _AuthSuccess():
return auth(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthSuccess value)?  auth,}){
final _that = this;
switch (_that) {
case _AuthSuccess() when auth != null:
return auth(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthSuccessType type,  String? msg)?  auth,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSuccess() when auth != null:
return auth(_that.type,_that.msg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthSuccessType type,  String? msg)  auth,}) {final _that = this;
switch (_that) {
case _AuthSuccess():
return auth(_that.type,_that.msg);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthSuccessType type,  String? msg)?  auth,}) {final _that = this;
switch (_that) {
case _AuthSuccess() when auth != null:
return auth(_that.type,_that.msg);case _:
  return null;

}
}

}

/// @nodoc


class _AuthSuccess extends AppSuccess {
  const _AuthSuccess({required this.type, this.msg}): super._();
  

@override final  AuthSuccessType type;
@override final  String? msg;

/// Create a copy of AppSuccess
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSuccessCopyWith<_AuthSuccess> get copyWith => __$AuthSuccessCopyWithImpl<_AuthSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSuccess&&(identical(other.type, type) || other.type == type)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,type,msg);

@override
String toString() {
  return 'AppSuccess.auth(type: $type, msg: $msg)';
}


}

/// @nodoc
abstract mixin class _$AuthSuccessCopyWith<$Res> implements $AppSuccessCopyWith<$Res> {
  factory _$AuthSuccessCopyWith(_AuthSuccess value, $Res Function(_AuthSuccess) _then) = __$AuthSuccessCopyWithImpl;
@override @useResult
$Res call({
 AuthSuccessType type, String? msg
});




}
/// @nodoc
class __$AuthSuccessCopyWithImpl<$Res>
    implements _$AuthSuccessCopyWith<$Res> {
  __$AuthSuccessCopyWithImpl(this._self, this._then);

  final _AuthSuccess _self;
  final $Res Function(_AuthSuccess) _then;

/// Create a copy of AppSuccess
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? msg = freezed,}) {
  return _then(_AuthSuccess(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AuthSuccessType,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthError value)?  auth,TResult Function( _ServerError value)?  server,TResult Function( _ClientError value)?  client,TResult Function( _ValidatorError value)?  validator,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that);case _ServerError() when server != null:
return server(_that);case _ClientError() when client != null:
return client(_that);case _ValidatorError() when validator != null:
return validator(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthError value)  auth,required TResult Function( _ServerError value)  server,required TResult Function( _ClientError value)  client,required TResult Function( _ValidatorError value)  validator,}){
final _that = this;
switch (_that) {
case _AuthError():
return auth(_that);case _ServerError():
return server(_that);case _ClientError():
return client(_that);case _ValidatorError():
return validator(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthError value)?  auth,TResult? Function( _ServerError value)?  server,TResult? Function( _ClientError value)?  client,TResult? Function( _ValidatorError value)?  validator,}){
final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that);case _ServerError() when server != null:
return server(_that);case _ClientError() when client != null:
return client(_that);case _ValidatorError() when validator != null:
return validator(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthErrorType type,  String? msg)?  auth,TResult Function( ServerErrorType type,  String? msg)?  server,TResult Function( ClientErrorType type,  String? msg)?  client,TResult Function( ValidatorErrorType type,  String? msg)?  validator,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that.type,_that.msg);case _ServerError() when server != null:
return server(_that.type,_that.msg);case _ClientError() when client != null:
return client(_that.type,_that.msg);case _ValidatorError() when validator != null:
return validator(_that.type,_that.msg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthErrorType type,  String? msg)  auth,required TResult Function( ServerErrorType type,  String? msg)  server,required TResult Function( ClientErrorType type,  String? msg)  client,required TResult Function( ValidatorErrorType type,  String? msg)  validator,}) {final _that = this;
switch (_that) {
case _AuthError():
return auth(_that.type,_that.msg);case _ServerError():
return server(_that.type,_that.msg);case _ClientError():
return client(_that.type,_that.msg);case _ValidatorError():
return validator(_that.type,_that.msg);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthErrorType type,  String? msg)?  auth,TResult? Function( ServerErrorType type,  String? msg)?  server,TResult? Function( ClientErrorType type,  String? msg)?  client,TResult? Function( ValidatorErrorType type,  String? msg)?  validator,}) {final _that = this;
switch (_that) {
case _AuthError() when auth != null:
return auth(_that.type,_that.msg);case _ServerError() when server != null:
return server(_that.type,_that.msg);case _ClientError() when client != null:
return client(_that.type,_that.msg);case _ValidatorError() when validator != null:
return validator(_that.type,_that.msg);case _:
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

/// @nodoc


class _ValidatorError extends AppError {
  const _ValidatorError({required this.type, this.msg}): super._();
  

@override final  ValidatorErrorType type;
@override final  String? msg;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidatorErrorCopyWith<_ValidatorError> get copyWith => __$ValidatorErrorCopyWithImpl<_ValidatorError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidatorError&&(identical(other.type, type) || other.type == type)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,type,msg);

@override
String toString() {
  return 'AppError.validator(type: $type, msg: $msg)';
}


}

/// @nodoc
abstract mixin class _$ValidatorErrorCopyWith<$Res> implements $AppErrorCopyWith<$Res> {
  factory _$ValidatorErrorCopyWith(_ValidatorError value, $Res Function(_ValidatorError) _then) = __$ValidatorErrorCopyWithImpl;
@override @useResult
$Res call({
 ValidatorErrorType type, String? msg
});




}
/// @nodoc
class __$ValidatorErrorCopyWithImpl<$Res>
    implements _$ValidatorErrorCopyWith<$Res> {
  __$ValidatorErrorCopyWithImpl(this._self, this._then);

  final _ValidatorError _self;
  final $Res Function(_ValidatorError) _then;

/// Create a copy of AppError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? msg = freezed,}) {
  return _then(_ValidatorError(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ValidatorErrorType,msg: freezed == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
