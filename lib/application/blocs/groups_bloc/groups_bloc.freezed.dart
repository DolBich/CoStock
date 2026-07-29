// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groups_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GroupsEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent()';
}


}

/// @nodoc
class $GroupsEventCopyWith<$Res>  {
$GroupsEventCopyWith(GroupsEvent _, $Res Function(GroupsEvent) __);
}


/// Adds pattern-matching-related methods to [GroupsEvent].
extension GroupsEventPatterns on GroupsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadTree value)?  loadTree,TResult Function( _NavigateNode value)?  navigateNode,TResult Function( _AddNode value)?  addNode,TResult Function( _DeleteNode value)?  deleteNode,TResult Function( _UpdateNode value)?  updateNode,TResult Function( _ApplySortFilter value)?  applySortFilter,TResult Function( _MoveNode value)?  moveNode,TResult Function( _SearchQuery value)?  searchQuery,TResult Function( _ToggleEditMode value)?  toggleEditMode,TResult Function( _SelectEntity value)?  selectEntity,TResult Function( _ToggleMoveEntities value)?  toggleMoveEntities,TResult Function( _ConfirmMoveEntity value)?  confirmMoveEntity,TResult Function( _DeleteSelectedEntities value)?  deleteSelectedEntities,TResult Function( _SaveEditedTree value)?  saveEditedTree,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadTree() when loadTree != null:
return loadTree(_that);case _NavigateNode() when navigateNode != null:
return navigateNode(_that);case _AddNode() when addNode != null:
return addNode(_that);case _DeleteNode() when deleteNode != null:
return deleteNode(_that);case _UpdateNode() when updateNode != null:
return updateNode(_that);case _ApplySortFilter() when applySortFilter != null:
return applySortFilter(_that);case _MoveNode() when moveNode != null:
return moveNode(_that);case _SearchQuery() when searchQuery != null:
return searchQuery(_that);case _ToggleEditMode() when toggleEditMode != null:
return toggleEditMode(_that);case _SelectEntity() when selectEntity != null:
return selectEntity(_that);case _ToggleMoveEntities() when toggleMoveEntities != null:
return toggleMoveEntities(_that);case _ConfirmMoveEntity() when confirmMoveEntity != null:
return confirmMoveEntity(_that);case _DeleteSelectedEntities() when deleteSelectedEntities != null:
return deleteSelectedEntities(_that);case _SaveEditedTree() when saveEditedTree != null:
return saveEditedTree(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadTree value)  loadTree,required TResult Function( _NavigateNode value)  navigateNode,required TResult Function( _AddNode value)  addNode,required TResult Function( _DeleteNode value)  deleteNode,required TResult Function( _UpdateNode value)  updateNode,required TResult Function( _ApplySortFilter value)  applySortFilter,required TResult Function( _MoveNode value)  moveNode,required TResult Function( _SearchQuery value)  searchQuery,required TResult Function( _ToggleEditMode value)  toggleEditMode,required TResult Function( _SelectEntity value)  selectEntity,required TResult Function( _ToggleMoveEntities value)  toggleMoveEntities,required TResult Function( _ConfirmMoveEntity value)  confirmMoveEntity,required TResult Function( _DeleteSelectedEntities value)  deleteSelectedEntities,required TResult Function( _SaveEditedTree value)  saveEditedTree,}){
final _that = this;
switch (_that) {
case _LoadTree():
return loadTree(_that);case _NavigateNode():
return navigateNode(_that);case _AddNode():
return addNode(_that);case _DeleteNode():
return deleteNode(_that);case _UpdateNode():
return updateNode(_that);case _ApplySortFilter():
return applySortFilter(_that);case _MoveNode():
return moveNode(_that);case _SearchQuery():
return searchQuery(_that);case _ToggleEditMode():
return toggleEditMode(_that);case _SelectEntity():
return selectEntity(_that);case _ToggleMoveEntities():
return toggleMoveEntities(_that);case _ConfirmMoveEntity():
return confirmMoveEntity(_that);case _DeleteSelectedEntities():
return deleteSelectedEntities(_that);case _SaveEditedTree():
return saveEditedTree(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadTree value)?  loadTree,TResult? Function( _NavigateNode value)?  navigateNode,TResult? Function( _AddNode value)?  addNode,TResult? Function( _DeleteNode value)?  deleteNode,TResult? Function( _UpdateNode value)?  updateNode,TResult? Function( _ApplySortFilter value)?  applySortFilter,TResult? Function( _MoveNode value)?  moveNode,TResult? Function( _SearchQuery value)?  searchQuery,TResult? Function( _ToggleEditMode value)?  toggleEditMode,TResult? Function( _SelectEntity value)?  selectEntity,TResult? Function( _ToggleMoveEntities value)?  toggleMoveEntities,TResult? Function( _ConfirmMoveEntity value)?  confirmMoveEntity,TResult? Function( _DeleteSelectedEntities value)?  deleteSelectedEntities,TResult? Function( _SaveEditedTree value)?  saveEditedTree,}){
final _that = this;
switch (_that) {
case _LoadTree() when loadTree != null:
return loadTree(_that);case _NavigateNode() when navigateNode != null:
return navigateNode(_that);case _AddNode() when addNode != null:
return addNode(_that);case _DeleteNode() when deleteNode != null:
return deleteNode(_that);case _UpdateNode() when updateNode != null:
return updateNode(_that);case _ApplySortFilter() when applySortFilter != null:
return applySortFilter(_that);case _MoveNode() when moveNode != null:
return moveNode(_that);case _SearchQuery() when searchQuery != null:
return searchQuery(_that);case _ToggleEditMode() when toggleEditMode != null:
return toggleEditMode(_that);case _SelectEntity() when selectEntity != null:
return selectEntity(_that);case _ToggleMoveEntities() when toggleMoveEntities != null:
return toggleMoveEntities(_that);case _ConfirmMoveEntity() when confirmMoveEntity != null:
return confirmMoveEntity(_that);case _DeleteSelectedEntities() when deleteSelectedEntities != null:
return deleteSelectedEntities(_that);case _SaveEditedTree() when saveEditedTree != null:
return saveEditedTree(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTree,TResult Function( StockEntity? entity)?  navigateNode,TResult Function( String name,  StockEntityType type)?  addNode,TResult Function( String nodeId)?  deleteNode,TResult Function( String nodeId,  String newName,  String? newParentId)?  updateNode,TResult Function( SortMode? sortMode,  FilterMode? filterMode)?  applySortFilter,TResult Function( StockEntity node,  String? newParentId,  int newIndex,  int oldIndex)?  moveNode,TResult Function( String query)?  searchQuery,TResult Function()?  toggleEditMode,TResult Function( StockEntity entity)?  selectEntity,TResult Function()?  toggleMoveEntities,TResult Function( String id)?  confirmMoveEntity,TResult Function()?  deleteSelectedEntities,TResult Function()?  saveEditedTree,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadTree() when loadTree != null:
return loadTree();case _NavigateNode() when navigateNode != null:
return navigateNode(_that.entity);case _AddNode() when addNode != null:
return addNode(_that.name,_that.type);case _DeleteNode() when deleteNode != null:
return deleteNode(_that.nodeId);case _UpdateNode() when updateNode != null:
return updateNode(_that.nodeId,_that.newName,_that.newParentId);case _ApplySortFilter() when applySortFilter != null:
return applySortFilter(_that.sortMode,_that.filterMode);case _MoveNode() when moveNode != null:
return moveNode(_that.node,_that.newParentId,_that.newIndex,_that.oldIndex);case _SearchQuery() when searchQuery != null:
return searchQuery(_that.query);case _ToggleEditMode() when toggleEditMode != null:
return toggleEditMode();case _SelectEntity() when selectEntity != null:
return selectEntity(_that.entity);case _ToggleMoveEntities() when toggleMoveEntities != null:
return toggleMoveEntities();case _ConfirmMoveEntity() when confirmMoveEntity != null:
return confirmMoveEntity(_that.id);case _DeleteSelectedEntities() when deleteSelectedEntities != null:
return deleteSelectedEntities();case _SaveEditedTree() when saveEditedTree != null:
return saveEditedTree();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTree,required TResult Function( StockEntity? entity)  navigateNode,required TResult Function( String name,  StockEntityType type)  addNode,required TResult Function( String nodeId)  deleteNode,required TResult Function( String nodeId,  String newName,  String? newParentId)  updateNode,required TResult Function( SortMode? sortMode,  FilterMode? filterMode)  applySortFilter,required TResult Function( StockEntity node,  String? newParentId,  int newIndex,  int oldIndex)  moveNode,required TResult Function( String query)  searchQuery,required TResult Function()  toggleEditMode,required TResult Function( StockEntity entity)  selectEntity,required TResult Function()  toggleMoveEntities,required TResult Function( String id)  confirmMoveEntity,required TResult Function()  deleteSelectedEntities,required TResult Function()  saveEditedTree,}) {final _that = this;
switch (_that) {
case _LoadTree():
return loadTree();case _NavigateNode():
return navigateNode(_that.entity);case _AddNode():
return addNode(_that.name,_that.type);case _DeleteNode():
return deleteNode(_that.nodeId);case _UpdateNode():
return updateNode(_that.nodeId,_that.newName,_that.newParentId);case _ApplySortFilter():
return applySortFilter(_that.sortMode,_that.filterMode);case _MoveNode():
return moveNode(_that.node,_that.newParentId,_that.newIndex,_that.oldIndex);case _SearchQuery():
return searchQuery(_that.query);case _ToggleEditMode():
return toggleEditMode();case _SelectEntity():
return selectEntity(_that.entity);case _ToggleMoveEntities():
return toggleMoveEntities();case _ConfirmMoveEntity():
return confirmMoveEntity(_that.id);case _DeleteSelectedEntities():
return deleteSelectedEntities();case _SaveEditedTree():
return saveEditedTree();case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTree,TResult? Function( StockEntity? entity)?  navigateNode,TResult? Function( String name,  StockEntityType type)?  addNode,TResult? Function( String nodeId)?  deleteNode,TResult? Function( String nodeId,  String newName,  String? newParentId)?  updateNode,TResult? Function( SortMode? sortMode,  FilterMode? filterMode)?  applySortFilter,TResult? Function( StockEntity node,  String? newParentId,  int newIndex,  int oldIndex)?  moveNode,TResult? Function( String query)?  searchQuery,TResult? Function()?  toggleEditMode,TResult? Function( StockEntity entity)?  selectEntity,TResult? Function()?  toggleMoveEntities,TResult? Function( String id)?  confirmMoveEntity,TResult? Function()?  deleteSelectedEntities,TResult? Function()?  saveEditedTree,}) {final _that = this;
switch (_that) {
case _LoadTree() when loadTree != null:
return loadTree();case _NavigateNode() when navigateNode != null:
return navigateNode(_that.entity);case _AddNode() when addNode != null:
return addNode(_that.name,_that.type);case _DeleteNode() when deleteNode != null:
return deleteNode(_that.nodeId);case _UpdateNode() when updateNode != null:
return updateNode(_that.nodeId,_that.newName,_that.newParentId);case _ApplySortFilter() when applySortFilter != null:
return applySortFilter(_that.sortMode,_that.filterMode);case _MoveNode() when moveNode != null:
return moveNode(_that.node,_that.newParentId,_that.newIndex,_that.oldIndex);case _SearchQuery() when searchQuery != null:
return searchQuery(_that.query);case _ToggleEditMode() when toggleEditMode != null:
return toggleEditMode();case _SelectEntity() when selectEntity != null:
return selectEntity(_that.entity);case _ToggleMoveEntities() when toggleMoveEntities != null:
return toggleMoveEntities();case _ConfirmMoveEntity() when confirmMoveEntity != null:
return confirmMoveEntity(_that.id);case _DeleteSelectedEntities() when deleteSelectedEntities != null:
return deleteSelectedEntities();case _SaveEditedTree() when saveEditedTree != null:
return saveEditedTree();case _:
  return null;

}
}

}

