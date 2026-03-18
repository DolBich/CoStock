// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValidationResult {

 List<RuleStatus> get requirements; List<RuleStatus> get suggestions; String get requirementText; String get suggestionsText;
/// Create a copy of ValidationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationResultCopyWith<ValidationResult> get copyWith => _$ValidationResultCopyWithImpl<ValidationResult>(this as ValidationResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationResult&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&(identical(other.requirementText, requirementText) || other.requirementText == requirementText)&&(identical(other.suggestionsText, suggestionsText) || other.suggestionsText == suggestionsText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(suggestions),requirementText,suggestionsText);

@override
String toString() {
  return 'ValidationResult(requirements: $requirements, suggestions: $suggestions, requirementText: $requirementText, suggestionsText: $suggestionsText)';
}


}

/// @nodoc
abstract mixin class $ValidationResultCopyWith<$Res>  {
  factory $ValidationResultCopyWith(ValidationResult value, $Res Function(ValidationResult) _then) = _$ValidationResultCopyWithImpl;
@useResult
$Res call({
 List<RuleStatus> requirements, List<RuleStatus> suggestions, String requirementText, String suggestionsText
});




}
/// @nodoc
class _$ValidationResultCopyWithImpl<$Res>
    implements $ValidationResultCopyWith<$Res> {
  _$ValidationResultCopyWithImpl(this._self, this._then);

  final ValidationResult _self;
  final $Res Function(ValidationResult) _then;

/// Create a copy of ValidationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requirements = null,Object? suggestions = null,Object? requirementText = null,Object? suggestionsText = null,}) {
  return _then(_self.copyWith(
requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<RuleStatus>,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<RuleStatus>,requirementText: null == requirementText ? _self.requirementText : requirementText // ignore: cast_nullable_to_non_nullable
as String,suggestionsText: null == suggestionsText ? _self.suggestionsText : suggestionsText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationResult].
extension ValidationResultPatterns on ValidationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationResult value)  $default,){
final _that = this;
switch (_that) {
case _ValidationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationResult value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RuleStatus> requirements,  List<RuleStatus> suggestions,  String requirementText,  String suggestionsText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationResult() when $default != null:
return $default(_that.requirements,_that.suggestions,_that.requirementText,_that.suggestionsText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RuleStatus> requirements,  List<RuleStatus> suggestions,  String requirementText,  String suggestionsText)  $default,) {final _that = this;
switch (_that) {
case _ValidationResult():
return $default(_that.requirements,_that.suggestions,_that.requirementText,_that.suggestionsText);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RuleStatus> requirements,  List<RuleStatus> suggestions,  String requirementText,  String suggestionsText)?  $default,) {final _that = this;
switch (_that) {
case _ValidationResult() when $default != null:
return $default(_that.requirements,_that.suggestions,_that.requirementText,_that.suggestionsText);case _:
  return null;

}
}

}

/// @nodoc


class _ValidationResult implements ValidationResult {
  const _ValidationResult({required final  List<RuleStatus> requirements, required final  List<RuleStatus> suggestions, required this.requirementText, required this.suggestionsText}): _requirements = requirements,_suggestions = suggestions;
  

 final  List<RuleStatus> _requirements;
@override List<RuleStatus> get requirements {
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirements);
}

 final  List<RuleStatus> _suggestions;
@override List<RuleStatus> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

@override final  String requirementText;
@override final  String suggestionsText;

/// Create a copy of ValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationResultCopyWith<_ValidationResult> get copyWith => __$ValidationResultCopyWithImpl<_ValidationResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationResult&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&(identical(other.requirementText, requirementText) || other.requirementText == requirementText)&&(identical(other.suggestionsText, suggestionsText) || other.suggestionsText == suggestionsText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_suggestions),requirementText,suggestionsText);

@override
String toString() {
  return 'ValidationResult(requirements: $requirements, suggestions: $suggestions, requirementText: $requirementText, suggestionsText: $suggestionsText)';
}


}

