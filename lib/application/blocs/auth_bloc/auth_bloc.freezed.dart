// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ChangeMode value)?  changeMode,TResult Function( _ChangeMethod value)?  changeMethod,TResult Function( _SubmitIdentifier value)?  submitIdentifier,TResult Function( _SubmitPassword value)?  submitPassword,TResult Function( _RegisterDetail value)?  registerDetail,TResult Function( _ToggleIdentifier value)?  toggleIdentifier,TResult Function( _ChangeName value)?  changeName,TResult Function( _SkipDetails value)?  skipDetails,TResult Function( _UpdateField value)?  updateField,TResult Function( _CheckDetail value)?  checkDetail,TResult Function( _TrySubmit value)?  trySubmit,TResult Function( _RegisterAllDetails value)?  registerAllDetails,TResult Function( _RemoveDetail value)?  removeDetail,TResult Function( _RemoveDetailFinal value)?  removeDetailFinal,TResult Function( _SystemGoBack value)?  systemGoBack,TResult Function( _UiGoBack value)?  uiGoBack,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeMode() when changeMode != null:
return changeMode(_that);case _ChangeMethod() when changeMethod != null:
return changeMethod(_that);case _SubmitIdentifier() when submitIdentifier != null:
return submitIdentifier(_that);case _SubmitPassword() when submitPassword != null:
return submitPassword(_that);case _RegisterDetail() when registerDetail != null:
return registerDetail(_that);case _ToggleIdentifier() when toggleIdentifier != null:
return toggleIdentifier(_that);case _ChangeName() when changeName != null:
return changeName(_that);case _SkipDetails() when skipDetails != null:
return skipDetails(_that);case _UpdateField() when updateField != null:
return updateField(_that);case _CheckDetail() when checkDetail != null:
return checkDetail(_that);case _TrySubmit() when trySubmit != null:
return trySubmit(_that);case _RegisterAllDetails() when registerAllDetails != null:
return registerAllDetails(_that);case _RemoveDetail() when removeDetail != null:
return removeDetail(_that);case _RemoveDetailFinal() when removeDetailFinal != null:
return removeDetailFinal(_that);case _SystemGoBack() when systemGoBack != null:
return systemGoBack(_that);case _UiGoBack() when uiGoBack != null:
return uiGoBack(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ChangeMode value)  changeMode,required TResult Function( _ChangeMethod value)  changeMethod,required TResult Function( _SubmitIdentifier value)  submitIdentifier,required TResult Function( _SubmitPassword value)  submitPassword,required TResult Function( _RegisterDetail value)  registerDetail,required TResult Function( _ToggleIdentifier value)  toggleIdentifier,required TResult Function( _ChangeName value)  changeName,required TResult Function( _SkipDetails value)  skipDetails,required TResult Function( _UpdateField value)  updateField,required TResult Function( _CheckDetail value)  checkDetail,required TResult Function( _TrySubmit value)  trySubmit,required TResult Function( _RegisterAllDetails value)  registerAllDetails,required TResult Function( _RemoveDetail value)  removeDetail,required TResult Function( _RemoveDetailFinal value)  removeDetailFinal,required TResult Function( _SystemGoBack value)  systemGoBack,required TResult Function( _UiGoBack value)  uiGoBack,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ChangeMode():
return changeMode(_that);case _ChangeMethod():
return changeMethod(_that);case _SubmitIdentifier():
return submitIdentifier(_that);case _SubmitPassword():
return submitPassword(_that);case _RegisterDetail():
return registerDetail(_that);case _ToggleIdentifier():
return toggleIdentifier(_that);case _ChangeName():
return changeName(_that);case _SkipDetails():
return skipDetails(_that);case _UpdateField():
return updateField(_that);case _CheckDetail():
return checkDetail(_that);case _TrySubmit():
return trySubmit(_that);case _RegisterAllDetails():
return registerAllDetails(_that);case _RemoveDetail():
return removeDetail(_that);case _RemoveDetailFinal():
return removeDetailFinal(_that);case _SystemGoBack():
return systemGoBack(_that);case _UiGoBack():
return uiGoBack(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ChangeMode value)?  changeMode,TResult? Function( _ChangeMethod value)?  changeMethod,TResult? Function( _SubmitIdentifier value)?  submitIdentifier,TResult? Function( _SubmitPassword value)?  submitPassword,TResult? Function( _RegisterDetail value)?  registerDetail,TResult? Function( _ToggleIdentifier value)?  toggleIdentifier,TResult? Function( _ChangeName value)?  changeName,TResult? Function( _SkipDetails value)?  skipDetails,TResult? Function( _UpdateField value)?  updateField,TResult? Function( _CheckDetail value)?  checkDetail,TResult? Function( _TrySubmit value)?  trySubmit,TResult? Function( _RegisterAllDetails value)?  registerAllDetails,TResult? Function( _RemoveDetail value)?  removeDetail,TResult? Function( _RemoveDetailFinal value)?  removeDetailFinal,TResult? Function( _SystemGoBack value)?  systemGoBack,TResult? Function( _UiGoBack value)?  uiGoBack,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeMode() when changeMode != null:
return changeMode(_that);case _ChangeMethod() when changeMethod != null:
return changeMethod(_that);case _SubmitIdentifier() when submitIdentifier != null:
return submitIdentifier(_that);case _SubmitPassword() when submitPassword != null:
return submitPassword(_that);case _RegisterDetail() when registerDetail != null:
return registerDetail(_that);case _ToggleIdentifier() when toggleIdentifier != null:
return toggleIdentifier(_that);case _ChangeName() when changeName != null:
return changeName(_that);case _SkipDetails() when skipDetails != null:
return skipDetails(_that);case _UpdateField() when updateField != null:
return updateField(_that);case _CheckDetail() when checkDetail != null:
return checkDetail(_that);case _TrySubmit() when trySubmit != null:
return trySubmit(_that);case _RegisterAllDetails() when registerAllDetails != null:
return registerAllDetails(_that);case _RemoveDetail() when removeDetail != null:
return removeDetail(_that);case _RemoveDetailFinal() when removeDetailFinal != null:
return removeDetailFinal(_that);case _SystemGoBack() when systemGoBack != null:
return systemGoBack(_that);case _UiGoBack() when uiGoBack != null:
return uiGoBack(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( AuthMode mode)?  changeMode,TResult Function( AuthMethod method)?  changeMethod,TResult Function()?  submitIdentifier,TResult Function()?  submitPassword,TResult Function( AuthMethod method)?  registerDetail,TResult Function()?  toggleIdentifier,TResult Function()?  changeName,TResult Function( bool? dontAskAgain)?  skipDetails,TResult Function( AuthField field,  FieldState value)?  updateField,TResult Function( AuthMethod method)?  checkDetail,TResult Function()?  trySubmit,TResult Function()?  registerAllDetails,TResult Function( AuthMethod method)?  removeDetail,TResult Function( AuthMethod method)?  removeDetailFinal,TResult Function()?  systemGoBack,TResult Function()?  uiGoBack,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ChangeMode() when changeMode != null:
return changeMode(_that.mode);case _ChangeMethod() when changeMethod != null:
return changeMethod(_that.method);case _SubmitIdentifier() when submitIdentifier != null:
return submitIdentifier();case _SubmitPassword() when submitPassword != null:
return submitPassword();case _RegisterDetail() when registerDetail != null:
return registerDetail(_that.method);case _ToggleIdentifier() when toggleIdentifier != null:
return toggleIdentifier();case _ChangeName() when changeName != null:
return changeName();case _SkipDetails() when skipDetails != null:
return skipDetails(_that.dontAskAgain);case _UpdateField() when updateField != null:
return updateField(_that.field,_that.value);case _CheckDetail() when checkDetail != null:
return checkDetail(_that.method);case _TrySubmit() when trySubmit != null:
return trySubmit();case _RegisterAllDetails() when registerAllDetails != null:
return registerAllDetails();case _RemoveDetail() when removeDetail != null:
return removeDetail(_that.method);case _RemoveDetailFinal() when removeDetailFinal != null:
return removeDetailFinal(_that.method);case _SystemGoBack() when systemGoBack != null:
return systemGoBack();case _UiGoBack() when uiGoBack != null:
return uiGoBack();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( AuthMode mode)  changeMode,required TResult Function( AuthMethod method)  changeMethod,required TResult Function()  submitIdentifier,required TResult Function()  submitPassword,required TResult Function( AuthMethod method)  registerDetail,required TResult Function()  toggleIdentifier,required TResult Function()  changeName,required TResult Function( bool? dontAskAgain)  skipDetails,required TResult Function( AuthField field,  FieldState value)  updateField,required TResult Function( AuthMethod method)  checkDetail,required TResult Function()  trySubmit,required TResult Function()  registerAllDetails,required TResult Function( AuthMethod method)  removeDetail,required TResult Function( AuthMethod method)  removeDetailFinal,required TResult Function()  systemGoBack,required TResult Function()  uiGoBack,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _ChangeMode():
return changeMode(_that.mode);case _ChangeMethod():
return changeMethod(_that.method);case _SubmitIdentifier():
return submitIdentifier();case _SubmitPassword():
return submitPassword();case _RegisterDetail():
return registerDetail(_that.method);case _ToggleIdentifier():
return toggleIdentifier();case _ChangeName():
return changeName();case _SkipDetails():
return skipDetails(_that.dontAskAgain);case _UpdateField():
return updateField(_that.field,_that.value);case _CheckDetail():
return checkDetail(_that.method);case _TrySubmit():
return trySubmit();case _RegisterAllDetails():
return registerAllDetails();case _RemoveDetail():
return removeDetail(_that.method);case _RemoveDetailFinal():
return removeDetailFinal(_that.method);case _SystemGoBack():
return systemGoBack();case _UiGoBack():
return uiGoBack();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( AuthMode mode)?  changeMode,TResult? Function( AuthMethod method)?  changeMethod,TResult? Function()?  submitIdentifier,TResult? Function()?  submitPassword,TResult? Function( AuthMethod method)?  registerDetail,TResult? Function()?  toggleIdentifier,TResult? Function()?  changeName,TResult? Function( bool? dontAskAgain)?  skipDetails,TResult? Function( AuthField field,  FieldState value)?  updateField,TResult? Function( AuthMethod method)?  checkDetail,TResult? Function()?  trySubmit,TResult? Function()?  registerAllDetails,TResult? Function( AuthMethod method)?  removeDetail,TResult? Function( AuthMethod method)?  removeDetailFinal,TResult? Function()?  systemGoBack,TResult? Function()?  uiGoBack,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ChangeMode() when changeMode != null:
return changeMode(_that.mode);case _ChangeMethod() when changeMethod != null:
return changeMethod(_that.method);case _SubmitIdentifier() when submitIdentifier != null:
return submitIdentifier();case _SubmitPassword() when submitPassword != null:
return submitPassword();case _RegisterDetail() when registerDetail != null:
return registerDetail(_that.method);case _ToggleIdentifier() when toggleIdentifier != null:
return toggleIdentifier();case _ChangeName() when changeName != null:
return changeName();case _SkipDetails() when skipDetails != null:
return skipDetails(_that.dontAskAgain);case _UpdateField() when updateField != null:
return updateField(_that.field,_that.value);case _CheckDetail() when checkDetail != null:
return checkDetail(_that.method);case _TrySubmit() when trySubmit != null:
return trySubmit();case _RegisterAllDetails() when registerAllDetails != null:
return registerAllDetails();case _RemoveDetail() when removeDetail != null:
return removeDetail(_that.method);case _RemoveDetailFinal() when removeDetailFinal != null:
return removeDetailFinal(_that.method);case _SystemGoBack() when systemGoBack != null:
return systemGoBack();case _UiGoBack() when uiGoBack != null:
return uiGoBack();case _:
  return null;

}
}

}