/// @nodoc


class _LoadTree with DiagnosticableTreeMixin implements GroupsEvent {
  const _LoadTree();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.loadTree'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTree);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.loadTree()';
}


}




/// @nodoc


class _NavigateNode with DiagnosticableTreeMixin implements GroupsEvent {
  const _NavigateNode(this.entity);
  

 final  StockEntity? entity;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigateNodeCopyWith<_NavigateNode> get copyWith => __$NavigateNodeCopyWithImpl<_NavigateNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.navigateNode'))
    ..add(DiagnosticsProperty('entity', entity));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateNode&&(identical(other.entity, entity) || other.entity == entity));
}


@override
int get hashCode => Object.hash(runtimeType,entity);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.navigateNode(entity: $entity)';
}


}

/// @nodoc
abstract mixin class _$NavigateNodeCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$NavigateNodeCopyWith(_NavigateNode value, $Res Function(_NavigateNode) _then) = __$NavigateNodeCopyWithImpl;
@useResult
$Res call({
 StockEntity? entity
});




}
/// @nodoc
class __$NavigateNodeCopyWithImpl<$Res>
    implements _$NavigateNodeCopyWith<$Res> {
  __$NavigateNodeCopyWithImpl(this._self, this._then);

  final _NavigateNode _self;
  final $Res Function(_NavigateNode) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entity = freezed,}) {
  return _then(_NavigateNode(
freezed == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as StockEntity?,
  ));
}


}

