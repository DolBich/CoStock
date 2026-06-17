// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StockEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StockEvent()';
}


}

/// @nodoc
class $StockEventCopyWith<$Res>  {
$StockEventCopyWith(StockEvent _, $Res Function(StockEvent) __);
}


/// Adds pattern-matching-related methods to [StockEvent].
extension StockEventPatterns on StockEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadStock value)?  loadStock,TResult Function( _ReorderItems value)?  reorderItems,TResult Function( _SwipeAction value)?  swipeAction,TResult Function( _OpenAddEditScreen value)?  openAddEditScreen,TResult Function( _AddItem value)?  addItem,TResult Function( _UpdateItem value)?  updateItem,TResult Function( _DeleteItem value)?  deleteItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadStock() when loadStock != null:
return loadStock(_that);case _ReorderItems() when reorderItems != null:
return reorderItems(_that);case _SwipeAction() when swipeAction != null:
return swipeAction(_that);case _OpenAddEditScreen() when openAddEditScreen != null:
return openAddEditScreen(_that);case _AddItem() when addItem != null:
return addItem(_that);case _UpdateItem() when updateItem != null:
return updateItem(_that);case _DeleteItem() when deleteItem != null:
return deleteItem(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadStock value)  loadStock,required TResult Function( _ReorderItems value)  reorderItems,required TResult Function( _SwipeAction value)  swipeAction,required TResult Function( _OpenAddEditScreen value)  openAddEditScreen,required TResult Function( _AddItem value)  addItem,required TResult Function( _UpdateItem value)  updateItem,required TResult Function( _DeleteItem value)  deleteItem,}){
final _that = this;
switch (_that) {
case _LoadStock():
return loadStock(_that);case _ReorderItems():
return reorderItems(_that);case _SwipeAction():
return swipeAction(_that);case _OpenAddEditScreen():
return openAddEditScreen(_that);case _AddItem():
return addItem(_that);case _UpdateItem():
return updateItem(_that);case _DeleteItem():
return deleteItem(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadStock value)?  loadStock,TResult? Function( _ReorderItems value)?  reorderItems,TResult? Function( _SwipeAction value)?  swipeAction,TResult? Function( _OpenAddEditScreen value)?  openAddEditScreen,TResult? Function( _AddItem value)?  addItem,TResult? Function( _UpdateItem value)?  updateItem,TResult? Function( _DeleteItem value)?  deleteItem,}){
final _that = this;
switch (_that) {
case _LoadStock() when loadStock != null:
return loadStock(_that);case _ReorderItems() when reorderItems != null:
return reorderItems(_that);case _SwipeAction() when swipeAction != null:
return swipeAction(_that);case _OpenAddEditScreen() when openAddEditScreen != null:
return openAddEditScreen(_that);case _AddItem() when addItem != null:
return addItem(_that);case _UpdateItem() when updateItem != null:
return updateItem(_that);case _DeleteItem() when deleteItem != null:
return deleteItem(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String stockId)?  loadStock,TResult Function( int oldIndex,  int newIndex)?  reorderItems,TResult Function( String itemId,  SwipeAction action)?  swipeAction,TResult Function( StockItem? item)?  openAddEditScreen,TResult Function( StockItem item)?  addItem,TResult Function( StockItem item)?  updateItem,TResult Function( String itemId)?  deleteItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadStock() when loadStock != null:
return loadStock(_that.stockId);case _ReorderItems() when reorderItems != null:
return reorderItems(_that.oldIndex,_that.newIndex);case _SwipeAction() when swipeAction != null:
return swipeAction(_that.itemId,_that.action);case _OpenAddEditScreen() when openAddEditScreen != null:
return openAddEditScreen(_that.item);case _AddItem() when addItem != null:
return addItem(_that.item);case _UpdateItem() when updateItem != null:
return updateItem(_that.item);case _DeleteItem() when deleteItem != null:
return deleteItem(_that.itemId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String stockId)  loadStock,required TResult Function( int oldIndex,  int newIndex)  reorderItems,required TResult Function( String itemId,  SwipeAction action)  swipeAction,required TResult Function( StockItem? item)  openAddEditScreen,required TResult Function( StockItem item)  addItem,required TResult Function( StockItem item)  updateItem,required TResult Function( String itemId)  deleteItem,}) {final _that = this;
switch (_that) {
case _LoadStock():
return loadStock(_that.stockId);case _ReorderItems():
return reorderItems(_that.oldIndex,_that.newIndex);case _SwipeAction():
return swipeAction(_that.itemId,_that.action);case _OpenAddEditScreen():
return openAddEditScreen(_that.item);case _AddItem():
return addItem(_that.item);case _UpdateItem():
return updateItem(_that.item);case _DeleteItem():
return deleteItem(_that.itemId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String stockId)?  loadStock,TResult? Function( int oldIndex,  int newIndex)?  reorderItems,TResult? Function( String itemId,  SwipeAction action)?  swipeAction,TResult? Function( StockItem? item)?  openAddEditScreen,TResult? Function( StockItem item)?  addItem,TResult? Function( StockItem item)?  updateItem,TResult? Function( String itemId)?  deleteItem,}) {final _that = this;
switch (_that) {
case _LoadStock() when loadStock != null:
return loadStock(_that.stockId);case _ReorderItems() when reorderItems != null:
return reorderItems(_that.oldIndex,_that.newIndex);case _SwipeAction() when swipeAction != null:
return swipeAction(_that.itemId,_that.action);case _OpenAddEditScreen() when openAddEditScreen != null:
return openAddEditScreen(_that.item);case _AddItem() when addItem != null:
return addItem(_that.item);case _UpdateItem() when updateItem != null:
return updateItem(_that.item);case _DeleteItem() when deleteItem != null:
return deleteItem(_that.itemId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadStock implements StockEvent {
  const _LoadStock(this.stockId);
  

 final  String stockId;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadStockCopyWith<_LoadStock> get copyWith => __$LoadStockCopyWithImpl<_LoadStock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadStock&&(identical(other.stockId, stockId) || other.stockId == stockId));
}


@override
int get hashCode => Object.hash(runtimeType,stockId);

@override
String toString() {
  return 'StockEvent.loadStock(stockId: $stockId)';
}


}

/// @nodoc
abstract mixin class _$LoadStockCopyWith<$Res> implements $StockEventCopyWith<$Res> {
  factory _$LoadStockCopyWith(_LoadStock value, $Res Function(_LoadStock) _then) = __$LoadStockCopyWithImpl;
@useResult
$Res call({
 String stockId
});




}
/// @nodoc
class __$LoadStockCopyWithImpl<$Res>
    implements _$LoadStockCopyWith<$Res> {
  __$LoadStockCopyWithImpl(this._self, this._then);

  final _LoadStock _self;
  final $Res Function(_LoadStock) _then;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stockId = null,}) {
  return _then(_LoadStock(
null == stockId ? _self.stockId : stockId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ReorderItems implements StockEvent {
  const _ReorderItems(this.oldIndex, this.newIndex);
  

 final  int oldIndex;
 final  int newIndex;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderItemsCopyWith<_ReorderItems> get copyWith => __$ReorderItemsCopyWithImpl<_ReorderItems>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderItems&&(identical(other.oldIndex, oldIndex) || other.oldIndex == oldIndex)&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,oldIndex,newIndex);

@override
String toString() {
  return 'StockEvent.reorderItems(oldIndex: $oldIndex, newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class _$ReorderItemsCopyWith<$Res> implements $StockEventCopyWith<$Res> {
  factory _$ReorderItemsCopyWith(_ReorderItems value, $Res Function(_ReorderItems) _then) = __$ReorderItemsCopyWithImpl;
@useResult
$Res call({
 int oldIndex, int newIndex
});




}
/// @nodoc
class __$ReorderItemsCopyWithImpl<$Res>
    implements _$ReorderItemsCopyWith<$Res> {
  __$ReorderItemsCopyWithImpl(this._self, this._then);

  final _ReorderItems _self;
  final $Res Function(_ReorderItems) _then;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldIndex = null,Object? newIndex = null,}) {
  return _then(_ReorderItems(
null == oldIndex ? _self.oldIndex : oldIndex // ignore: cast_nullable_to_non_nullable
as int,null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SwipeAction implements StockEvent {
  const _SwipeAction(this.itemId, this.action);
  

 final  String itemId;
 final  SwipeAction action;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwipeActionCopyWith<_SwipeAction> get copyWith => __$SwipeActionCopyWithImpl<_SwipeAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwipeAction&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other.action, action));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(action));

@override
String toString() {
  return 'StockEvent.swipeAction(itemId: $itemId, action: $action)';
}


}

/// @nodoc
abstract mixin class _$SwipeActionCopyWith<$Res> implements $StockEventCopyWith<$Res> {
  factory _$SwipeActionCopyWith(_SwipeAction value, $Res Function(_SwipeAction) _then) = __$SwipeActionCopyWithImpl;
@useResult
$Res call({
 String itemId, SwipeAction action
});




}
/// @nodoc
class __$SwipeActionCopyWithImpl<$Res>
    implements _$SwipeActionCopyWith<$Res> {
  __$SwipeActionCopyWithImpl(this._self, this._then);

  final _SwipeAction _self;
  final $Res Function(_SwipeAction) _then;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? action = freezed,}) {
  return _then(_SwipeAction(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as SwipeAction,
  ));
}


}

