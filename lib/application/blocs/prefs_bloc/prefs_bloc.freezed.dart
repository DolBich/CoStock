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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _SetThemeMode value)?  setThemeMode,TResult Function( _SetSeedColor value)?  setSeedColor,TResult Function( _ChangeUseSeed value)?  changeUseSeed,TResult Function( _ChangeAppLocale value)?  changeAppLocale,TResult Function( _ChangePhoneLocale value)?  changePhoneLocale,TResult Function( _ChangeRepo value)?  changeRepo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that);case _ChangeUseSeed() when changeUseSeed != null:
return changeUseSeed(_that);case _ChangeAppLocale() when changeAppLocale != null:
return changeAppLocale(_that);case _ChangePhoneLocale() when changePhoneLocale != null:
return changePhoneLocale(_that);case _ChangeRepo() when changeRepo != null:
return changeRepo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _SetThemeMode value)  setThemeMode,required TResult Function( _SetSeedColor value)  setSeedColor,required TResult Function( _ChangeUseSeed value)  changeUseSeed,required TResult Function( _ChangeAppLocale value)  changeAppLocale,required TResult Function( _ChangePhoneLocale value)  changePhoneLocale,required TResult Function( _ChangeRepo value)  changeRepo,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _SetThemeMode():
return setThemeMode(_that);case _SetSeedColor():
return setSeedColor(_that);case _ChangeUseSeed():
return changeUseSeed(_that);case _ChangeAppLocale():
return changeAppLocale(_that);case _ChangePhoneLocale():
return changePhoneLocale(_that);case _ChangeRepo():
return changeRepo(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _SetThemeMode value)?  setThemeMode,TResult? Function( _SetSeedColor value)?  setSeedColor,TResult? Function( _ChangeUseSeed value)?  changeUseSeed,TResult? Function( _ChangeAppLocale value)?  changeAppLocale,TResult? Function( _ChangePhoneLocale value)?  changePhoneLocale,TResult? Function( _ChangeRepo value)?  changeRepo,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that);case _ChangeUseSeed() when changeUseSeed != null:
return changeUseSeed(_that);case _ChangeAppLocale() when changeAppLocale != null:
return changeAppLocale(_that);case _ChangePhoneLocale() when changePhoneLocale != null:
return changePhoneLocale(_that);case _ChangeRepo() when changeRepo != null:
return changeRepo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( ThemeMode mode)?  setThemeMode,TResult Function( Color seed)?  setSeedColor,TResult Function( bool useSeed)?  changeUseSeed,TResult Function( AppLocale appLocale)?  changeAppLocale,TResult Function( AppLocale phoneLocale)?  changePhoneLocale,TResult Function()?  changeRepo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that.mode);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that.seed);case _ChangeUseSeed() when changeUseSeed != null:
return changeUseSeed(_that.useSeed);case _ChangeAppLocale() when changeAppLocale != null:
return changeAppLocale(_that.appLocale);case _ChangePhoneLocale() when changePhoneLocale != null:
return changePhoneLocale(_that.phoneLocale);case _ChangeRepo() when changeRepo != null:
return changeRepo();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( ThemeMode mode)  setThemeMode,required TResult Function( Color seed)  setSeedColor,required TResult Function( bool useSeed)  changeUseSeed,required TResult Function( AppLocale appLocale)  changeAppLocale,required TResult Function( AppLocale phoneLocale)  changePhoneLocale,required TResult Function()  changeRepo,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _SetThemeMode():
return setThemeMode(_that.mode);case _SetSeedColor():
return setSeedColor(_that.seed);case _ChangeUseSeed():
return changeUseSeed(_that.useSeed);case _ChangeAppLocale():
return changeAppLocale(_that.appLocale);case _ChangePhoneLocale():
return changePhoneLocale(_that.phoneLocale);case _ChangeRepo():
return changeRepo();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( ThemeMode mode)?  setThemeMode,TResult? Function( Color seed)?  setSeedColor,TResult? Function( bool useSeed)?  changeUseSeed,TResult? Function( AppLocale appLocale)?  changeAppLocale,TResult? Function( AppLocale phoneLocale)?  changePhoneLocale,TResult? Function()?  changeRepo,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that.mode);case _SetSeedColor() when setSeedColor != null:
return setSeedColor(_that.seed);case _ChangeUseSeed() when changeUseSeed != null:
return changeUseSeed(_that.useSeed);case _ChangeAppLocale() when changeAppLocale != null:
return changeAppLocale(_that.appLocale);case _ChangePhoneLocale() when changePhoneLocale != null:
return changePhoneLocale(_that.phoneLocale);case _ChangeRepo() when changeRepo != null:
return changeRepo();case _:
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


class _ChangeUseSeed implements PrefsEvent {
  const _ChangeUseSeed(this.useSeed);
  