/// @nodoc


class _AddNode with DiagnosticableTreeMixin implements GroupsEvent {
  const _AddNode({required this.name, required this.type});
  

 final  String name;
 final  StockEntityType type;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNodeCopyWith<_AddNode> get copyWith => __$AddNodeCopyWithImpl<_AddNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.addNode'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('type', type));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNode&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,name,type);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.addNode(name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$AddNodeCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$AddNodeCopyWith(_AddNode value, $Res Function(_AddNode) _then) = __$AddNodeCopyWithImpl;
@useResult
$Res call({
 String name, StockEntityType type
});




}
/// @nodoc
class __$AddNodeCopyWithImpl<$Res>
    implements _$AddNodeCopyWith<$Res> {
  __$AddNodeCopyWithImpl(this._self, this._then);

  final _AddNode _self;
  final $Res Function(_AddNode) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,}) {
  return _then(_AddNode(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StockEntityType,
  ));
}


}

/// @nodoc


class _DeleteNode with DiagnosticableTreeMixin implements GroupsEvent {
  const _DeleteNode(this.nodeId);
  

 final  String nodeId;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteNodeCopyWith<_DeleteNode> get copyWith => __$DeleteNodeCopyWithImpl<_DeleteNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.deleteNode'))
    ..add(DiagnosticsProperty('nodeId', nodeId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteNode&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId));
}


@override
int get hashCode => Object.hash(runtimeType,nodeId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.deleteNode(nodeId: $nodeId)';
}


}

