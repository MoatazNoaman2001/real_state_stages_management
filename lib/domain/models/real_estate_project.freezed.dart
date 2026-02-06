// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_estate_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RealEstateProject {

 int get id;@JsonKey(name: 'project_name') String get projectName;@JsonKey(name: 'current_status') String? get currentStatus; String? get notes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of RealEstateProject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealEstateProjectCopyWith<RealEstateProject> get copyWith => _$RealEstateProjectCopyWithImpl<RealEstateProject>(this as RealEstateProject, _$identity);

  /// Serializes this RealEstateProject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealEstateProject&&(identical(other.id, id) || other.id == id)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectName,currentStatus,notes,createdAt,updatedAt);

@override
String toString() {
  return 'RealEstateProject(id: $id, projectName: $projectName, currentStatus: $currentStatus, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RealEstateProjectCopyWith<$Res>  {
  factory $RealEstateProjectCopyWith(RealEstateProject value, $Res Function(RealEstateProject) _then) = _$RealEstateProjectCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'project_name') String projectName,@JsonKey(name: 'current_status') String? currentStatus, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$RealEstateProjectCopyWithImpl<$Res>
    implements $RealEstateProjectCopyWith<$Res> {
  _$RealEstateProjectCopyWithImpl(this._self, this._then);

  final RealEstateProject _self;
  final $Res Function(RealEstateProject) _then;

/// Create a copy of RealEstateProject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectName = null,Object? currentStatus = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RealEstateProject].
extension RealEstateProjectPatterns on RealEstateProject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealEstateProject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealEstateProject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealEstateProject value)  $default,){
final _that = this;
switch (_that) {
case _RealEstateProject():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealEstateProject value)?  $default,){
final _that = this;
switch (_that) {
case _RealEstateProject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'project_name')  String projectName, @JsonKey(name: 'current_status')  String? currentStatus,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealEstateProject() when $default != null:
return $default(_that.id,_that.projectName,_that.currentStatus,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'project_name')  String projectName, @JsonKey(name: 'current_status')  String? currentStatus,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RealEstateProject():
return $default(_that.id,_that.projectName,_that.currentStatus,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'project_name')  String projectName, @JsonKey(name: 'current_status')  String? currentStatus,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RealEstateProject() when $default != null:
return $default(_that.id,_that.projectName,_that.currentStatus,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealEstateProject implements RealEstateProject {
  const _RealEstateProject({required this.id, @JsonKey(name: 'project_name') required this.projectName, @JsonKey(name: 'current_status') this.currentStatus, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _RealEstateProject.fromJson(Map<String, dynamic> json) => _$RealEstateProjectFromJson(json);

@override final  int id;
@override@JsonKey(name: 'project_name') final  String projectName;
@override@JsonKey(name: 'current_status') final  String? currentStatus;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of RealEstateProject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealEstateProjectCopyWith<_RealEstateProject> get copyWith => __$RealEstateProjectCopyWithImpl<_RealEstateProject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealEstateProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealEstateProject&&(identical(other.id, id) || other.id == id)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectName,currentStatus,notes,createdAt,updatedAt);

@override
String toString() {
  return 'RealEstateProject(id: $id, projectName: $projectName, currentStatus: $currentStatus, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RealEstateProjectCopyWith<$Res> implements $RealEstateProjectCopyWith<$Res> {
  factory _$RealEstateProjectCopyWith(_RealEstateProject value, $Res Function(_RealEstateProject) _then) = __$RealEstateProjectCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'project_name') String projectName,@JsonKey(name: 'current_status') String? currentStatus, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$RealEstateProjectCopyWithImpl<$Res>
    implements _$RealEstateProjectCopyWith<$Res> {
  __$RealEstateProjectCopyWithImpl(this._self, this._then);

  final _RealEstateProject _self;
  final $Res Function(_RealEstateProject) _then;

/// Create a copy of RealEstateProject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectName = null,Object? currentStatus = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RealEstateProject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