/// @nodoc


class _Init implements AuthEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.init()';
}


}




/// @nodoc


class _ChangeMode implements AuthEvent {
  const _ChangeMode(this.mode);
  

 final  AuthMode mode;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeModeCopyWith<_ChangeMode> get copyWith => __$ChangeModeCopyWithImpl<_ChangeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeMode&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'AuthEvent.changeMode(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$ChangeModeCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ChangeModeCopyWith(_ChangeMode value, $Res Function(_ChangeMode) _then) = __$ChangeModeCopyWithImpl;
@useResult
$Res call({
 AuthMode mode
});




}
/// @nodoc
class __$ChangeModeCopyWithImpl<$Res>
    implements _$ChangeModeCopyWith<$Res> {
  __$ChangeModeCopyWithImpl(this._self, this._then);

  final _ChangeMode _self;
  final $Res Function(_ChangeMode) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_ChangeMode(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,
  ));
}


}

/// @nodoc


class _ChangeMethod implements AuthEvent {
  const _ChangeMethod(this.method);
  

 final  AuthMethod method;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeMethodCopyWith<_ChangeMethod> get copyWith => __$ChangeMethodCopyWithImpl<_ChangeMethod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeMethod&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'AuthEvent.changeMethod(method: $method)';
}


}

/// @nodoc
abstract mixin class _$ChangeMethodCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ChangeMethodCopyWith(_ChangeMethod value, $Res Function(_ChangeMethod) _then) = __$ChangeMethodCopyWithImpl;
@useResult
$Res call({
 AuthMethod method
});




}
/// @nodoc
class __$ChangeMethodCopyWithImpl<$Res>
    implements _$ChangeMethodCopyWith<$Res> {
  __$ChangeMethodCopyWithImpl(this._self, this._then);

  final _ChangeMethod _self;
  final $Res Function(_ChangeMethod) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(_ChangeMethod(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as AuthMethod,
  ));
}


}