 final  bool useSeed;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUseSeedCopyWith<_ChangeUseSeed> get copyWith => __$ChangeUseSeedCopyWithImpl<_ChangeUseSeed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUseSeed&&(identical(other.useSeed, useSeed) || other.useSeed == useSeed));
}


@override
int get hashCode => Object.hash(runtimeType,useSeed);

@override
String toString() {
  return 'PrefsEvent.changeUseSeed(useSeed: $useSeed)';
}


}

/// @nodoc
abstract mixin class _$ChangeUseSeedCopyWith<$Res> implements $PrefsEventCopyWith<$Res> {
  factory _$ChangeUseSeedCopyWith(_ChangeUseSeed value, $Res Function(_ChangeUseSeed) _then) = __$ChangeUseSeedCopyWithImpl;
@useResult
$Res call({
 bool useSeed
});




}
/// @nodoc
class __$ChangeUseSeedCopyWithImpl<$Res>
    implements _$ChangeUseSeedCopyWith<$Res> {
  __$ChangeUseSeedCopyWithImpl(this._self, this._then);

  final _ChangeUseSeed _self;
  final $Res Function(_ChangeUseSeed) _then;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? useSeed = null,}) {
  return _then(_ChangeUseSeed(
null == useSeed ? _self.useSeed : useSeed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ChangeAppLocale implements PrefsEvent {
  const _ChangeAppLocale(this.appLocale);
  

 final  AppLocale appLocale;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeAppLocaleCopyWith<_ChangeAppLocale> get copyWith => __$ChangeAppLocaleCopyWithImpl<_ChangeAppLocale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeAppLocale&&(identical(other.appLocale, appLocale) || other.appLocale == appLocale));
}


@override
int get hashCode => Object.hash(runtimeType,appLocale);

@override
String toString() {
  return 'PrefsEvent.changeAppLocale(appLocale: $appLocale)';
}


}

/// @nodoc
abstract mixin class _$ChangeAppLocaleCopyWith<$Res> implements $PrefsEventCopyWith<$Res> {
  factory _$ChangeAppLocaleCopyWith(_ChangeAppLocale value, $Res Function(_ChangeAppLocale) _then) = __$ChangeAppLocaleCopyWithImpl;
@useResult
$Res call({
 AppLocale appLocale
});




}
/// @nodoc
class __$ChangeAppLocaleCopyWithImpl<$Res>
    implements _$ChangeAppLocaleCopyWith<$Res> {
  __$ChangeAppLocaleCopyWithImpl(this._self, this._then);

  final _ChangeAppLocale _self;
  final $Res Function(_ChangeAppLocale) _then;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appLocale = null,}) {
  return _then(_ChangeAppLocale(
null == appLocale ? _self.appLocale : appLocale // ignore: cast_nullable_to_non_nullable
as AppLocale,
  ));
}


}

/// @nodoc


class _ChangePhoneLocale implements PrefsEvent {
  const _ChangePhoneLocale(this.phoneLocale);
  

 final  AppLocale phoneLocale;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePhoneLocaleCopyWith<_ChangePhoneLocale> get copyWith => __$ChangePhoneLocaleCopyWithImpl<_ChangePhoneLocale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePhoneLocale&&(identical(other.phoneLocale, phoneLocale) || other.phoneLocale == phoneLocale));
}


@override
int get hashCode => Object.hash(runtimeType,phoneLocale);

@override
String toString() {
  return 'PrefsEvent.changePhoneLocale(phoneLocale: $phoneLocale)';
}


}

/// @nodoc
abstract mixin class _$ChangePhoneLocaleCopyWith<$Res> implements $PrefsEventCopyWith<$Res> {
  factory _$ChangePhoneLocaleCopyWith(_ChangePhoneLocale value, $Res Function(_ChangePhoneLocale) _then) = __$ChangePhoneLocaleCopyWithImpl;
@useResult
$Res call({
 AppLocale phoneLocale
});




}
/// @nodoc
class __$ChangePhoneLocaleCopyWithImpl<$Res>
    implements _$ChangePhoneLocaleCopyWith<$Res> {
  __$ChangePhoneLocaleCopyWithImpl(this._self, this._then);

  final _ChangePhoneLocale _self;
  final $Res Function(_ChangePhoneLocale) _then;

/// Create a copy of PrefsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneLocale = null,}) {
  return _then(_ChangePhoneLocale(
null == phoneLocale ? _self.phoneLocale : phoneLocale // ignore: cast_nullable_to_non_nullable
as AppLocale,
  ));
}


}

/// @nodoc


class _ChangeRepo implements PrefsEvent {
  const _ChangeRepo();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeRepo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrefsEvent.changeRepo()';
}


}