/// @nodoc
abstract mixin class _$DeleteNodeCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$DeleteNodeCopyWith(_DeleteNode value, $Res Function(_DeleteNode) _then) = __$DeleteNodeCopyWithImpl;
@useResult
$Res call({
 String nodeId
});




}
/// @nodoc
class __$DeleteNodeCopyWithImpl<$Res>
    implements _$DeleteNodeCopyWith<$Res> {
  __$DeleteNodeCopyWithImpl(this._self, this._then);

  final _DeleteNode _self;
  final $Res Function(_DeleteNode) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nodeId = null,}) {
  return _then(_DeleteNode(
null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateNode with DiagnosticableTreeMixin implements GroupsEvent {
  const _UpdateNode({required this.nodeId, required this.newName, this.newParentId});
  

 final  String nodeId;
 final  String newName;
 final  String? newParentId;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateNodeCopyWith<_UpdateNode> get copyWith => __$UpdateNodeCopyWithImpl<_UpdateNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.updateNode'))
    ..add(DiagnosticsProperty('nodeId', nodeId))..add(DiagnosticsProperty('newName', newName))..add(DiagnosticsProperty('newParentId', newParentId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateNode&&(identical(other.nodeId, nodeId) || other.nodeId == nodeId)&&(identical(other.newName, newName) || other.newName == newName)&&(identical(other.newParentId, newParentId) || other.newParentId == newParentId));
}


@override
int get hashCode => Object.hash(runtimeType,nodeId,newName,newParentId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.updateNode(nodeId: $nodeId, newName: $newName, newParentId: $newParentId)';
}


}

/// @nodoc
abstract mixin class _$UpdateNodeCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$UpdateNodeCopyWith(_UpdateNode value, $Res Function(_UpdateNode) _then) = __$UpdateNodeCopyWithImpl;
@useResult
$Res call({
 String nodeId, String newName, String? newParentId
});




}
/// @nodoc
class __$UpdateNodeCopyWithImpl<$Res>
    implements _$UpdateNodeCopyWith<$Res> {
  __$UpdateNodeCopyWithImpl(this._self, this._then);

  final _UpdateNode _self;
  final $Res Function(_UpdateNode) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nodeId = null,Object? newName = null,Object? newParentId = freezed,}) {
  return _then(_UpdateNode(
nodeId: null == nodeId ? _self.nodeId : nodeId // ignore: cast_nullable_to_non_nullable
as String,newName: null == newName ? _self.newName : newName // ignore: cast_nullable_to_non_nullable
as String,newParentId: freezed == newParentId ? _self.newParentId : newParentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ApplySortFilter with DiagnosticableTreeMixin implements GroupsEvent {
  const _ApplySortFilter({required this.sortMode, required this.filterMode});
  

 final  SortMode? sortMode;
 final  FilterMode? filterMode;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplySortFilterCopyWith<_ApplySortFilter> get copyWith => __$ApplySortFilterCopyWithImpl<_ApplySortFilter>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.applySortFilter'))
    ..add(DiagnosticsProperty('sortMode', sortMode))..add(DiagnosticsProperty('filterMode', filterMode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplySortFilter&&(identical(other.sortMode, sortMode) || other.sortMode == sortMode)&&(identical(other.filterMode, filterMode) || other.filterMode == filterMode));
}


@override
int get hashCode => Object.hash(runtimeType,sortMode,filterMode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.applySortFilter(sortMode: $sortMode, filterMode: $filterMode)';
}


}

/// @nodoc
abstract mixin class _$ApplySortFilterCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$ApplySortFilterCopyWith(_ApplySortFilter value, $Res Function(_ApplySortFilter) _then) = __$ApplySortFilterCopyWithImpl;
@useResult
$Res call({
 SortMode? sortMode, FilterMode? filterMode
});




}
/// @nodoc
class __$ApplySortFilterCopyWithImpl<$Res>
    implements _$ApplySortFilterCopyWith<$Res> {
  __$ApplySortFilterCopyWithImpl(this._self, this._then);

  final _ApplySortFilter _self;
  final $Res Function(_ApplySortFilter) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sortMode = freezed,Object? filterMode = freezed,}) {
  return _then(_ApplySortFilter(
sortMode: freezed == sortMode ? _self.sortMode : sortMode // ignore: cast_nullable_to_non_nullable
as SortMode?,filterMode: freezed == filterMode ? _self.filterMode : filterMode // ignore: cast_nullable_to_non_nullable
as FilterMode?,
  ));
}


}

/// @nodoc


class _MoveNode with DiagnosticableTreeMixin implements GroupsEvent {
  const _MoveNode({required this.node, required this.newParentId, required this.newIndex, required this.oldIndex});
  

 final  StockEntity node;
 final  String? newParentId;
 final  int newIndex;
 final  int oldIndex;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoveNodeCopyWith<_MoveNode> get copyWith => __$MoveNodeCopyWithImpl<_MoveNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.moveNode'))
    ..add(DiagnosticsProperty('node', node))..add(DiagnosticsProperty('newParentId', newParentId))..add(DiagnosticsProperty('newIndex', newIndex))..add(DiagnosticsProperty('oldIndex', oldIndex));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoveNode&&(identical(other.node, node) || other.node == node)&&(identical(other.newParentId, newParentId) || other.newParentId == newParentId)&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex)&&(identical(other.oldIndex, oldIndex) || other.oldIndex == oldIndex));
}


