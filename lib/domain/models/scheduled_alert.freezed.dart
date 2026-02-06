// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduled_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduledAlert {

 int get id;@JsonKey(name: 'customer_id') int? get customerId;// Alert details
 String get title; String? get message;@JsonKey(name: 'alert_date') DateTime get alertDate;@JsonKey(name: 'alert_time') String? get alertTime;// Repeat settings
@JsonKey(name: 'repeat_type') RepeatType get repeatType;// Status
@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_triggered') bool get isTriggered;// Related entity (for linking to specific records)
@JsonKey(name: 'related_table') String? get relatedTable;@JsonKey(name: 'related_id') int? get relatedId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ScheduledAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduledAlertCopyWith<ScheduledAlert> get copyWith => _$ScheduledAlertCopyWithImpl<ScheduledAlert>(this as ScheduledAlert, _$identity);

  /// Serializes this ScheduledAlert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduledAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.alertDate, alertDate) || other.alertDate == alertDate)&&(identical(other.alertTime, alertTime) || other.alertTime == alertTime)&&(identical(other.repeatType, repeatType) || other.repeatType == repeatType)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isTriggered, isTriggered) || other.isTriggered == isTriggered)&&(identical(other.relatedTable, relatedTable) || other.relatedTable == relatedTable)&&(identical(other.relatedId, relatedId) || other.relatedId == relatedId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,title,message,alertDate,alertTime,repeatType,isActive,isTriggered,relatedTable,relatedId,createdAt,updatedAt);

