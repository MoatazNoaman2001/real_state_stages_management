// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supervision_certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupervisionCertificate {

 int get id;@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'engineer_name') String? get engineerName;@JsonKey(name: 'certificate_date') DateTime? get certificateDate;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of SupervisionCertificate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupervisionCertificateCopyWith<SupervisionCertificate> get copyWith => _$SupervisionCertificateCopyWithImpl<SupervisionCertificate>(this as SupervisionCertificate, _$identity);

  /// Serializes this SupervisionCertificate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupervisionCertificate&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.engineerName, engineerName) || other.engineerName == engineerName)&&(identical(other.certificateDate, certificateDate) || other.certificateDate == certificateDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,engineerName,certificateDate,createdAt,updatedAt);

@override
String toString() {
  return 'SupervisionCertificate(id: $id, customerId: $customerId, engineerName: $engineerName, certificateDate: $certificateDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SupervisionCertificateCopyWith<$Res>  {
  factory $SupervisionCertificateCopyWith(SupervisionCertificate value, $Res Function(SupervisionCertificate) _then) = _$SupervisionCertificateCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'engineer_name') String? engineerName,@JsonKey(name: 'certificate_date') DateTime? certificateDate,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$SupervisionCertificateCopyWithImpl<$Res>
    implements $SupervisionCertificateCopyWith<$Res> {
  _$SupervisionCertificateCopyWithImpl(this._self, this._then);

  final SupervisionCertificate _self;
  final $Res Function(SupervisionCertificate) _then;

/// Create a copy of SupervisionCertificate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? engineerName = freezed,Object? certificateDate = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,engineerName: freezed == engineerName ? _self.engineerName : engineerName // ignore: cast_nullable_to_non_nullable
as String?,certificateDate: freezed == certificateDate ? _self.certificateDate : certificateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SupervisionCertificate].
extension SupervisionCertificatePatterns on SupervisionCertificate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupervisionCertificate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupervisionCertificate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupervisionCertificate value)  $default,){
final _that = this;
switch (_that) {
case _SupervisionCertificate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupervisionCertificate value)?  $default,){
final _that = this;
switch (_that) {
case _SupervisionCertificate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'engineer_name')  String? engineerName, @JsonKey(name: 'certificate_date')  DateTime? certificateDate, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupervisionCertificate() when $default != null:
return $default(_that.id,_that.customerId,_that.engineerName,_that.certificateDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'engineer_name')  String? engineerName, @JsonKey(name: 'certificate_date')  DateTime? certificateDate, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SupervisionCertificate():
return $default(_that.id,_that.customerId,_that.engineerName,_that.certificateDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'engineer_name')  String? engineerName, @JsonKey(name: 'certificate_date')  DateTime? certificateDate, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SupervisionCertificate() when $default != null:
return $default(_that.id,_that.customerId,_that.engineerName,_that.certificateDate,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupervisionCertificate implements SupervisionCertificate {
  const _SupervisionCertificate({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'engineer_name') this.engineerName, @JsonKey(name: 'certificate_date') this.certificateDate, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _SupervisionCertificate.fromJson(Map<String, dynamic> json) => _$SupervisionCertificateFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
@override@JsonKey(name: 'engineer_name') final  String? engineerName;
@override@JsonKey(name: 'certificate_date') final  DateTime? certificateDate;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of SupervisionCertificate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupervisionCertificateCopyWith<_SupervisionCertificate> get copyWith => __$SupervisionCertificateCopyWithImpl<_SupervisionCertificate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupervisionCertificateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupervisionCertificate&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.engineerName, engineerName) || other.engineerName == engineerName)&&(identical(other.certificateDate, certificateDate) || other.certificateDate == certificateDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,engineerName,certificateDate,createdAt,updatedAt);

@override
String toString() {
  return 'SupervisionCertificate(id: $id, customerId: $customerId, engineerName: $engineerName, certificateDate: $certificateDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SupervisionCertificateCopyWith<$Res> implements $SupervisionCertificateCopyWith<$Res> {
  factory _$SupervisionCertificateCopyWith(_SupervisionCertificate value, $Res Function(_SupervisionCertificate) _then) = __$SupervisionCertificateCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'engineer_name') String? engineerName,@JsonKey(name: 'certificate_date') DateTime? certificateDate,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$SupervisionCertificateCopyWithImpl<$Res>
    implements _$SupervisionCertificateCopyWith<$Res> {
  __$SupervisionCertificateCopyWithImpl(this._self, this._then);

  final _SupervisionCertificate _self;
  final $Res Function(_SupervisionCertificate) _then;

/// Create a copy of SupervisionCertificate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? engineerName = freezed,Object? certificateDate = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SupervisionCertificate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,engineerName: freezed == engineerName ? _self.engineerName : engineerName // ignore: cast_nullable_to_non_nullable
as String?,certificateDate: freezed == certificateDate ? _self.certificateDate : certificateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