@override
int get hashCode => Object.hash(runtimeType,node,newParentId,newIndex,oldIndex);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.moveNode(node: $node, newParentId: $newParentId, newIndex: $newIndex, oldIndex: $oldIndex)';
}


}

/// @nodoc
abstract mixin class _$MoveNodeCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$MoveNodeCopyWith(_MoveNode value, $Res Function(_MoveNode) _then) = __$MoveNodeCopyWithImpl;
@useResult
$Res call({
 StockEntity node, String? newParentId, int newIndex, int oldIndex
});




}
/// @nodoc
class __$MoveNodeCopyWithImpl<$Res>
    implements _$MoveNodeCopyWith<$Res> {
  __$MoveNodeCopyWithImpl(this._self, this._then);

  final _MoveNode _self;
  final $Res Function(_MoveNode) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? node = null,Object? newParentId = freezed,Object? newIndex = null,Object? oldIndex = null,}) {
  return _then(_MoveNode(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as StockEntity,newParentId: freezed == newParentId ? _self.newParentId : newParentId // ignore: cast_nullable_to_non_nullable
as String?,newIndex: null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,oldIndex: null == oldIndex ? _self.oldIndex : oldIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SearchQuery with DiagnosticableTreeMixin implements GroupsEvent {
  const _SearchQuery(this.query);
  

 final  String query;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchQueryCopyWith<_SearchQuery> get copyWith => __$SearchQueryCopyWithImpl<_SearchQuery>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.searchQuery'))
    ..add(DiagnosticsProperty('query', query));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchQuery&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.searchQuery(query: $query)';
}


}

/// @nodoc
abstract mixin class _$SearchQueryCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$SearchQueryCopyWith(_SearchQuery value, $Res Function(_SearchQuery) _then) = __$SearchQueryCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$SearchQueryCopyWithImpl<$Res>
    implements _$SearchQueryCopyWith<$Res> {
  __$SearchQueryCopyWithImpl(this._self, this._then);

  final _SearchQuery _self;
  final $Res Function(_SearchQuery) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_SearchQuery(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToggleEditMode with DiagnosticableTreeMixin implements GroupsEvent {
  const _ToggleEditMode();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.toggleEditMode'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleEditMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.toggleEditMode()';
}


}




/// @nodoc


class _SelectEntity with DiagnosticableTreeMixin implements GroupsEvent {
  const _SelectEntity(this.entity);
  

 final  StockEntity entity;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectEntityCopyWith<_SelectEntity> get copyWith => __$SelectEntityCopyWithImpl<_SelectEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.selectEntity'))
    ..add(DiagnosticsProperty('entity', entity));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectEntity&&(identical(other.entity, entity) || other.entity == entity));
}


@override
int get hashCode => Object.hash(runtimeType,entity);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.selectEntity(entity: $entity)';
}


}

/// @nodoc
abstract mixin class _$SelectEntityCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$SelectEntityCopyWith(_SelectEntity value, $Res Function(_SelectEntity) _then) = __$SelectEntityCopyWithImpl;
@useResult
$Res call({
 StockEntity entity
});




}
/// @nodoc
class __$SelectEntityCopyWithImpl<$Res>
    implements _$SelectEntityCopyWith<$Res> {
  __$SelectEntityCopyWithImpl(this._self, this._then);

  final _SelectEntity _self;
  final $Res Function(_SelectEntity) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entity = null,}) {
  return _then(_SelectEntity(
null == entity ? _self.entity : entity // ignore: cast_nullable_to_non_nullable
as StockEntity,
  ));
}


}

/// @nodoc


class _ToggleMoveEntities with DiagnosticableTreeMixin implements GroupsEvent {
  const _ToggleMoveEntities();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.toggleMoveEntities'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleMoveEntities);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.toggleMoveEntities()';
}


}




/// @nodoc


class _ConfirmMoveEntity with DiagnosticableTreeMixin implements GroupsEvent {
  const _ConfirmMoveEntity(this.id);
  

 final  String id;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmMoveEntityCopyWith<_ConfirmMoveEntity> get copyWith => __$ConfirmMoveEntityCopyWithImpl<_ConfirmMoveEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.confirmMoveEntity'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmMoveEntity&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.confirmMoveEntity(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ConfirmMoveEntityCopyWith<$Res> implements $GroupsEventCopyWith<$Res> {
  factory _$ConfirmMoveEntityCopyWith(_ConfirmMoveEntity value, $Res Function(_ConfirmMoveEntity) _then) = __$ConfirmMoveEntityCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$ConfirmMoveEntityCopyWithImpl<$Res>
    implements _$ConfirmMoveEntityCopyWith<$Res> {
  __$ConfirmMoveEntityCopyWithImpl(this._self, this._then);

  final _ConfirmMoveEntity _self;
  final $Res Function(_ConfirmMoveEntity) _then;

/// Create a copy of GroupsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ConfirmMoveEntity(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteSelectedEntities with DiagnosticableTreeMixin implements GroupsEvent {
  const _DeleteSelectedEntities();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.deleteSelectedEntities'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSelectedEntities);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.deleteSelectedEntities()';
}


}