/// @nodoc
mixin _$PrefsState {

/// Опеределяет страну, язык которой используется
/// Под неё подстраивается реклама и требования этой страны
/// мы должны соблюдать в приложении (на будущее)
 AppLocale get appLocale;/// Номер телефона какой страны использует
/// По умолчанию равен [appLocale]
 AppLocale get phoneLocale; ThemeData get themeData; bool get useMock;
/// Create a copy of PrefsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrefsStateCopyWith<PrefsState> get copyWith => _$PrefsStateCopyWithImpl<PrefsState>(this as PrefsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrefsState&&(identical(other.appLocale, appLocale) || other.appLocale == appLocale)&&(identical(other.phoneLocale, phoneLocale) || other.phoneLocale == phoneLocale)&&(identical(other.themeData, themeData) || other.themeData == themeData)&&(identical(other.useMock, useMock) || other.useMock == useMock));
}


@override
int get hashCode => Object.hash(runtimeType,appLocale,phoneLocale,themeData,useMock);

@override
String toString() {
  return 'PrefsState(appLocale: $appLocale, phoneLocale: $phoneLocale, themeData: $themeData, useMock: $useMock)';
}


}

/// @nodoc
abstract mixin class $PrefsStateCopyWith<$Res>  {
  factory $PrefsStateCopyWith(PrefsState value, $Res Function(PrefsState) _then) = _$PrefsStateCopyWithImpl;
@useResult
$Res call({
 AppLocale appLocale, AppLocale phoneLocale, ThemeData themeData, bool useMock
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
@pragma('vm:prefer-inline') @override $Res call({Object? appLocale = null,Object? phoneLocale = null,Object? themeData = null,Object? useMock = null,}) {
  return _then(_self.copyWith(
appLocale: null == appLocale ? _self.appLocale : appLocale // ignore: cast_nullable_to_non_nullable
as AppLocale,phoneLocale: null == phoneLocale ? _self.phoneLocale : phoneLocale // ignore: cast_nullable_to_non_nullable
as AppLocale,themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,useMock: null == useMock ? _self.useMock : useMock // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppLocale appLocale,  AppLocale phoneLocale,  ThemeData themeData,  bool useMock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrefsState() when $default != null:
return $default(_that.appLocale,_that.phoneLocale,_that.themeData,_that.useMock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppLocale appLocale,  AppLocale phoneLocale,  ThemeData themeData,  bool useMock)  $default,) {final _that = this;
switch (_that) {
case _PrefsState():
return $default(_that.appLocale,_that.phoneLocale,_that.themeData,_that.useMock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppLocale appLocale,  AppLocale phoneLocale,  ThemeData themeData,  bool useMock)?  $default,) {final _that = this;
switch (_that) {
case _PrefsState() when $default != null:
return $default(_that.appLocale,_that.phoneLocale,_that.themeData,_that.useMock);case _:
  return null;

}
}

}

/// @nodoc


class _PrefsState implements PrefsState {
  const _PrefsState({required this.appLocale, required this.phoneLocale, required this.themeData, required this.useMock});
  

/// Опеределяет страну, язык которой используется
/// Под неё подстраивается реклама и требования этой страны
/// мы должны соблюдать в приложении (на будущее)
@override final  AppLocale appLocale;
/// Номер телефона какой страны использует
/// По умолчанию равен [appLocale]
@override final  AppLocale phoneLocale;
@override final  ThemeData themeData;
@override final  bool useMock;

/// Create a copy of PrefsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrefsStateCopyWith<_PrefsState> get copyWith => __$PrefsStateCopyWithImpl<_PrefsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrefsState&&(identical(other.appLocale, appLocale) || other.appLocale == appLocale)&&(identical(other.phoneLocale, phoneLocale) || other.phoneLocale == phoneLocale)&&(identical(other.themeData, themeData) || other.themeData == themeData)&&(identical(other.useMock, useMock) || other.useMock == useMock));
}


@override
int get hashCode => Object.hash(runtimeType,appLocale,phoneLocale,themeData,useMock);

@override
String toString() {
  return 'PrefsState(appLocale: $appLocale, phoneLocale: $phoneLocale, themeData: $themeData, useMock: $useMock)';
}


}

/// @nodoc
abstract mixin class _$PrefsStateCopyWith<$Res> implements $PrefsStateCopyWith<$Res> {
  factory _$PrefsStateCopyWith(_PrefsState value, $Res Function(_PrefsState) _then) = __$PrefsStateCopyWithImpl;
@override @useResult
$Res call({
 AppLocale appLocale, AppLocale phoneLocale, ThemeData themeData, bool useMock
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
@override @pragma('vm:prefer-inline') $Res call({Object? appLocale = null,Object? phoneLocale = null,Object? themeData = null,Object? useMock = null,}) {
  return _then(_PrefsState(
appLocale: null == appLocale ? _self.appLocale : appLocale // ignore: cast_nullable_to_non_nullable
as AppLocale,phoneLocale: null == phoneLocale ? _self.phoneLocale : phoneLocale // ignore: cast_nullable_to_non_nullable
as AppLocale,themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,useMock: null == useMock ? _self.useMock : useMock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