/// @nodoc


class _SubmitIdentifier implements AuthEvent {
  const _SubmitIdentifier();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitIdentifier);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.submitIdentifier()';
}


}




/// @nodoc


class _SubmitPassword implements AuthEvent {
  const _SubmitPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.submitPassword()';
}


}




/// @nodoc


class _RegisterDetail implements AuthEvent {
  const _RegisterDetail({required this.method});
  

 final  AuthMethod method;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDetailCopyWith<_RegisterDetail> get copyWith => __$RegisterDetailCopyWithImpl<_RegisterDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterDetail&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'AuthEvent.registerDetail(method: $method)';
}


}

/// @nodoc
abstract mixin class _$RegisterDetailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterDetailCopyWith(_RegisterDetail value, $Res Function(_RegisterDetail) _then) = __$RegisterDetailCopyWithImpl;
@useResult
$Res call({
 AuthMethod method
});




}
/// @nodoc
class __$RegisterDetailCopyWithImpl<$Res>
    implements _$RegisterDetailCopyWith<$Res> {
  __$RegisterDetailCopyWithImpl(this._self, this._then);

  final _RegisterDetail _self;
  final $Res Function(_RegisterDetail) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(_RegisterDetail(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as AuthMethod,
  ));
}


}

/// @nodoc


