// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoadWork {

 int get id;@JsonKey(name: 'customer_id') int get customerId;// Step 1: تقديم الطلب
@JsonKey(name: 'submit_request') bool get submitRequest;@JsonKey(name: 'submit_request_date') DateTime? get submitRequestDate;@JsonKey(name: 'submit_request_notes') String? get submitRequestNotes;// Step 2: التوريد (has money field)
@JsonKey(name: 'supply') bool get supply;@JsonKey(name: 'supply_date') DateTime? get supplyDate;@JsonKey(name: 'supply_notes') String? get supplyNotes;@JsonKey(name: 'supply_amount') double? get supplyAmount;// Monthly renewal alert
@JsonKey(name: 'renewal_date') DateTime? get renewalDate;@JsonKey(name: 'renewal_alert_enabled') bool get renewalAlertEnabled;// General stage notes
@JsonKey(name: 'stage_notes') String? get stageNotes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of RoadWork
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadWorkCopyWith<RoadWork> get copyWith => _$RoadWorkCopyWithImpl<RoadWork>(this as RoadWork, _$identity);

  /// Serializes this RoadWork to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadWork&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.submitRequest, submitRequest) || other.submitRequest == submitRequest)&&(identical(other.submitRequestDate, submitRequestDate) || other.submitRequestDate == submitRequestDate)&&(identical(other.submitRequestNotes, submitRequestNotes) || other.submitRequestNotes == submitRequestNotes)&&(identical(other.supply, supply) || other.supply == supply)&&(identical(other.supplyDate, supplyDate) || other.supplyDate == supplyDate)&&(identical(other.supplyNotes, supplyNotes) || other.supplyNotes == supplyNotes)&&(identical(other.supplyAmount, supplyAmount) || other.supplyAmount == supplyAmount)&&(identical(other.renewalDate, renewalDate) || other.renewalDate == renewalDate)&&(identical(other.renewalAlertEnabled, renewalAlertEnabled) || other.renewalAlertEnabled == renewalAlertEnabled)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,submitRequest,submitRequestDate,submitRequestNotes,supply,supplyDate,supplyNotes,supplyAmount,renewalDate,renewalAlertEnabled,stageNotes,createdAt,updatedAt);

