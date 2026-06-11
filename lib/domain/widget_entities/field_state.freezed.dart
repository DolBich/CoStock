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

 String get value; bool get isLoading;/// [false] - не валидируем и не показываем ошибки
/// Нужно чтобы ошибки и успехи не отображались сразу, а только если
/// пользователь уже что-то сделал с полем
 bool get wasInteracted;/// null - пустая строка
 bool? get errorPersisted; ValidationResult? get validationResult; SnackNotification? get notification; bool get removing;
/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldStateCopyWith<FieldState> get copyWith => _$FieldStateCopyWithImpl<FieldState>(this as FieldState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldState&&(identical(other.value, value) || other.value == value)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.wasInteracted, wasInteracted) || other.wasInteracted == wasInteracted)&&(identical(other.errorPersisted, errorPersisted) || other.errorPersisted == errorPersisted)&&(identical(other.validationResult, validationResult) || other.validationResult == validationResult)&&(identical(other.notification, notification) || other.notification == notification)&&(identical(other.removing, removing) || other.removing == removing));
}


@override
int get hashCode => Object.hash(runtimeType,value,isLoading,wasInteracted,errorPersisted,validationResult,notification,removing);

@override
String toString() {
  return 'FieldState(value: $value, isLoading: $isLoading, wasInteracted: $wasInteracted, errorPersisted: $errorPersisted, validationResult: $validationResult, notification: $notification, removing: $removing)';
}


}

/// @nodoc
abstract mixin class $FieldStateCopyWith<$Res>  {
  factory $FieldStateCopyWith(FieldState value, $Res Function(FieldState) _then) = _$FieldStateCopyWithImpl;
@useResult
$Res call({
 String value, bool isLoading, bool wasInteracted, bool? errorPersisted, ValidationResult? validationResult, SnackNotification? notification, bool removing
});


$ValidationResultCopyWith<$Res>? get validationResult;$SnackNotificationCopyWith<$Res>? get notification;

}
/// @nodoc
class _$FieldStateCopyWithImpl<$Res>
    implements $FieldStateCopyWith<$Res> {
  _$FieldStateCopyWithImpl(this._self, this._then);

  final FieldState _self;
  final $Res Function(FieldState) _then;

/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? isLoading = null,Object? wasInteracted = null,Object? errorPersisted = freezed,Object? validationResult = freezed,Object? notification = freezed,Object? removing = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,wasInteracted: null == wasInteracted ? _self.wasInteracted : wasInteracted // ignore: cast_nullable_to_non_nullable
as bool,errorPersisted: freezed == errorPersisted ? _self.errorPersisted : errorPersisted // ignore: cast_nullable_to_non_nullable
as bool?,validationResult: freezed == validationResult ? _self.validationResult : validationResult // ignore: cast_nullable_to_non_nullable
as ValidationResult?,notification: freezed == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as SnackNotification?,removing: null == removing ? _self.removing : removing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationResultCopyWith<$Res>? get validationResult {
    if (_self.validationResult == null) {
    return null;
  }

  return $ValidationResultCopyWith<$Res>(_self.validationResult!, (value) {
    return _then(_self.copyWith(validationResult: value));
  });
}/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnackNotificationCopyWith<$Res>? get notification {
    if (_self.notification == null) {
    return null;
  }

  return $SnackNotificationCopyWith<$Res>(_self.notification!, (value) {
    return _then(_self.copyWith(notification: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  bool isLoading,  bool wasInteracted,  bool? errorPersisted,  ValidationResult? validationResult,  SnackNotification? notification,  bool removing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldState() when $default != null:
return $default(_that.value,_that.isLoading,_that.wasInteracted,_that.errorPersisted,_that.validationResult,_that.notification,_that.removing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  bool isLoading,  bool wasInteracted,  bool? errorPersisted,  ValidationResult? validationResult,  SnackNotification? notification,  bool removing)  $default,) {final _that = this;
switch (_that) {
case _FieldState():
return $default(_that.value,_that.isLoading,_that.wasInteracted,_that.errorPersisted,_that.validationResult,_that.notification,_that.removing);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  bool isLoading,  bool wasInteracted,  bool? errorPersisted,  ValidationResult? validationResult,  SnackNotification? notification,  bool removing)?  $default,) {final _that = this;
switch (_that) {
case _FieldState() when $default != null:
return $default(_that.value,_that.isLoading,_that.wasInteracted,_that.errorPersisted,_that.validationResult,_that.notification,_that.removing);case _:
  return null;

}
}

}

/// @nodoc


class _FieldState extends FieldState {
  const _FieldState({this.value = '', this.isLoading = false, this.wasInteracted = false, this.errorPersisted = false, this.validationResult, this.notification, this.removing = false}): super._();
  

@override@JsonKey() final  String value;
@override@JsonKey() final  bool isLoading;
/// [false] - не валидируем и не показываем ошибки
/// Нужно чтобы ошибки и успехи не отображались сразу, а только если
/// пользователь уже что-то сделал с полем
@override@JsonKey() final  bool wasInteracted;
/// null - пустая строка
@override@JsonKey() final  bool? errorPersisted;
@override final  ValidationResult? validationResult;
@override final  SnackNotification? notification;
@override@JsonKey() final  bool removing;

/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldStateCopyWith<_FieldState> get copyWith => __$FieldStateCopyWithImpl<_FieldState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldState&&(identical(other.value, value) || other.value == value)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.wasInteracted, wasInteracted) || other.wasInteracted == wasInteracted)&&(identical(other.errorPersisted, errorPersisted) || other.errorPersisted == errorPersisted)&&(identical(other.validationResult, validationResult) || other.validationResult == validationResult)&&(identical(other.notification, notification) || other.notification == notification)&&(identical(other.removing, removing) || other.removing == removing));
}


@override
int get hashCode => Object.hash(runtimeType,value,isLoading,wasInteracted,errorPersisted,validationResult,notification,removing);

@override
String toString() {
  return 'FieldState(value: $value, isLoading: $isLoading, wasInteracted: $wasInteracted, errorPersisted: $errorPersisted, validationResult: $validationResult, notification: $notification, removing: $removing)';
}


}