/// @nodoc


class _SaveEditedTree with DiagnosticableTreeMixin implements GroupsEvent {
  const _SaveEditedTree();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsEvent.saveEditedTree'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveEditedTree);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsEvent.saveEditedTree()';
}


}




/// @nodoc
mixin _$GroupsState implements DiagnosticableTreeMixin {

 bool get isLoading; List<StockEntity> get savedRootEntities;/// id открытой группы (null = корневой уровень)
 StockEntity? get currentNode;/// Физические сущности из [_treeService]
 List<StockEntity> get currentChildren;/// Фильтрация + сортировка
 SortMode? get sortMode; FilterMode? get filterMode;/// Управление порядком отображения
 SortArrangement get arrangement; String get searchQuery;/// Режим редактирования
 bool get isEditMode; List<MovingEntityInfo> get movingEntities; List<StockEntity> get selectedEntities; List<StockEntity> get editRootEntities;
/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupsStateCopyWith<GroupsState> get copyWith => _$GroupsStateCopyWithImpl<GroupsState>(this as GroupsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsState'))
    ..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('savedRootEntities', savedRootEntities))..add(DiagnosticsProperty('currentNode', currentNode))..add(DiagnosticsProperty('currentChildren', currentChildren))..add(DiagnosticsProperty('sortMode', sortMode))..add(DiagnosticsProperty('filterMode', filterMode))..add(DiagnosticsProperty('arrangement', arrangement))..add(DiagnosticsProperty('searchQuery', searchQuery))..add(DiagnosticsProperty('isEditMode', isEditMode))..add(DiagnosticsProperty('movingEntities', movingEntities))..add(DiagnosticsProperty('selectedEntities', selectedEntities))..add(DiagnosticsProperty('editRootEntities', editRootEntities));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.savedRootEntities, savedRootEntities)&&(identical(other.currentNode, currentNode) || other.currentNode == currentNode)&&const DeepCollectionEquality().equals(other.currentChildren, currentChildren)&&(identical(other.sortMode, sortMode) || other.sortMode == sortMode)&&(identical(other.filterMode, filterMode) || other.filterMode == filterMode)&&(identical(other.arrangement, arrangement) || other.arrangement == arrangement)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&const DeepCollectionEquality().equals(other.movingEntities, movingEntities)&&const DeepCollectionEquality().equals(other.selectedEntities, selectedEntities)&&const DeepCollectionEquality().equals(other.editRootEntities, editRootEntities));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(savedRootEntities),currentNode,const DeepCollectionEquality().hash(currentChildren),sortMode,filterMode,arrangement,searchQuery,isEditMode,const DeepCollectionEquality().hash(movingEntities),const DeepCollectionEquality().hash(selectedEntities),const DeepCollectionEquality().hash(editRootEntities));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsState(isLoading: $isLoading, savedRootEntities: $savedRootEntities, currentNode: $currentNode, currentChildren: $currentChildren, sortMode: $sortMode, filterMode: $filterMode, arrangement: $arrangement, searchQuery: $searchQuery, isEditMode: $isEditMode, movingEntities: $movingEntities, selectedEntities: $selectedEntities, editRootEntities: $editRootEntities)';
}


}

/// @nodoc
abstract mixin class $GroupsStateCopyWith<$Res>  {
  factory $GroupsStateCopyWith(GroupsState value, $Res Function(GroupsState) _then) = _$GroupsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<StockEntity> savedRootEntities, StockEntity? currentNode, List<StockEntity> currentChildren, SortMode? sortMode, FilterMode? filterMode, SortArrangement arrangement, String searchQuery, bool isEditMode, List<MovingEntityInfo> movingEntities, List<StockEntity> selectedEntities, List<StockEntity> editRootEntities
});


$SortArrangementCopyWith<$Res> get arrangement;

}
/// @nodoc
class _$GroupsStateCopyWithImpl<$Res>
    implements $GroupsStateCopyWith<$Res> {
  _$GroupsStateCopyWithImpl(this._self, this._then);

  final GroupsState _self;
  final $Res Function(GroupsState) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? savedRootEntities = null,Object? currentNode = freezed,Object? currentChildren = null,Object? sortMode = freezed,Object? filterMode = freezed,Object? arrangement = null,Object? searchQuery = null,Object? isEditMode = null,Object? movingEntities = null,Object? selectedEntities = null,Object? editRootEntities = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,savedRootEntities: null == savedRootEntities ? _self.savedRootEntities : savedRootEntities // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,currentNode: freezed == currentNode ? _self.currentNode : currentNode // ignore: cast_nullable_to_non_nullable
as StockEntity?,currentChildren: null == currentChildren ? _self.currentChildren : currentChildren // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,sortMode: freezed == sortMode ? _self.sortMode : sortMode // ignore: cast_nullable_to_non_nullable
as SortMode?,filterMode: freezed == filterMode ? _self.filterMode : filterMode // ignore: cast_nullable_to_non_nullable
as FilterMode?,arrangement: null == arrangement ? _self.arrangement : arrangement // ignore: cast_nullable_to_non_nullable
as SortArrangement,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,movingEntities: null == movingEntities ? _self.movingEntities : movingEntities // ignore: cast_nullable_to_non_nullable
as List<MovingEntityInfo>,selectedEntities: null == selectedEntities ? _self.selectedEntities : selectedEntities // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,editRootEntities: null == editRootEntities ? _self.editRootEntities : editRootEntities // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,
  ));
}
/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortArrangementCopyWith<$Res> get arrangement {
  
  return $SortArrangementCopyWith<$Res>(_self.arrangement, (value) {
    return _then(_self.copyWith(arrangement: value));
  });
}
}