@override
String toString() {
  return 'ScheduledAlert(id: $id, customerId: $customerId, title: $title, message: $message, alertDate: $alertDate, alertTime: $alertTime, repeatType: $repeatType, isActive: $isActive, isTriggered: $isTriggered, relatedTable: $relatedTable, relatedId: $relatedId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ScheduledAlertCopyWith<$Res>  {
  factory $ScheduledAlertCopyWith(ScheduledAlert value, $Res Function(ScheduledAlert) _then) = _$ScheduledAlertCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int? customerId, String title, String? message,@JsonKey(name: 'alert_date') DateTime alertDate,@JsonKey(name: 'alert_time') String? alertTime,@JsonKey(name: 'repeat_type') RepeatType repeatType,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_triggered') bool isTriggered,@JsonKey(name: 'related_table') String? relatedTable,@JsonKey(name: 'related_id') int? relatedId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ScheduledAlertCopyWithImpl<$Res>
    implements $ScheduledAlertCopyWith<$Res> {
  _$ScheduledAlertCopyWithImpl(this._self, this._then);

  final ScheduledAlert _self;
  final $Res Function(ScheduledAlert) _then;

/// Create a copy of ScheduledAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = freezed,Object? title = null,Object? message = freezed,Object? alertDate = null,Object? alertTime = freezed,Object? repeatType = null,Object? isActive = null,Object? isTriggered = null,Object? relatedTable = freezed,Object? relatedId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,alertDate: null == alertDate ? _self.alertDate : alertDate // ignore: cast_nullable_to_non_nullable
as DateTime,alertTime: freezed == alertTime ? _self.alertTime : alertTime // ignore: cast_nullable_to_non_nullable
as String?,repeatType: null == repeatType ? _self.repeatType : repeatType // ignore: cast_nullable_to_non_nullable
as RepeatType,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isTriggered: null == isTriggered ? _self.isTriggered : isTriggered // ignore: cast_nullable_to_non_nullable
as bool,relatedTable: freezed == relatedTable ? _self.relatedTable : relatedTable // ignore: cast_nullable_to_non_nullable
as String?,relatedId: freezed == relatedId ? _self.relatedId : relatedId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduledAlert].
extension ScheduledAlertPatterns on ScheduledAlert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduledAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduledAlert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduledAlert value)  $default,){
final _that = this;
switch (_that) {
case _ScheduledAlert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduledAlert value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduledAlert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int? customerId,  String title,  String? message, @JsonKey(name: 'alert_date')  DateTime alertDate, @JsonKey(name: 'alert_time')  String? alertTime, @JsonKey(name: 'repeat_type')  RepeatType repeatType, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_triggered')  bool isTriggered, @JsonKey(name: 'related_table')  String? relatedTable, @JsonKey(name: 'related_id')  int? relatedId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduledAlert() when $default != null:
return $default(_that.id,_that.customerId,_that.title,_that.message,_that.alertDate,_that.alertTime,_that.repeatType,_that.isActive,_that.isTriggered,_that.relatedTable,_that.relatedId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int? customerId,  String title,  String? message, @JsonKey(name: 'alert_date')  DateTime alertDate, @JsonKey(name: 'alert_time')  String? alertTime, @JsonKey(name: 'repeat_type')  RepeatType repeatType, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_triggered')  bool isTriggered, @JsonKey(name: 'related_table')  String? relatedTable, @JsonKey(name: 'related_id')  int? relatedId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ScheduledAlert():
return $default(_that.id,_that.customerId,_that.title,_that.message,_that.alertDate,_that.alertTime,_that.repeatType,_that.isActive,_that.isTriggered,_that.relatedTable,_that.relatedId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int? customerId,  String title,  String? message, @JsonKey(name: 'alert_date')  DateTime alertDate, @JsonKey(name: 'alert_time')  String? alertTime, @JsonKey(name: 'repeat_type')  RepeatType repeatType, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_triggered')  bool isTriggered, @JsonKey(name: 'related_table')  String? relatedTable, @JsonKey(name: 'related_id')  int? relatedId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ScheduledAlert() when $default != null:
return $default(_that.id,_that.customerId,_that.title,_that.message,_that.alertDate,_that.alertTime,_that.repeatType,_that.isActive,_that.isTriggered,_that.relatedTable,_that.relatedId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduledAlert extends ScheduledAlert {
  const _ScheduledAlert({required this.id, @JsonKey(name: 'customer_id') this.customerId, required this.title, this.message, @JsonKey(name: 'alert_date') required this.alertDate, @JsonKey(name: 'alert_time') this.alertTime, @JsonKey(name: 'repeat_type') this.repeatType = RepeatType.once, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'is_triggered') this.isTriggered = false, @JsonKey(name: 'related_table') this.relatedTable, @JsonKey(name: 'related_id') this.relatedId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _ScheduledAlert.fromJson(Map<String, dynamic> json) => _$ScheduledAlertFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int? customerId;
// Alert details
@override final  String title;
@override final  String? message;
@override@JsonKey(name: 'alert_date') final  DateTime alertDate;
@override@JsonKey(name: 'alert_time') final  String? alertTime;
// Repeat settings
@override@JsonKey(name: 'repeat_type') final  RepeatType repeatType;
// Status
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_triggered') final  bool isTriggered;
// Related entity (for linking to specific records)
@override@JsonKey(name: 'related_table') final  String? relatedTable;
@override@JsonKey(name: 'related_id') final  int? relatedId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ScheduledAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduledAlertCopyWith<_ScheduledAlert> get copyWith => __$ScheduledAlertCopyWithImpl<_ScheduledAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduledAlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduledAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.alertDate, alertDate) || other.alertDate == alertDate)&&(identical(other.alertTime, alertTime) || other.alertTime == alertTime)&&(identical(other.repeatType, repeatType) || other.repeatType == repeatType)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isTriggered, isTriggered) || other.isTriggered == isTriggered)&&(identical(other.relatedTable, relatedTable) || other.relatedTable == relatedTable)&&(identical(other.relatedId, relatedId) || other.relatedId == relatedId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,title,message,alertDate,alertTime,repeatType,isActive,isTriggered,relatedTable,relatedId,createdAt,updatedAt);

@override
String toString() {
  return 'ScheduledAlert(id: $id, customerId: $customerId, title: $title, message: $message, alertDate: $alertDate, alertTime: $alertTime, repeatType: $repeatType, isActive: $isActive, isTriggered: $isTriggered, relatedTable: $relatedTable, relatedId: $relatedId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ScheduledAlertCopyWith<$Res> implements $ScheduledAlertCopyWith<$Res> {
  factory _$ScheduledAlertCopyWith(_ScheduledAlert value, $Res Function(_ScheduledAlert) _then) = __$ScheduledAlertCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int? customerId, String title, String? message,@JsonKey(name: 'alert_date') DateTime alertDate,@JsonKey(name: 'alert_time') String? alertTime,@JsonKey(name: 'repeat_type') RepeatType repeatType,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_triggered') bool isTriggered,@JsonKey(name: 'related_table') String? relatedTable,@JsonKey(name: 'related_id') int? relatedId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ScheduledAlertCopyWithImpl<$Res>
    implements _$ScheduledAlertCopyWith<$Res> {
  __$ScheduledAlertCopyWithImpl(this._self, this._then);

  final _ScheduledAlert _self;
  final $Res Function(_ScheduledAlert) _then;

/// Create a copy of ScheduledAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = freezed,Object? title = null,Object? message = freezed,Object? alertDate = null,Object? alertTime = freezed,Object? repeatType = null,Object? isActive = null,Object? isTriggered = null,Object? relatedTable = freezed,Object? relatedId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ScheduledAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,alertDate: null == alertDate ? _self.alertDate : alertDate // ignore: cast_nullable_to_non_nullable
as DateTime,alertTime: freezed == alertTime ? _self.alertTime : alertTime // ignore: cast_nullable_to_non_nullable
as String?,repeatType: null == repeatType ? _self.repeatType : repeatType // ignore: cast_nullable_to_non_nullable
as RepeatType,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isTriggered: null == isTriggered ? _self.isTriggered : isTriggered // ignore: cast_nullable_to_non_nullable
as bool,relatedTable: freezed == relatedTable ? _self.relatedTable : relatedTable // ignore: cast_nullable_to_non_nullable
as String?,relatedId: freezed == relatedId ? _self.relatedId : relatedId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