/// @nodoc
abstract mixin class _$ValidationResultCopyWith<$Res> implements $ValidationResultCopyWith<$Res> {
  factory _$ValidationResultCopyWith(_ValidationResult value, $Res Function(_ValidationResult) _then) = __$ValidationResultCopyWithImpl;
@override @useResult
$Res call({
 List<RuleStatus> requirements, List<RuleStatus> suggestions, String requirementText, String suggestionsText
});




}
/// @nodoc
class __$ValidationResultCopyWithImpl<$Res>
    implements _$ValidationResultCopyWith<$Res> {
  __$ValidationResultCopyWithImpl(this._self, this._then);

  final _ValidationResult _self;
  final $Res Function(_ValidationResult) _then;

/// Create a copy of ValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requirements = null,Object? suggestions = null,Object? requirementText = null,Object? suggestionsText = null,}) {
  return _then(_ValidationResult(
requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<RuleStatus>,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<RuleStatus>,requirementText: null == requirementText ? _self.requirementText : requirementText // ignore: cast_nullable_to_non_nullable
as String,suggestionsText: null == suggestionsText ? _self.suggestionsText : suggestionsText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RuleStatus {

 DisplayableValidationRule get rule; bool get isValid;
/// Create a copy of RuleStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleStatusCopyWith<RuleStatus> get copyWith => _$RuleStatusCopyWithImpl<RuleStatus>(this as RuleStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleStatus&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,rule,isValid);

@override
String toString() {
  return 'RuleStatus(rule: $rule, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class $RuleStatusCopyWith<$Res>  {
  factory $RuleStatusCopyWith(RuleStatus value, $Res Function(RuleStatus) _then) = _$RuleStatusCopyWithImpl;
@useResult
$Res call({
 DisplayableValidationRule rule, bool isValid
});




}
/// @nodoc
class _$RuleStatusCopyWithImpl<$Res>
    implements $RuleStatusCopyWith<$Res> {
  _$RuleStatusCopyWithImpl(this._self, this._then);

  final RuleStatus _self;
  final $Res Function(RuleStatus) _then;

/// Create a copy of RuleStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rule = null,Object? isValid = null,}) {
  return _then(_self.copyWith(
rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as DisplayableValidationRule,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RuleStatus].
extension RuleStatusPatterns on RuleStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleStatus value)  $default,){
final _that = this;
switch (_that) {
case _RuleStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleStatus value)?  $default,){
final _that = this;
switch (_that) {
case _RuleStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DisplayableValidationRule rule,  bool isValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleStatus() when $default != null:
return $default(_that.rule,_that.isValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DisplayableValidationRule rule,  bool isValid)  $default,) {final _that = this;
switch (_that) {
case _RuleStatus():
return $default(_that.rule,_that.isValid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DisplayableValidationRule rule,  bool isValid)?  $default,) {final _that = this;
switch (_that) {
case _RuleStatus() when $default != null:
return $default(_that.rule,_that.isValid);case _:
  return null;

}
}

}

/// @nodoc


class _RuleStatus implements RuleStatus {
  const _RuleStatus({required this.rule, required this.isValid});
  

@override final  DisplayableValidationRule rule;
@override final  bool isValid;

/// Create a copy of RuleStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleStatusCopyWith<_RuleStatus> get copyWith => __$RuleStatusCopyWithImpl<_RuleStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleStatus&&(identical(other.rule, rule) || other.rule == rule)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,rule,isValid);

@override
String toString() {
  return 'RuleStatus(rule: $rule, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$RuleStatusCopyWith<$Res> implements $RuleStatusCopyWith<$Res> {
  factory _$RuleStatusCopyWith(_RuleStatus value, $Res Function(_RuleStatus) _then) = __$RuleStatusCopyWithImpl;
@override @useResult
$Res call({
 DisplayableValidationRule rule, bool isValid
});




}
/// @nodoc
class __$RuleStatusCopyWithImpl<$Res>
    implements _$RuleStatusCopyWith<$Res> {
  __$RuleStatusCopyWithImpl(this._self, this._then);

  final _RuleStatus _self;
  final $Res Function(_RuleStatus) _then;

/// Create a copy of RuleStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rule = null,Object? isValid = null,}) {
  return _then(_RuleStatus(
rule: null == rule ? _self.rule : rule // ignore: cast_nullable_to_non_nullable
as DisplayableValidationRule,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
