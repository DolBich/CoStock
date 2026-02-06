// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prefs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrefsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrefsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrefsEvent()';
}


}

/// @nodoc
class $PrefsEventCopyWith<$Res>  {
$PrefsEventCopyWith(PrefsEvent _, $Res Function(PrefsEvent) __);
}


/// Adds pattern-matching-related methods to [PrefsEvent].
extension PrefsEventPatterns on PrefsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SetThemeMode value)?  setThemeMode,TResult Function( _SetSeedColor value)?  setSeedColor,TResult Function( _ChangeThemeSystem value)?  changeThemeSystem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that);case _ChangeThemeSystem() when changeThemeSystem != null:
return changeThemeSystem(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SetThemeMode value)  setThemeMode,required TResult Function( _SetSeedColor value)  setSeedColor,required TResult Function( _ChangeThemeSystem value)  changeThemeSystem,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SetThemeMode():
return setThemeMode(_that);case _SetSeedColor():
return setSeedColor(_that);case _ChangeThemeSystem():
return changeThemeSystem(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SetThemeMode value)?  setThemeMode,TResult? Function( _SetSeedColor value)?  setSeedColor,TResult? Function( _ChangeThemeSystem value)?  changeThemeSystem,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that);case _ChangeThemeSystem() when changeThemeSystem != null:
return changeThemeSystem(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( ThemeMode mode)?  setThemeMode,TResult Function( Color seed)?  setSeedColor,TResult Function( ThemeSystemVariant themeSystem)?  changeThemeSystem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that.mode);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that.seed);case _ChangeThemeSystem() when changeThemeSystem != null:
return changeThemeSystem(_that.themeSystem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( ThemeMode mode)  setThemeMode,required TResult Function( Color seed)  setSeedColor,required TResult Function( ThemeSystemVariant themeSystem)  changeThemeSystem,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _SetThemeMode():
return setThemeMode(_that.mode);case _SetSeedColor():
return setSeedColor(_that.seed);case _ChangeThemeSystem():
return changeThemeSystem(_that.themeSystem);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( ThemeMode mode)?  setThemeMode,TResult? Function( Color seed)?  setSeedColor,TResult? Function( ThemeSystemVariant themeSystem)?  changeThemeSystem,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that.mode);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that.seed);case _ChangeThemeSystem() when changeThemeSystem != null:
return changeThemeSystem(_that.themeSystem);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements PrefsEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrefsEvent.init()';
}


}




/// @nodoc


class _SetThemeMode implements PrefsEvent {
  const _SetThemeMode(this.mode);
  

 final  ThemeMode mode;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetThemeModeCopyWith<_SetThemeMode> get copyWith => __$SetThemeModeCopyWithImpl<_SetThemeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetThemeMode&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,mode);

@override
String toString() {
  return 'PrefsEvent.setThemeMode(mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$SetThemeModeCopyWith<$Res> implements $PrefsEventCopyWith<$Res> {
  factory _$SetThemeModeCopyWith(_SetThemeMode value, $Res Function(_SetThemeMode) _then) = __$SetThemeModeCopyWithImpl;
@useResult
$Res call({
 ThemeMode mode
});




}
/// @nodoc
class __$SetThemeModeCopyWithImpl<$Res>
    implements _$SetThemeModeCopyWith<$Res> {
  __$SetThemeModeCopyWithImpl(this._self, this._then);

  final _SetThemeMode _self;
  final $Res Function(_SetThemeMode) _then;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mode = null,}) {
  return _then(_SetThemeMode(
null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

/// @nodoc


class _SetSeedColor implements PrefsEvent {
  const _SetSeedColor(this.seed);
  

 final  Color seed;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetSeedColorCopyWith<_SetSeedColor> get copyWith => __$SetSeedColorCopyWithImpl<_SetSeedColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetSeedColor&&(identical(other.seed, seed) || other.seed == seed));
}


@override
int get hashCode => Object.hash(runtimeType,seed);

@override
String toString() {
  return 'PrefsEvent.setSeedColor(seed: $seed)';
}


}

/// @nodoc
abstract mixin class _$SetSeedColorCopyWith<$Res> implements $PrefsEventCopyWith<$Res> {
  factory _$SetSeedColorCopyWith(_SetSeedColor value, $Res Function(_SetSeedColor) _then) = __$SetSeedColorCopyWithImpl;
@useResult
$Res call({
 Color seed
});




}
/// @nodoc
class __$SetSeedColorCopyWithImpl<$Res>
    implements _$SetSeedColorCopyWith<$Res> {
  __$SetSeedColorCopyWithImpl(this._self, this._then);

  final _SetSeedColor _self;
  final $Res Function(_SetSeedColor) _then;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seed = null,}) {
  return _then(_SetSeedColor(
null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class _ChangeThemeSystem implements PrefsEvent {
  const _ChangeThemeSystem(this.themeSystem);
  

 final  ThemeSystemVariant themeSystem;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeThemeSystemCopyWith<_ChangeThemeSystem> get copyWith => __$ChangeThemeSystemCopyWithImpl<_ChangeThemeSystem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeThemeSystem&&(identical(other.themeSystem, themeSystem) || other.themeSystem == themeSystem));
}


@override
int get hashCode => Object.hash(runtimeType,themeSystem);

@override
String toString() {
  return 'PrefsEvent.changeThemeSystem(themeSystem: $themeSystem)';
}


}

/// @nodoc
abstract mixin class _$ChangeThemeSystemCopyWith<$Res> implements $PrefsEventCopyWith<$Res> {
  factory _$ChangeThemeSystemCopyWith(_ChangeThemeSystem value, $Res Function(_ChangeThemeSystem) _then) = __$ChangeThemeSystemCopyWithImpl;
@useResult
$Res call({
 ThemeSystemVariant themeSystem
});




}
/// @nodoc
class __$ChangeThemeSystemCopyWithImpl<$Res>
    implements _$ChangeThemeSystemCopyWith<$Res> {
  __$ChangeThemeSystemCopyWithImpl(this._self, this._then);

  final _ChangeThemeSystem _self;
  final $Res Function(_ChangeThemeSystem) _then;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeSystem = null,}) {
  return _then(_ChangeThemeSystem(
null == themeSystem ? _self.themeSystem : themeSystem // ignore: cast_nullable_to_non_nullable
as ThemeSystemVariant,
  ));
}


}