class _ToggleIdentifier implements AuthEvent {
  const _ToggleIdentifier();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleIdentifier);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.toggleIdentifier()';
}


}




/// @nodoc


class _ChangeName implements AuthEvent {
  const _ChangeName();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeName);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.changeName()';
}


}




/// @nodoc


class _SkipDetails implements AuthEvent {
  const _SkipDetails({this.dontAskAgain});
  

 final  bool? dontAskAgain;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkipDetailsCopyWith<_SkipDetails> get copyWith => __$SkipDetailsCopyWithImpl<_SkipDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkipDetails&&(identical(other.dontAskAgain, dontAskAgain) || other.dontAskAgain == dontAskAgain));
}


@override
int get hashCode => Object.hash(runtimeType,dontAskAgain);

@override
String toString() {
  return 'AuthEvent.skipDetails(dontAskAgain: $dontAskAgain)';
}


}

/// @nodoc
abstract mixin class _$SkipDetailsCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SkipDetailsCopyWith(_SkipDetails value, $Res Function(_SkipDetails) _then) = __$SkipDetailsCopyWithImpl;
@useResult
$Res call({
 bool? dontAskAgain
});




}
/// @nodoc
class __$SkipDetailsCopyWithImpl<$Res>
    implements _$SkipDetailsCopyWith<$Res> {
  __$SkipDetailsCopyWithImpl(this._self, this._then);

  final _SkipDetails _self;
  final $Res Function(_SkipDetails) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dontAskAgain = freezed,}) {
  return _then(_SkipDetails(
dontAskAgain: freezed == dontAskAgain ? _self.dontAskAgain : dontAskAgain // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _UpdateField implements AuthEvent {
  const _UpdateField({required this.field, required this.value});
  

 final  AuthField field;
 final  FieldState value;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFieldCopyWith<_UpdateField> get copyWith => __$UpdateFieldCopyWithImpl<_UpdateField>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateField&&(identical(other.field, field) || other.field == field)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,field,value);

@override
String toString() {
  return 'AuthEvent.updateField(field: $field, value: $value)';
}


}

/// @nodoc
abstract mixin class _$UpdateFieldCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$UpdateFieldCopyWith(_UpdateField value, $Res Function(_UpdateField) _then) = __$UpdateFieldCopyWithImpl;
@useResult
$Res call({
 AuthField field, FieldState value
});


$FieldStateCopyWith<$Res> get value;

}
/// @nodoc
class __$UpdateFieldCopyWithImpl<$Res>
    implements _$UpdateFieldCopyWith<$Res> {
  __$UpdateFieldCopyWithImpl(this._self, this._then);

  final _UpdateField _self;
  final $Res Function(_UpdateField) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? field = null,Object? value = null,}) {
  return _then(_UpdateField(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as AuthField,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as FieldState,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FieldStateCopyWith<$Res> get value {
  
  return $FieldStateCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}

/// @nodoc


class _CheckDetail implements AuthEvent {
  const _CheckDetail(this.method);
  

 final  AuthMethod method;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckDetailCopyWith<_CheckDetail> get copyWith => __$CheckDetailCopyWithImpl<_CheckDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckDetail&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'AuthEvent.checkDetail(method: $method)';
}


}

/// @nodoc
abstract mixin class _$CheckDetailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$CheckDetailCopyWith(_CheckDetail value, $Res Function(_CheckDetail) _then) = __$CheckDetailCopyWithImpl;
@useResult
$Res call({
 AuthMethod method
});




}
/// @nodoc
class __$CheckDetailCopyWithImpl<$Res>
    implements _$CheckDetailCopyWith<$Res> {
  __$CheckDetailCopyWithImpl(this._self, this._then);

  final _CheckDetail _self;
  final $Res Function(_CheckDetail) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(_CheckDetail(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as AuthMethod,
  ));
}


}