/// @nodoc


class _OpenAddEditScreen implements StockEvent {
  const _OpenAddEditScreen({this.item});
  

 final  StockItem? item;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAddEditScreenCopyWith<_OpenAddEditScreen> get copyWith => __$OpenAddEditScreenCopyWithImpl<_OpenAddEditScreen>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAddEditScreen&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'StockEvent.openAddEditScreen(item: $item)';
}


}

/// @nodoc
abstract mixin class _$OpenAddEditScreenCopyWith<$Res> implements $StockEventCopyWith<$Res> {
  factory _$OpenAddEditScreenCopyWith(_OpenAddEditScreen value, $Res Function(_OpenAddEditScreen) _then) = __$OpenAddEditScreenCopyWithImpl;
@useResult
$Res call({
 StockItem? item
});


$StockItemCopyWith<$Res>? get item;

}
/// @nodoc
class __$OpenAddEditScreenCopyWithImpl<$Res>
    implements _$OpenAddEditScreenCopyWith<$Res> {
  __$OpenAddEditScreenCopyWithImpl(this._self, this._then);

  final _OpenAddEditScreen _self;
  final $Res Function(_OpenAddEditScreen) _then;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = freezed,}) {
  return _then(_OpenAddEditScreen(
item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as StockItem?,
  ));
}

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockItemCopyWith<$Res>? get item {
    if (_self.item == null) {
    return null;
  }

  return $StockItemCopyWith<$Res>(_self.item!, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class _AddItem implements StockEvent {
  const _AddItem(this.item);
  

 final  StockItem item;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddItemCopyWith<_AddItem> get copyWith => __$AddItemCopyWithImpl<_AddItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddItem&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'StockEvent.addItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$AddItemCopyWith<$Res> implements $StockEventCopyWith<$Res> {
  factory _$AddItemCopyWith(_AddItem value, $Res Function(_AddItem) _then) = __$AddItemCopyWithImpl;
@useResult
$Res call({
 StockItem item
});


$StockItemCopyWith<$Res> get item;

}
/// @nodoc
class __$AddItemCopyWithImpl<$Res>
    implements _$AddItemCopyWith<$Res> {
  __$AddItemCopyWithImpl(this._self, this._then);

  final _AddItem _self;
  final $Res Function(_AddItem) _then;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_AddItem(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as StockItem,
  ));
}

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockItemCopyWith<$Res> get item {
  
  return $StockItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class _UpdateItem implements StockEvent {
  const _UpdateItem(this.item);
  

 final  StockItem item;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateItemCopyWith<_UpdateItem> get copyWith => __$UpdateItemCopyWithImpl<_UpdateItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateItem&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'StockEvent.updateItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$UpdateItemCopyWith<$Res> implements $StockEventCopyWith<$Res> {
  factory _$UpdateItemCopyWith(_UpdateItem value, $Res Function(_UpdateItem) _then) = __$UpdateItemCopyWithImpl;
@useResult
$Res call({
 StockItem item
});


$StockItemCopyWith<$Res> get item;

}
/// @nodoc
class __$UpdateItemCopyWithImpl<$Res>
    implements _$UpdateItemCopyWith<$Res> {
  __$UpdateItemCopyWithImpl(this._self, this._then);

  final _UpdateItem _self;
  final $Res Function(_UpdateItem) _then;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_UpdateItem(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as StockItem,
  ));
}

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StockItemCopyWith<$Res> get item {
  
  return $StockItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class _DeleteItem implements StockEvent {
  const _DeleteItem(this.itemId);
  

 final  String itemId;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteItemCopyWith<_DeleteItem> get copyWith => __$DeleteItemCopyWithImpl<_DeleteItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteItem&&(identical(other.itemId, itemId) || other.itemId == itemId));
}


@override
int get hashCode => Object.hash(runtimeType,itemId);

@override
String toString() {
  return 'StockEvent.deleteItem(itemId: $itemId)';
}


}