/// Adds pattern-matching-related methods to [GroupsState].
extension GroupsStatePatterns on GroupsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupsState value)  $default,){
final _that = this;
switch (_that) {
case _GroupsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupsState value)?  $default,){
final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<StockEntity> savedRootEntities,  StockEntity? currentNode,  List<StockEntity> currentChildren,  SortMode? sortMode,  FilterMode? filterMode,  SortArrangement arrangement,  String searchQuery,  bool isEditMode,  List<MovingEntityInfo> movingEntities,  List<StockEntity> selectedEntities,  List<StockEntity> editRootEntities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
return $default(_that.isLoading,_that.savedRootEntities,_that.currentNode,_that.currentChildren,_that.sortMode,_that.filterMode,_that.arrangement,_that.searchQuery,_that.isEditMode,_that.movingEntities,_that.selectedEntities,_that.editRootEntities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<StockEntity> savedRootEntities,  StockEntity? currentNode,  List<StockEntity> currentChildren,  SortMode? sortMode,  FilterMode? filterMode,  SortArrangement arrangement,  String searchQuery,  bool isEditMode,  List<MovingEntityInfo> movingEntities,  List<StockEntity> selectedEntities,  List<StockEntity> editRootEntities)  $default,) {final _that = this;
switch (_that) {
case _GroupsState():
return $default(_that.isLoading,_that.savedRootEntities,_that.currentNode,_that.currentChildren,_that.sortMode,_that.filterMode,_that.arrangement,_that.searchQuery,_that.isEditMode,_that.movingEntities,_that.selectedEntities,_that.editRootEntities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<StockEntity> savedRootEntities,  StockEntity? currentNode,  List<StockEntity> currentChildren,  SortMode? sortMode,  FilterMode? filterMode,  SortArrangement arrangement,  String searchQuery,  bool isEditMode,  List<MovingEntityInfo> movingEntities,  List<StockEntity> selectedEntities,  List<StockEntity> editRootEntities)?  $default,) {final _that = this;
switch (_that) {
case _GroupsState() when $default != null:
return $default(_that.isLoading,_that.savedRootEntities,_that.currentNode,_that.currentChildren,_that.sortMode,_that.filterMode,_that.arrangement,_that.searchQuery,_that.isEditMode,_that.movingEntities,_that.selectedEntities,_that.editRootEntities);case _:
  return null;

}
}

}

/// @nodoc


class _GroupsState extends GroupsState with DiagnosticableTreeMixin {
  const _GroupsState({this.isLoading = false, final  List<StockEntity> savedRootEntities = const [], this.currentNode, final  List<StockEntity> currentChildren = const [], this.sortMode, this.filterMode, this.arrangement = const SortArrangement(), this.searchQuery = '', this.isEditMode = false, final  List<MovingEntityInfo> movingEntities = const [], final  List<StockEntity> selectedEntities = const [], final  List<StockEntity> editRootEntities = const []}): _savedRootEntities = savedRootEntities,_currentChildren = currentChildren,_movingEntities = movingEntities,_selectedEntities = selectedEntities,_editRootEntities = editRootEntities,super._();
  

@override@JsonKey() final  bool isLoading;
 final  List<StockEntity> _savedRootEntities;
@override@JsonKey() List<StockEntity> get savedRootEntities {
  if (_savedRootEntities is EqualUnmodifiableListView) return _savedRootEntities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedRootEntities);
}

/// id открытой группы (null = корневой уровень)
@override final  StockEntity? currentNode;
/// Физические сущности из [_treeService]
 final  List<StockEntity> _currentChildren;
/// Физические сущности из [_treeService]
@override@JsonKey() List<StockEntity> get currentChildren {
  if (_currentChildren is EqualUnmodifiableListView) return _currentChildren;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentChildren);
}

/// Фильтрация + сортировка
@override final  SortMode? sortMode;
@override final  FilterMode? filterMode;
/// Управление порядком отображения
@override@JsonKey() final  SortArrangement arrangement;
@override@JsonKey() final  String searchQuery;
/// Режим редактирования
@override@JsonKey() final  bool isEditMode;
 final  List<MovingEntityInfo> _movingEntities;
@override@JsonKey() List<MovingEntityInfo> get movingEntities {
  if (_movingEntities is EqualUnmodifiableListView) return _movingEntities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movingEntities);
}

 final  List<StockEntity> _selectedEntities;
@override@JsonKey() List<StockEntity> get selectedEntities {
  if (_selectedEntities is EqualUnmodifiableListView) return _selectedEntities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEntities);
}

 final  List<StockEntity> _editRootEntities;