@override
String toString() {
  return 'RoadWork(id: $id, customerId: $customerId, submitRequest: $submitRequest, submitRequestDate: $submitRequestDate, submitRequestNotes: $submitRequestNotes, supply: $supply, supplyDate: $supplyDate, supplyNotes: $supplyNotes, supplyAmount: $supplyAmount, renewalDate: $renewalDate, renewalAlertEnabled: $renewalAlertEnabled, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RoadWorkCopyWith<$Res>  {
  factory $RoadWorkCopyWith(RoadWork value, $Res Function(RoadWork) _then) = _$RoadWorkCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'submit_request') bool submitRequest,@JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,@JsonKey(name: 'submit_request_notes') String? submitRequestNotes,@JsonKey(name: 'supply') bool supply,@JsonKey(name: 'supply_date') DateTime? supplyDate,@JsonKey(name: 'supply_notes') String? supplyNotes,@JsonKey(name: 'supply_amount') double? supplyAmount,@JsonKey(name: 'renewal_date') DateTime? renewalDate,@JsonKey(name: 'renewal_alert_enabled') bool renewalAlertEnabled,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$RoadWorkCopyWithImpl<$Res>
    implements $RoadWorkCopyWith<$Res> {
  _$RoadWorkCopyWithImpl(this._self, this._then);

  final RoadWork _self;
  final $Res Function(RoadWork) _then;

/// Create a copy of RoadWork
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? submitRequest = null,Object? submitRequestDate = freezed,Object? submitRequestNotes = freezed,Object? supply = null,Object? supplyDate = freezed,Object? supplyNotes = freezed,Object? supplyAmount = freezed,Object? renewalDate = freezed,Object? renewalAlertEnabled = null,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,submitRequest: null == submitRequest ? _self.submitRequest : submitRequest // ignore: cast_nullable_to_non_nullable
as bool,submitRequestDate: freezed == submitRequestDate ? _self.submitRequestDate : submitRequestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitRequestNotes: freezed == submitRequestNotes ? _self.submitRequestNotes : submitRequestNotes // ignore: cast_nullable_to_non_nullable
as String?,supply: null == supply ? _self.supply : supply // ignore: cast_nullable_to_non_nullable
as bool,supplyDate: freezed == supplyDate ? _self.supplyDate : supplyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyNotes: freezed == supplyNotes ? _self.supplyNotes : supplyNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount: freezed == supplyAmount ? _self.supplyAmount : supplyAmount // ignore: cast_nullable_to_non_nullable
as double?,renewalDate: freezed == renewalDate ? _self.renewalDate : renewalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,renewalAlertEnabled: null == renewalAlertEnabled ? _self.renewalAlertEnabled : renewalAlertEnabled // ignore: cast_nullable_to_non_nullable
as bool,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RoadWork].
extension RoadWorkPatterns on RoadWork {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadWork value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadWork() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadWork value)  $default,){
final _that = this;
switch (_that) {
case _RoadWork():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadWork value)?  $default,){
final _that = this;
switch (_that) {
case _RoadWork() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'supply')  bool supply, @JsonKey(name: 'supply_date')  DateTime? supplyDate, @JsonKey(name: 'supply_notes')  String? supplyNotes, @JsonKey(name: 'supply_amount')  double? supplyAmount, @JsonKey(name: 'renewal_date')  DateTime? renewalDate, @JsonKey(name: 'renewal_alert_enabled')  bool renewalAlertEnabled, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadWork() when $default != null:
return $default(_that.id,_that.customerId,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.supply,_that.supplyDate,_that.supplyNotes,_that.supplyAmount,_that.renewalDate,_that.renewalAlertEnabled,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'supply')  bool supply, @JsonKey(name: 'supply_date')  DateTime? supplyDate, @JsonKey(name: 'supply_notes')  String? supplyNotes, @JsonKey(name: 'supply_amount')  double? supplyAmount, @JsonKey(name: 'renewal_date')  DateTime? renewalDate, @JsonKey(name: 'renewal_alert_enabled')  bool renewalAlertEnabled, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RoadWork():
return $default(_that.id,_that.customerId,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.supply,_that.supplyDate,_that.supplyNotes,_that.supplyAmount,_that.renewalDate,_that.renewalAlertEnabled,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'supply')  bool supply, @JsonKey(name: 'supply_date')  DateTime? supplyDate, @JsonKey(name: 'supply_notes')  String? supplyNotes, @JsonKey(name: 'supply_amount')  double? supplyAmount, @JsonKey(name: 'renewal_date')  DateTime? renewalDate, @JsonKey(name: 'renewal_alert_enabled')  bool renewalAlertEnabled, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RoadWork() when $default != null:
return $default(_that.id,_that.customerId,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.supply,_that.supplyDate,_that.supplyNotes,_that.supplyAmount,_that.renewalDate,_that.renewalAlertEnabled,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadWork extends RoadWork {
  const _RoadWork({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'submit_request') this.submitRequest = false, @JsonKey(name: 'submit_request_date') this.submitRequestDate, @JsonKey(name: 'submit_request_notes') this.submitRequestNotes, @JsonKey(name: 'supply') this.supply = false, @JsonKey(name: 'supply_date') this.supplyDate, @JsonKey(name: 'supply_notes') this.supplyNotes, @JsonKey(name: 'supply_amount') this.supplyAmount, @JsonKey(name: 'renewal_date') this.renewalDate, @JsonKey(name: 'renewal_alert_enabled') this.renewalAlertEnabled = false, @JsonKey(name: 'stage_notes') this.stageNotes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _RoadWork.fromJson(Map<String, dynamic> json) => _$RoadWorkFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
// Step 1: تقديم الطلب
@override@JsonKey(name: 'submit_request') final  bool submitRequest;
@override@JsonKey(name: 'submit_request_date') final  DateTime? submitRequestDate;
@override@JsonKey(name: 'submit_request_notes') final  String? submitRequestNotes;
// Step 2: التوريد (has money field)
@override@JsonKey(name: 'supply') final  bool supply;
@override@JsonKey(name: 'supply_date') final  DateTime? supplyDate;
@override@JsonKey(name: 'supply_notes') final  String? supplyNotes;
@override@JsonKey(name: 'supply_amount') final  double? supplyAmount;
// Monthly renewal alert
@override@JsonKey(name: 'renewal_date') final  DateTime? renewalDate;
@override@JsonKey(name: 'renewal_alert_enabled') final  bool renewalAlertEnabled;
// General stage notes
@override@JsonKey(name: 'stage_notes') final  String? stageNotes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of RoadWork
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadWorkCopyWith<_RoadWork> get copyWith => __$RoadWorkCopyWithImpl<_RoadWork>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadWorkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadWork&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.submitRequest, submitRequest) || other.submitRequest == submitRequest)&&(identical(other.submitRequestDate, submitRequestDate) || other.submitRequestDate == submitRequestDate)&&(identical(other.submitRequestNotes, submitRequestNotes) || other.submitRequestNotes == submitRequestNotes)&&(identical(other.supply, supply) || other.supply == supply)&&(identical(other.supplyDate, supplyDate) || other.supplyDate == supplyDate)&&(identical(other.supplyNotes, supplyNotes) || other.supplyNotes == supplyNotes)&&(identical(other.supplyAmount, supplyAmount) || other.supplyAmount == supplyAmount)&&(identical(other.renewalDate, renewalDate) || other.renewalDate == renewalDate)&&(identical(other.renewalAlertEnabled, renewalAlertEnabled) || other.renewalAlertEnabled == renewalAlertEnabled)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,submitRequest,submitRequestDate,submitRequestNotes,supply,supplyDate,supplyNotes,supplyAmount,renewalDate,renewalAlertEnabled,stageNotes,createdAt,updatedAt);

@override
String toString() {
  return 'RoadWork(id: $id, customerId: $customerId, submitRequest: $submitRequest, submitRequestDate: $submitRequestDate, submitRequestNotes: $submitRequestNotes, supply: $supply, supplyDate: $supplyDate, supplyNotes: $supplyNotes, supplyAmount: $supplyAmount, renewalDate: $renewalDate, renewalAlertEnabled: $renewalAlertEnabled, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RoadWorkCopyWith<$Res> implements $RoadWorkCopyWith<$Res> {
  factory _$RoadWorkCopyWith(_RoadWork value, $Res Function(_RoadWork) _then) = __$RoadWorkCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'submit_request') bool submitRequest,@JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,@JsonKey(name: 'submit_request_notes') String? submitRequestNotes,@JsonKey(name: 'supply') bool supply,@JsonKey(name: 'supply_date') DateTime? supplyDate,@JsonKey(name: 'supply_notes') String? supplyNotes,@JsonKey(name: 'supply_amount') double? supplyAmount,@JsonKey(name: 'renewal_date') DateTime? renewalDate,@JsonKey(name: 'renewal_alert_enabled') bool renewalAlertEnabled,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$RoadWorkCopyWithImpl<$Res>
    implements _$RoadWorkCopyWith<$Res> {
  __$RoadWorkCopyWithImpl(this._self, this._then);

  final _RoadWork _self;
  final $Res Function(_RoadWork) _then;

/// Create a copy of RoadWork
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? submitRequest = null,Object? submitRequestDate = freezed,Object? submitRequestNotes = freezed,Object? supply = null,Object? supplyDate = freezed,Object? supplyNotes = freezed,Object? supplyAmount = freezed,Object? renewalDate = freezed,Object? renewalAlertEnabled = null,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RoadWork(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,submitRequest: null == submitRequest ? _self.submitRequest : submitRequest // ignore: cast_nullable_to_non_nullable
as bool,submitRequestDate: freezed == submitRequestDate ? _self.submitRequestDate : submitRequestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitRequestNotes: freezed == submitRequestNotes ? _self.submitRequestNotes : submitRequestNotes // ignore: cast_nullable_to_non_nullable
as String?,supply: null == supply ? _self.supply : supply // ignore: cast_nullable_to_non_nullable
as bool,supplyDate: freezed == supplyDate ? _self.supplyDate : supplyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyNotes: freezed == supplyNotes ? _self.supplyNotes : supplyNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount: freezed == supplyAmount ? _self.supplyAmount : supplyAmount // ignore: cast_nullable_to_non_nullable
as double?,renewalDate: freezed == renewalDate ? _self.renewalDate : renewalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,renewalAlertEnabled: null == renewalAlertEnabled ? _self.renewalAlertEnabled : renewalAlertEnabled // ignore: cast_nullable_to_non_nullable
as bool,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
