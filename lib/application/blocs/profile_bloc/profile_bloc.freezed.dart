// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _ChangeLogin value)?  changeLogin,TResult Function( _ChangePhone value)?  changePhone,TResult Function( _ChangeEmail value)?  changeEmail,TResult Function( _ChangePassword value)?  changePassword,TResult Function( _ChangeName value)?  changeName,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeLogin() when changeLogin != null:
return changeLogin(_that);case _ChangePhone() when changePhone != null:
return changePhone(_that);case _ChangeEmail() when changeEmail != null:
return changeEmail(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _ChangeName() when changeName != null:
return changeName(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _ChangeLogin value)  changeLogin,required TResult Function( _ChangePhone value)  changePhone,required TResult Function( _ChangeEmail value)  changeEmail,required TResult Function( _ChangePassword value)  changePassword,required TResult Function( _ChangeName value)  changeName,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _ChangeLogin():
return changeLogin(_that);case _ChangePhone():
return changePhone(_that);case _ChangeEmail():
return changeEmail(_that);case _ChangePassword():
return changePassword(_that);case _ChangeName():
return changeName(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _ChangeLogin value)?  changeLogin,TResult? Function( _ChangePhone value)?  changePhone,TResult? Function( _ChangeEmail value)?  changeEmail,TResult? Function( _ChangePassword value)?  changePassword,TResult? Function( _ChangeName value)?  changeName,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _ChangeLogin() when changeLogin != null:
return changeLogin(_that);case _ChangePhone() when changePhone != null:
return changePhone(_that);case _ChangeEmail() when changeEmail != null:
return changeEmail(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _ChangeName() when changeName != null:
return changeName(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( String? login)?  changeLogin,TResult Function( String? phone)?  changePhone,TResult Function( String? email)?  changeEmail,TResult Function( String password)?  changePassword,TResult Function( String name)?  changeName,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ChangeLogin() when changeLogin != null:
return changeLogin(_that.login);case _ChangePhone() when changePhone != null:
return changePhone(_that.phone);case _ChangeEmail() when changeEmail != null:
return changeEmail(_that.email);case _ChangePassword() when changePassword != null:
return changePassword(_that.password);case _ChangeName() when changeName != null:
return changeName(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( String? login)  changeLogin,required TResult Function( String? phone)  changePhone,required TResult Function( String? email)  changeEmail,required TResult Function( String password)  changePassword,required TResult Function( String name)  changeName,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _ChangeLogin():
return changeLogin(_that.login);case _ChangePhone():
return changePhone(_that.phone);case _ChangeEmail():
return changeEmail(_that.email);case _ChangePassword():
return changePassword(_that.password);case _ChangeName():
return changeName(_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( String? login)?  changeLogin,TResult? Function( String? phone)?  changePhone,TResult? Function( String? email)?  changeEmail,TResult? Function( String password)?  changePassword,TResult? Function( String name)?  changeName,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _ChangeLogin() when changeLogin != null:
return changeLogin(_that.login);case _ChangePhone() when changePhone != null:
return changePhone(_that.phone);case _ChangeEmail() when changeEmail != null:
return changeEmail(_that.email);case _ChangePassword() when changePassword != null:
return changePassword(_that.password);case _ChangeName() when changeName != null:
return changeName(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements ProfileEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.init()';
}


}




/// @nodoc


class _ChangeLogin implements ProfileEvent {
  const _ChangeLogin(this.login);
  

 final  String? login;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeLoginCopyWith<_ChangeLogin> get copyWith => __$ChangeLoginCopyWithImpl<_ChangeLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeLogin&&(identical(other.login, login) || other.login == login));
}


@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'ProfileEvent.changeLogin(login: $login)';
}


}

/// @nodoc
abstract mixin class _$ChangeLoginCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ChangeLoginCopyWith(_ChangeLogin value, $Res Function(_ChangeLogin) _then) = __$ChangeLoginCopyWithImpl;
@useResult
$Res call({
 String? login
});




}
/// @nodoc
class __$ChangeLoginCopyWithImpl<$Res>
    implements _$ChangeLoginCopyWith<$Res> {
  __$ChangeLoginCopyWithImpl(this._self, this._then);

  final _ChangeLogin _self;
  final $Res Function(_ChangeLogin) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? login = freezed,}) {
  return _then(_ChangeLogin(
freezed == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ChangePhone implements ProfileEvent {
  const _ChangePhone(this.phone);
  

 final  String? phone;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePhoneCopyWith<_ChangePhone> get copyWith => __$ChangePhoneCopyWithImpl<_ChangePhone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePhone&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'ProfileEvent.changePhone(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ChangePhoneCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ChangePhoneCopyWith(_ChangePhone value, $Res Function(_ChangePhone) _then) = __$ChangePhoneCopyWithImpl;
@useResult
$Res call({
 String? phone
});




}
/// @nodoc
class __$ChangePhoneCopyWithImpl<$Res>
    implements _$ChangePhoneCopyWith<$Res> {
  __$ChangePhoneCopyWithImpl(this._self, this._then);

  final _ChangePhone _self;
  final $Res Function(_ChangePhone) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = freezed,}) {
  return _then(_ChangePhone(
freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ChangeEmail implements ProfileEvent {
  const _ChangeEmail(this.email);
  

 final  String? email;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeEmailCopyWith<_ChangeEmail> get copyWith => __$ChangeEmailCopyWithImpl<_ChangeEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeEmail&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ProfileEvent.changeEmail(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ChangeEmailCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ChangeEmailCopyWith(_ChangeEmail value, $Res Function(_ChangeEmail) _then) = __$ChangeEmailCopyWithImpl;
@useResult
$Res call({
 String? email
});




}
/// @nodoc
class __$ChangeEmailCopyWithImpl<$Res>
    implements _$ChangeEmailCopyWith<$Res> {
  __$ChangeEmailCopyWithImpl(this._self, this._then);

  final _ChangeEmail _self;
  final $Res Function(_ChangeEmail) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = freezed,}) {
  return _then(_ChangeEmail(
freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ChangePassword implements ProfileEvent {
  const _ChangePassword(this.password);
  

 final  String password;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordCopyWith<_ChangePassword> get copyWith => __$ChangePasswordCopyWithImpl<_ChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePassword&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'ProfileEvent.changePassword(password: $password)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ChangePasswordCopyWith(_ChangePassword value, $Res Function(_ChangePassword) _then) = __$ChangePasswordCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class __$ChangePasswordCopyWithImpl<$Res>
    implements _$ChangePasswordCopyWith<$Res> {
  __$ChangePasswordCopyWithImpl(this._self, this._then);

  final _ChangePassword _self;
  final $Res Function(_ChangePassword) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_ChangePassword(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangeName implements ProfileEvent {
  const _ChangeName(this.name);
  

 final  String name;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeNameCopyWith<_ChangeName> get copyWith => __$ChangeNameCopyWithImpl<_ChangeName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeName&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ProfileEvent.changeName(name: $name)';
}


}

/// @nodoc
abstract mixin class _$ChangeNameCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ChangeNameCopyWith(_ChangeName value, $Res Function(_ChangeName) _then) = __$ChangeNameCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$ChangeNameCopyWithImpl<$Res>
    implements _$ChangeNameCopyWith<$Res> {
  __$ChangeNameCopyWithImpl(this._self, this._then);

  final _ChangeName _self;
  final $Res Function(_ChangeName) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_ChangeName(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProfileState {

 bool get isLoading; User? get user;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,user);

@override
String toString() {
  return 'ProfileState(isLoading: $isLoading, user: $user)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, User? user
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of ProfileState
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


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.isLoading,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  User? user)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.isLoading,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  User? user)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.isLoading,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({required this.isLoading, required this.user});
  

@override final  bool isLoading;
@override final  User? user;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,user);

@override
String toString() {
  return 'ProfileState(isLoading: $isLoading, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, User? user
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? user = freezed,}) {
  return _then(_ProfileState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of ProfileState
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