@override@JsonKey() List<StockEntity> get editRootEntities {
  if (_editRootEntities is EqualUnmodifiableListView) return _editRootEntities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editRootEntities);
}


/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupsStateCopyWith<_GroupsState> get copyWith => __$GroupsStateCopyWithImpl<_GroupsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GroupsState'))
    ..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('savedRootEntities', savedRootEntities))..add(DiagnosticsProperty('currentNode', currentNode))..add(DiagnosticsProperty('currentChildren', currentChildren))..add(DiagnosticsProperty('sortMode', sortMode))..add(DiagnosticsProperty('filterMode', filterMode))..add(DiagnosticsProperty('arrangement', arrangement))..add(DiagnosticsProperty('searchQuery', searchQuery))..add(DiagnosticsProperty('isEditMode', isEditMode))..add(DiagnosticsProperty('movingEntities', movingEntities))..add(DiagnosticsProperty('selectedEntities', selectedEntities))..add(DiagnosticsProperty('editRootEntities', editRootEntities));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._savedRootEntities, _savedRootEntities)&&(identical(other.currentNode, currentNode) || other.currentNode == currentNode)&&const DeepCollectionEquality().equals(other._currentChildren, _currentChildren)&&(identical(other.sortMode, sortMode) || other.sortMode == sortMode)&&(identical(other.filterMode, filterMode) || other.filterMode == filterMode)&&(identical(other.arrangement, arrangement) || other.arrangement == arrangement)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&const DeepCollectionEquality().equals(other._movingEntities, _movingEntities)&&const DeepCollectionEquality().equals(other._selectedEntities, _selectedEntities)&&const DeepCollectionEquality().equals(other._editRootEntities, _editRootEntities));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_savedRootEntities),currentNode,const DeepCollectionEquality().hash(_currentChildren),sortMode,filterMode,arrangement,searchQuery,isEditMode,const DeepCollectionEquality().hash(_movingEntities),const DeepCollectionEquality().hash(_selectedEntities),const DeepCollectionEquality().hash(_editRootEntities));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GroupsState(isLoading: $isLoading, savedRootEntities: $savedRootEntities, currentNode: $currentNode, currentChildren: $currentChildren, sortMode: $sortMode, filterMode: $filterMode, arrangement: $arrangement, searchQuery: $searchQuery, isEditMode: $isEditMode, movingEntities: $movingEntities, selectedEntities: $selectedEntities, editRootEntities: $editRootEntities)';
}


}

/// @nodoc
abstract mixin class _$GroupsStateCopyWith<$Res> implements $GroupsStateCopyWith<$Res> {
  factory _$GroupsStateCopyWith(_GroupsState value, $Res Function(_GroupsState) _then) = __$GroupsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<StockEntity> savedRootEntities, StockEntity? currentNode, List<StockEntity> currentChildren, SortMode? sortMode, FilterMode? filterMode, SortArrangement arrangement, String searchQuery, bool isEditMode, List<MovingEntityInfo> movingEntities, List<StockEntity> selectedEntities, List<StockEntity> editRootEntities
});


@override $SortArrangementCopyWith<$Res> get arrangement;

}
/// @nodoc
class __$GroupsStateCopyWithImpl<$Res>
    implements _$GroupsStateCopyWith<$Res> {
  __$GroupsStateCopyWithImpl(this._self, this._then);

  final _GroupsState _self;
  final $Res Function(_GroupsState) _then;

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? savedRootEntities = null,Object? currentNode = freezed,Object? currentChildren = null,Object? sortMode = freezed,Object? filterMode = freezed,Object? arrangement = null,Object? searchQuery = null,Object? isEditMode = null,Object? movingEntities = null,Object? selectedEntities = null,Object? editRootEntities = null,}) {
  return _then(_GroupsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,savedRootEntities: null == savedRootEntities ? _self._savedRootEntities : savedRootEntities // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,currentNode: freezed == currentNode ? _self.currentNode : currentNode // ignore: cast_nullable_to_non_nullable
as StockEntity?,currentChildren: null == currentChildren ? _self._currentChildren : currentChildren // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,sortMode: freezed == sortMode ? _self.sortMode : sortMode // ignore: cast_nullable_to_non_nullable
as SortMode?,filterMode: freezed == filterMode ? _self.filterMode : filterMode // ignore: cast_nullable_to_non_nullable
as FilterMode?,arrangement: null == arrangement ? _self.arrangement : arrangement // ignore: cast_nullable_to_non_nullable
as SortArrangement,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,movingEntities: null == movingEntities ? _self._movingEntities : movingEntities // ignore: cast_nullable_to_non_nullable
as List<MovingEntityInfo>,selectedEntities: null == selectedEntities ? _self._selectedEntities : selectedEntities // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,editRootEntities: null == editRootEntities ? _self._editRootEntities : editRootEntities // ignore: cast_nullable_to_non_nullable
as List<StockEntity>,
  ));
}

/// Create a copy of GroupsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortArrangementCopyWith<$Res> get arrangement {
  
  return $SortArrangementCopyWith<$Res>(_self.arrangement, (value) {
    return _then(_self.copyWith(arrangement: value));
  });
}
}

// dart format on