/// @nodoc
abstract mixin class _$DeleteItemCopyWith<$Res> implements $StockEventCopyWith<$Res> {
  factory _$DeleteItemCopyWith(_DeleteItem value, $Res Function(_DeleteItem) _then) = __$DeleteItemCopyWithImpl;
@useResult
$Res call({
 String itemId
});




}
/// @nodoc
class __$DeleteItemCopyWithImpl<$Res>
    implements _$DeleteItemCopyWith<$Res> {
  __$DeleteItemCopyWithImpl(this._self, this._then);

  final _DeleteItem _self;
  final $Res Function(_DeleteItem) _then;

/// Create a copy of StockEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? itemId = null,}) {
  return _then(_DeleteItem(
null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$StockState {

 bool get isLoading; StockEntity? get stockEntity;// данные самого склада (название, путь)
 List<StockItem> get items;
/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockStateCopyWith<StockState> get copyWith => _$StockStateCopyWithImpl<StockState>(this as StockState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.stockEntity, stockEntity) || other.stockEntity == stockEntity)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,stockEntity,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'StockState(isLoading: $isLoading, stockEntity: $stockEntity, items: $items)';
}


}

/// @nodoc
abstract mixin class $StockStateCopyWith<$Res>  {
  factory $StockStateCopyWith(StockState value, $Res Function(StockState) _then) = _$StockStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, StockEntity? stockEntity, List<StockItem> items
});




}
/// @nodoc
class _$StockStateCopyWithImpl<$Res>
    implements $StockStateCopyWith<$Res> {
  _$StockStateCopyWithImpl(this._self, this._then);

  final StockState _self;
  final $Res Function(StockState) _then;

/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? stockEntity = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,stockEntity: freezed == stockEntity ? _self.stockEntity : stockEntity // ignore: cast_nullable_to_non_nullable
as StockEntity?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<StockItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [StockState].
extension StockStatePatterns on StockState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockState value)  $default,){
final _that = this;
switch (_that) {
case _StockState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockState value)?  $default,){
final _that = this;
switch (_that) {
case _StockState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  StockEntity? stockEntity,  List<StockItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockState() when $default != null:
return $default(_that.isLoading,_that.stockEntity,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  StockEntity? stockEntity,  List<StockItem> items)  $default,) {final _that = this;
switch (_that) {
case _StockState():
return $default(_that.isLoading,_that.stockEntity,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  StockEntity? stockEntity,  List<StockItem> items)?  $default,) {final _that = this;
switch (_that) {
case _StockState() when $default != null:
return $default(_that.isLoading,_that.stockEntity,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _StockState implements StockState {
  const _StockState({this.isLoading = false, this.stockEntity, final  List<StockItem> items = const []}): _items = items;
  

@override@JsonKey() final  bool isLoading;
@override final  StockEntity? stockEntity;
// данные самого склада (название, путь)
 final  List<StockItem> _items;
// данные самого склада (название, путь)
@override@JsonKey() List<StockItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockStateCopyWith<_StockState> get copyWith => __$StockStateCopyWithImpl<_StockState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.stockEntity, stockEntity) || other.stockEntity == stockEntity)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,stockEntity,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'StockState(isLoading: $isLoading, stockEntity: $stockEntity, items: $items)';
}


}

/// @nodoc
abstract mixin class _$StockStateCopyWith<$Res> implements $StockStateCopyWith<$Res> {
  factory _$StockStateCopyWith(_StockState value, $Res Function(_StockState) _then) = __$StockStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, StockEntity? stockEntity, List<StockItem> items
});




}
/// @nodoc
class __$StockStateCopyWithImpl<$Res>
    implements _$StockStateCopyWith<$Res> {
  __$StockStateCopyWithImpl(this._self, this._then);

  final _StockState _self;
  final $Res Function(_StockState) _then;

/// Create a copy of StockState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? stockEntity = freezed,Object? items = null,}) {
  return _then(_StockState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,stockEntity: freezed == stockEntity ? _self.stockEntity : stockEntity // ignore: cast_nullable_to_non_nullable
as StockEntity?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<StockItem>,
  ));
}


}

// dart format on