/// @nodoc


class _TrySubmit implements AuthEvent {
  const _TrySubmit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrySubmit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.trySubmit()';
}


}




/// @nodoc


class _RegisterAllDetails implements AuthEvent {
  const _RegisterAllDetails();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterAllDetails);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.registerAllDetails()';
}


}




/// @nodoc


class _RemoveDetail implements AuthEvent {
  const _RemoveDetail(this.method);
  

 final  AuthMethod method;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveDetailCopyWith<_RemoveDetail> get copyWith => __$RemoveDetailCopyWithImpl<_RemoveDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveDetail&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'AuthEvent.removeDetail(method: $method)';
}


}

/// @nodoc
abstract mixin class _$RemoveDetailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RemoveDetailCopyWith(_RemoveDetail value, $Res Function(_RemoveDetail) _then) = __$RemoveDetailCopyWithImpl;
@useResult
$Res call({
 AuthMethod method
});




}
/// @nodoc
class __$RemoveDetailCopyWithImpl<$Res>
    implements _$RemoveDetailCopyWith<$Res> {
  __$RemoveDetailCopyWithImpl(this._self, this._then);

  final _RemoveDetail _self;
  final $Res Function(_RemoveDetail) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(_RemoveDetail(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as AuthMethod,
  ));
}


}