/// @nodoc
abstract mixin class _$FieldStateCopyWith<$Res> implements $FieldStateCopyWith<$Res> {
  factory _$FieldStateCopyWith(_FieldState value, $Res Function(_FieldState) _then) = __$FieldStateCopyWithImpl;
@override @useResult
$Res call({
 String value, bool isLoading, bool wasInteracted, bool? errorPersisted, ValidationResult? validationResult, SnackNotification? notification, bool removing
});


@override $ValidationResultCopyWith<$Res>? get validationResult;@override $SnackNotificationCopyWith<$Res>? get notification;

}
/// @nodoc
class __$FieldStateCopyWithImpl<$Res>
    implements _$FieldStateCopyWith<$Res> {
  __$FieldStateCopyWithImpl(this._self, this._then);

  final _FieldState _self;
  final $Res Function(_FieldState) _then;

/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? isLoading = null,Object? wasInteracted = null,Object? errorPersisted = freezed,Object? validationResult = freezed,Object? notification = freezed,Object? removing = null,}) {
  return _then(_FieldState(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,wasInteracted: null == wasInteracted ? _self.wasInteracted : wasInteracted // ignore: cast_nullable_to_non_nullable
as bool,errorPersisted: freezed == errorPersisted ? _self.errorPersisted : errorPersisted // ignore: cast_nullable_to_non_nullable
as bool?,validationResult: freezed == validationResult ? _self.validationResult : validationResult // ignore: cast_nullable_to_non_nullable
as ValidationResult?,notification: freezed == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as SnackNotification?,removing: null == removing ? _self.removing : removing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationResultCopyWith<$Res>? get validationResult {
    if (_self.validationResult == null) {
    return null;
  }

  return $ValidationResultCopyWith<$Res>(_self.validationResult!, (value) {
    return _then(_self.copyWith(validationResult: value));
  });
}/// Create a copy of FieldState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnackNotificationCopyWith<$Res>? get notification {
    if (_self.notification == null) {
    return null;
  }

  return $SnackNotificationCopyWith<$Res>(_self.notification!, (value) {
    return _then(_self.copyWith(notification: value));
  });
}
}

// dart format on
