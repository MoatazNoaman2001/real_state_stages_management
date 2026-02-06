// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StageHistory {

 int get id;@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'stage_name') String? get stageName;@JsonKey(name: 'started_at') DateTime? get startedAt;@JsonKey(name: 'completed_at') DateTime? get completedAt;@JsonKey(name: 'duration_days') int? get durationDays;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of StageHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StageHistoryCopyWith<StageHistory> get copyWith => _$StageHistoryCopyWithImpl<StageHistory>(this as StageHistory, _$identity);

  /// Serializes this StageHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StageHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.stageName, stageName) || other.stageName == stageName)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,stageName,startedAt,completedAt,durationDays,createdAt);

@override
String toString() {
  return 'StageHistory(id: $id, customerId: $customerId, stageName: $stageName, startedAt: $startedAt, completedAt: $completedAt, durationDays: $durationDays, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StageHistoryCopyWith<$Res>  {
  factory $StageHistoryCopyWith(StageHistory value, $Res Function(StageHistory) _then) = _$StageHistoryCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'stage_name') String? stageName,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'duration_days') int? durationDays,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$StageHistoryCopyWithImpl<$Res>
    implements $StageHistoryCopyWith<$Res> {
  _$StageHistoryCopyWithImpl(this._self, this._then);

  final StageHistory _self;
  final $Res Function(StageHistory) _then;

/// Create a copy of StageHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? stageName = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? durationDays = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,stageName: freezed == stageName ? _self.stageName : stageName // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationDays: freezed == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StageHistory].
extension StageHistoryPatterns on StageHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StageHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StageHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StageHistory value)  $default,){
final _that = this;
switch (_that) {
case _StageHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StageHistory value)?  $default,){
final _that = this;
switch (_that) {
case _StageHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'stage_name')  String? stageName, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'duration_days')  int? durationDays, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StageHistory() when $default != null:
return $default(_that.id,_that.customerId,_that.stageName,_that.startedAt,_that.completedAt,_that.durationDays,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'stage_name')  String? stageName, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'duration_days')  int? durationDays, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StageHistory():
return $default(_that.id,_that.customerId,_that.stageName,_that.startedAt,_that.completedAt,_that.durationDays,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'stage_name')  String? stageName, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'duration_days')  int? durationDays, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StageHistory() when $default != null:
return $default(_that.id,_that.customerId,_that.stageName,_that.startedAt,_that.completedAt,_that.durationDays,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StageHistory extends StageHistory {
  const _StageHistory({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'stage_name') this.stageName, @JsonKey(name: 'started_at') this.startedAt, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'duration_days') this.durationDays, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _StageHistory.fromJson(Map<String, dynamic> json) => _$StageHistoryFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
@override@JsonKey(name: 'stage_name') final  String? stageName;
@override@JsonKey(name: 'started_at') final  DateTime? startedAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override@JsonKey(name: 'duration_days') final  int? durationDays;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of StageHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StageHistoryCopyWith<_StageHistory> get copyWith => __$StageHistoryCopyWithImpl<_StageHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StageHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StageHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.stageName, stageName) || other.stageName == stageName)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.durationDays, durationDays) || other.durationDays == durationDays)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,stageName,startedAt,completedAt,durationDays,createdAt);

@override
String toString() {
  return 'StageHistory(id: $id, customerId: $customerId, stageName: $stageName, startedAt: $startedAt, completedAt: $completedAt, durationDays: $durationDays, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StageHistoryCopyWith<$Res> implements $StageHistoryCopyWith<$Res> {
  factory _$StageHistoryCopyWith(_StageHistory value, $Res Function(_StageHistory) _then) = __$StageHistoryCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'stage_name') String? stageName,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'duration_days') int? durationDays,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$StageHistoryCopyWithImpl<$Res>
    implements _$StageHistoryCopyWith<$Res> {
  __$StageHistoryCopyWithImpl(this._self, this._then);

  final _StageHistory _self;
  final $Res Function(_StageHistory) _then;

/// Create a copy of StageHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? stageName = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? durationDays = freezed,Object? createdAt = null,}) {
  return _then(_StageHistory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,stageName: freezed == stageName ? _self.stageName : stageName // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationDays: freezed == durationDays ? _self.durationDays : durationDays // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