/// @nodoc


class _RemoveDetailFinal implements AuthEvent {
  const _RemoveDetailFinal(this.method);
  

 final  AuthMethod method;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveDetailFinalCopyWith<_RemoveDetailFinal> get copyWith => __$RemoveDetailFinalCopyWithImpl<_RemoveDetailFinal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveDetailFinal&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'AuthEvent.removeDetailFinal(method: $method)';
}


}

/// @nodoc
abstract mixin class _$RemoveDetailFinalCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RemoveDetailFinalCopyWith(_RemoveDetailFinal value, $Res Function(_RemoveDetailFinal) _then) = __$RemoveDetailFinalCopyWithImpl;
@useResult
$Res call({
 AuthMethod method
});




}
/// @nodoc
class __$RemoveDetailFinalCopyWithImpl<$Res>
    implements _$RemoveDetailFinalCopyWith<$Res> {
  __$RemoveDetailFinalCopyWithImpl(this._self, this._then);

  final _RemoveDetailFinal _self;
  final $Res Function(_RemoveDetailFinal) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(_RemoveDetailFinal(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as AuthMethod,
  ));
}


}

/// @nodoc


class _SystemGoBack implements AuthEvent {
  const _SystemGoBack();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemGoBack);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.systemGoBack()';
}


}




/// @nodoc


class _UiGoBack implements AuthEvent {
  const _UiGoBack();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UiGoBack);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.uiGoBack()';
}


}




/// @nodoc
mixin _$AuthState {

 AuthStep get step; AuthMode get mode; AuthMethod get method; bool get isLoading; String? get userId;/// Временные поля для ввода.
/// На этапах [enterIdentifier] и [enterPassword] содержит поля для идентификатора (по методу).
/// На этапе [registerDetails] содержит поля для недостающих атрибутов (ключи по методу).
 Map<AuthMethod, FieldState> get fields;/// Временное поле для пароля (используется только на [enterPassword]).
 FieldState get passwordField; FieldState get nameField;/// Подтверждённые данные пользователя после успешного логина.
 User? get user;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.step, step) || other.step == step)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.method, method) || other.method == method)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.nameField, nameField) || other.nameField == nameField)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,step,mode,method,isLoading,userId,const DeepCollectionEquality().hash(fields),passwordField,nameField,user);

@override
String toString() {
  return 'AuthState(step: $step, mode: $mode, method: $method, isLoading: $isLoading, userId: $userId, fields: $fields, passwordField: $passwordField, nameField: $nameField, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AuthStep step, AuthMode mode, AuthMethod method, bool isLoading, String? userId, Map<AuthMethod, FieldState> fields, FieldState passwordField, FieldState nameField, User? user
});