/// @nodoc
mixin _$PrefsState {

 ThemeMode get themeMode; Color get seedColor; ThemeData get themeData;
/// Create a copy of PrefsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrefsStateCopyWith<PrefsState> get copyWith => _$PrefsStateCopyWithImpl<PrefsState>(this as PrefsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrefsState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.seedColor, seedColor) || other.seedColor == seedColor)&&(identical(other.themeData, themeData) || other.themeData == themeData));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,seedColor,themeData);

@override
String toString() {
  return 'PrefsState(themeMode: $themeMode, seedColor: $seedColor, themeData: $themeData)';
}


}

/// @nodoc
abstract mixin class $PrefsStateCopyWith<$Res>  {
  factory $PrefsStateCopyWith(PrefsState value, $Res Function(PrefsState) _then) = _$PrefsStateCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, Color seedColor, ThemeData themeData
});




}
/// @nodoc
class _$PrefsStateCopyWithImpl<$Res>
    implements $PrefsStateCopyWith<$Res> {
  _$PrefsStateCopyWithImpl(this._self, this._then);

  final PrefsState _self;
  final $Res Function(PrefsState) _then;

/// Create a copy of PrefsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? seedColor = null,Object? themeData = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,seedColor: null == seedColor ? _self.seedColor : seedColor // ignore: cast_nullable_to_non_nullable
as Color,themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,
  ));
}

}


/// Adds pattern-matching-related methods to [PrefsState].
extension PrefsStatePatterns on PrefsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrefsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrefsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrefsState value)  $default,){
final _that = this;
switch (_that) {
case _PrefsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrefsState value)?  $default,){
final _that = this;
switch (_that) {
case _PrefsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  Color seedColor,  ThemeData themeData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrefsState() when $default != null:
return $default(_that.themeMode,_that.seedColor,_that.themeData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  Color seedColor,  ThemeData themeData)  $default,) {final _that = this;
switch (_that) {
case _PrefsState():
return $default(_that.themeMode,_that.seedColor,_that.themeData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  Color seedColor,  ThemeData themeData)?  $default,) {final _that = this;
switch (_that) {
case _PrefsState() when $default != null:
return $default(_that.themeMode,_that.seedColor,_that.themeData);case _:
  return null;

}
}

}

/// @nodoc


class _PrefsState implements PrefsState {
  const _PrefsState({required this.themeMode, required this.seedColor, required this.themeData});
  

@override final  ThemeMode themeMode;
@override final  Color seedColor;
@override final  ThemeData themeData;

/// Create a copy of PrefsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrefsStateCopyWith<_PrefsState> get copyWith => __$PrefsStateCopyWithImpl<_PrefsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrefsState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.seedColor, seedColor) || other.seedColor == seedColor)&&(identical(other.themeData, themeData) || other.themeData == themeData));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,seedColor,themeData);

@override
String toString() {
  return 'PrefsState(themeMode: $themeMode, seedColor: $seedColor, themeData: $themeData)';
}


}

/// @nodoc
abstract mixin class _$PrefsStateCopyWith<$Res> implements $PrefsStateCopyWith<$Res> {
  factory _$PrefsStateCopyWith(_PrefsState value, $Res Function(_PrefsState) _then) = __$PrefsStateCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, Color seedColor, ThemeData themeData
});




}
/// @nodoc
class __$PrefsStateCopyWithImpl<$Res>
    implements _$PrefsStateCopyWith<$Res> {
  __$PrefsStateCopyWithImpl(this._self, this._then);

  final _PrefsState _self;
  final $Res Function(_PrefsState) _then;

/// Create a copy of PrefsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? seedColor = null,Object? themeData = null,}) {
  return _then(_PrefsState(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,seedColor: null == seedColor ? _self.seedColor : seedColor // ignore: cast_nullable_to_non_nullable
as Color,themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,
  ));
}


}

// dart format on
