// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Customer {

 int get id;@JsonKey(name: 'customer_name') String get customerName;@JsonKey(name: 'owner_name') String? get ownerName; String? get phone;@JsonKey(name: 'plot_number') String? get plotNumber;@JsonKey(name: 'project_number') String? get projectNumber; String? get username; String? get password;@JsonKey(name: 'current_stage') String? get currentStage; String? get notes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.plotNumber, plotNumber) || other.plotNumber == plotNumber)&&(identical(other.projectNumber, projectNumber) || other.projectNumber == projectNumber)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,ownerName,phone,plotNumber,projectNumber,username,password,currentStage,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Customer(id: $id, customerName: $customerName, ownerName: $ownerName, phone: $phone, plotNumber: $plotNumber, projectNumber: $projectNumber, username: $username, password: $password, currentStage: $currentStage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'owner_name') String? ownerName, String? phone,@JsonKey(name: 'plot_number') String? plotNumber,@JsonKey(name: 'project_number') String? projectNumber, String? username, String? password,@JsonKey(name: 'current_stage') String? currentStage, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$CustomerCopyWithImpl<$Res>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._self, this._then);

  final Customer _self;
  final $Res Function(Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerName = null,Object? ownerName = freezed,Object? phone = freezed,Object? plotNumber = freezed,Object? projectNumber = freezed,Object? username = freezed,Object? password = freezed,Object? currentStage = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,plotNumber: freezed == plotNumber ? _self.plotNumber : plotNumber // ignore: cast_nullable_to_non_nullable
as String?,projectNumber: freezed == projectNumber ? _self.projectNumber : projectNumber // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,currentStage: freezed == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Customer].
extension CustomerPatterns on Customer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Customer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Customer value)  $default,){
final _that = this;
switch (_that) {
case _Customer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Customer value)?  $default,){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'owner_name')  String? ownerName,  String? phone, @JsonKey(name: 'plot_number')  String? plotNumber, @JsonKey(name: 'project_number')  String? projectNumber,  String? username,  String? password, @JsonKey(name: 'current_stage')  String? currentStage,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.customerName,_that.ownerName,_that.phone,_that.plotNumber,_that.projectNumber,_that.username,_that.password,_that.currentStage,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'owner_name')  String? ownerName,  String? phone, @JsonKey(name: 'plot_number')  String? plotNumber, @JsonKey(name: 'project_number')  String? projectNumber,  String? username,  String? password, @JsonKey(name: 'current_stage')  String? currentStage,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.customerName,_that.ownerName,_that.phone,_that.plotNumber,_that.projectNumber,_that.username,_that.password,_that.currentStage,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_name')  String customerName, @JsonKey(name: 'owner_name')  String? ownerName,  String? phone, @JsonKey(name: 'plot_number')  String? plotNumber, @JsonKey(name: 'project_number')  String? projectNumber,  String? username,  String? password, @JsonKey(name: 'current_stage')  String? currentStage,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.customerName,_that.ownerName,_that.phone,_that.plotNumber,_that.projectNumber,_that.username,_that.password,_that.currentStage,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer implements Customer {
  const _Customer({required this.id, @JsonKey(name: 'customer_name') required this.customerName, @JsonKey(name: 'owner_name') this.ownerName, this.phone, @JsonKey(name: 'plot_number') this.plotNumber, @JsonKey(name: 'project_number') this.projectNumber, this.username, this.password, @JsonKey(name: 'current_stage') this.currentStage, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_name') final  String customerName;
@override@JsonKey(name: 'owner_name') final  String? ownerName;
@override final  String? phone;
@override@JsonKey(name: 'plot_number') final  String? plotNumber;
@override@JsonKey(name: 'project_number') final  String? projectNumber;
@override final  String? username;
@override final  String? password;
@override@JsonKey(name: 'current_stage') final  String? currentStage;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCopyWith<_Customer> get copyWith => __$CustomerCopyWithImpl<_Customer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.plotNumber, plotNumber) || other.plotNumber == plotNumber)&&(identical(other.projectNumber, projectNumber) || other.projectNumber == projectNumber)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,ownerName,phone,plotNumber,projectNumber,username,password,currentStage,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Customer(id: $id, customerName: $customerName, ownerName: $ownerName, phone: $phone, plotNumber: $plotNumber, projectNumber: $projectNumber, username: $username, password: $password, currentStage: $currentStage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_name') String customerName,@JsonKey(name: 'owner_name') String? ownerName, String? phone,@JsonKey(name: 'plot_number') String? plotNumber,@JsonKey(name: 'project_number') String? projectNumber, String? username, String? password,@JsonKey(name: 'current_stage') String? currentStage, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$CustomerCopyWithImpl<$Res>
    implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(this._self, this._then);

  final _Customer _self;
  final $Res Function(_Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerName = null,Object? ownerName = freezed,Object? phone = freezed,Object? plotNumber = freezed,Object? projectNumber = freezed,Object? username = freezed,Object? password = freezed,Object? currentStage = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,plotNumber: freezed == plotNumber ? _self.plotNumber : plotNumber // ignore: cast_nullable_to_non_nullable
as String?,projectNumber: freezed == projectNumber ? _self.projectNumber : projectNumber // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,currentStage: freezed == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