$FieldStateCopyWith<$Res> get passwordField;$FieldStateCopyWith<$Res> get nameField;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? mode = null,Object? method = null,Object? isLoading = null,Object? userId = freezed,Object? fields = null,Object? passwordField = null,Object? nameField = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as AuthStep,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as AuthMethod,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as Map<AuthMethod, FieldState>,passwordField: null == passwordField ? _self.passwordField : passwordField // ignore: cast_nullable_to_non_nullable
as FieldState,nameField: null == nameField ? _self.nameField : nameField // ignore: cast_nullable_to_non_nullable
as FieldState,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FieldStateCopyWith<$Res> get passwordField {
  
  return $FieldStateCopyWith<$Res>(_self.passwordField, (value) {
    return _then(_self.copyWith(passwordField: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FieldStateCopyWith<$Res> get nameField {
  
  return $FieldStateCopyWith<$Res>(_self.nameField, (value) {
    return _then(_self.copyWith(nameField: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthStep step,  AuthMode mode,  AuthMethod method,  bool isLoading,  String? userId,  Map<AuthMethod, FieldState> fields,  FieldState passwordField,  FieldState nameField,  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.step,_that.mode,_that.method,_that.isLoading,_that.userId,_that.fields,_that.passwordField,_that.nameField,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthStep step,  AuthMode mode,  AuthMethod method,  bool isLoading,  String? userId,  Map<AuthMethod, FieldState> fields,  FieldState passwordField,  FieldState nameField,  User? user)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.step,_that.mode,_that.method,_that.isLoading,_that.userId,_that.fields,_that.passwordField,_that.nameField,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthStep step,  AuthMode mode,  AuthMethod method,  bool isLoading,  String? userId,  Map<AuthMethod, FieldState> fields,  FieldState passwordField,  FieldState nameField,  User? user)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.step,_that.mode,_that.method,_that.isLoading,_that.userId,_that.fields,_that.passwordField,_that.nameField,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({required this.step, required this.mode, required this.method, required this.isLoading, required this.userId, required final  Map<AuthMethod, FieldState> fields, required this.passwordField, required this.nameField, required this.user}): _fields = fields;
  

@override final  AuthStep step;
@override final  AuthMode mode;
@override final  AuthMethod method;
@override final  bool isLoading;
@override final  String? userId;
/// Временные поля для ввода.
/// На этапах [enterIdentifier] и [enterPassword] содержит поля для идентификатора (по методу).
/// На этапе [registerDetails] содержит поля для недостающих атрибутов (ключи по методу).
 final  Map<AuthMethod, FieldState> _fields;
/// Временные поля для ввода.
/// На этапах [enterIdentifier] и [enterPassword] содержит поля для идентификатора (по методу).
/// На этапе [registerDetails] содержит поля для недостающих атрибутов (ключи по методу).
@override Map<AuthMethod, FieldState> get fields {
  if (_fields is EqualUnmodifiableMapView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fields);
}

/// Временное поле для пароля (используется только на [enterPassword]).
@override final  FieldState passwordField;
@override final  FieldState nameField;
/// Подтверждённые данные пользователя после успешного логина.
@override final  User? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.step, step) || other.step == step)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.method, method) || other.method == method)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.nameField, nameField) || other.nameField == nameField)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,step,mode,method,isLoading,userId,const DeepCollectionEquality().hash(_fields),passwordField,nameField,user);

@override
String toString() {
  return 'AuthState(step: $step, mode: $mode, method: $method, isLoading: $isLoading, userId: $userId, fields: $fields, passwordField: $passwordField, nameField: $nameField, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 AuthStep step, AuthMode mode, AuthMethod method, bool isLoading, String? userId, Map<AuthMethod, FieldState> fields, FieldState passwordField, FieldState nameField, User? user
});


@override $FieldStateCopyWith<$Res> get passwordField;@override $FieldStateCopyWith<$Res> get nameField;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? mode = null,Object? method = null,Object? isLoading = null,Object? userId = freezed,Object? fields = null,Object? passwordField = null,Object? nameField = null,Object? user = freezed,}) {
  return _then(_AuthState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as AuthStep,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as AuthMethod,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as Map<AuthMethod, FieldState>,passwordField: null == passwordField ? _self.passwordField : passwordField // ignore: cast_nullable_to_non_nullable
as FieldState,nameField: null == nameField ? _self.nameField : nameField // ignore: cast_nullable_to_non_nullable
as FieldState,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FieldStateCopyWith<$Res> get passwordField {
  
  return $FieldStateCopyWith<$Res>(_self.passwordField, (value) {
    return _then(_self.copyWith(passwordField: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FieldStateCopyWith<$Res> get nameField {
  
  return $FieldStateCopyWith<$Res>(_self.nameField, (value) {
    return _then(_self.copyWith(nameField: value));
  });
}/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
