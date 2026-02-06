// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utility_meter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UtilityMeter {

 int get id;@JsonKey(name: 'customer_id') int get customerId;// Step 1: استلام الأوراق
@JsonKey(name: 'receive_documents') bool get receiveDocuments;@JsonKey(name: 'receive_documents_date') DateTime? get receiveDocumentsDate;@JsonKey(name: 'receive_documents_notes') String? get receiveDocumentsNotes;// Step 2: التوكيل
 bool get authorization_var;@JsonKey(name: 'authorization_var_date') DateTime? get authorizationDate;@JsonKey(name: 'authorization_var_notes') String? get authorizationNotes;// Step 3: التقديم علي العداد
@JsonKey(name: 'apply_for_meter') bool get applyForMeter;@JsonKey(name: 'apply_for_meter_date') DateTime? get applyForMeterDate;@JsonKey(name: 'apply_for_meter_notes') String? get applyForMeterNotes;// Step 4: تحديد ميعاد المعاينة (has money field)
@JsonKey(name: 'inspection_date') DateTime? get inspectionDate;@JsonKey(name: 'inspection_amount') double? get inspectionAmount;@JsonKey(name: 'inspection_notes') String? get inspectionNotes;// Step 5: طباعة الجوابات (NEW)
@JsonKey(name: 'print_letters') bool get printLetters;@JsonKey(name: 'print_letters_date') DateTime? get printLettersDate;@JsonKey(name: 'print_letters_notes') String? get printLettersNotes;// Step 6: التوريد علي العداد (4 money fields)
@JsonKey(name: 'supply_to_meter') bool get supplyToMeter;@JsonKey(name: 'supply_to_meter_date') DateTime? get supplyToMeterDate;@JsonKey(name: 'supply_to_meter_notes') String? get supplyToMeterNotes;@JsonKey(name: 'supply_amount_1') double? get supplyAmount1;@JsonKey(name: 'supply_amount_2') double? get supplyAmount2;@JsonKey(name: 'supply_amount_3') double? get supplyAmount3;@JsonKey(name: 'supply_amount_4') double? get supplyAmount4;// Step 7: التعاقد علي العداد
@JsonKey(name: 'contract_meter') bool get contractMeter;@JsonKey(name: 'contract_meter_date') DateTime? get contractMeterDate;@JsonKey(name: 'contract_meter_notes') String? get contractMeterNotes;// Step 8: استلام العداد
@JsonKey(name: 'receive_meter') bool get receiveMeter;@JsonKey(name: 'receive_meter_date') DateTime? get receiveMeterDate;@JsonKey(name: 'receive_meter_notes') String? get receiveMeterNotes;// General stage notes
@JsonKey(name: 'stage_notes') String? get stageNotes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of UtilityMeter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtilityMeterCopyWith<UtilityMeter> get copyWith => _$UtilityMeterCopyWithImpl<UtilityMeter>(this as UtilityMeter, _$identity);

  /// Serializes this UtilityMeter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UtilityMeter&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.receiveDocuments, receiveDocuments) || other.receiveDocuments == receiveDocuments)&&(identical(other.receiveDocumentsDate, receiveDocumentsDate) || other.receiveDocumentsDate == receiveDocumentsDate)&&(identical(other.receiveDocumentsNotes, receiveDocumentsNotes) || other.receiveDocumentsNotes == receiveDocumentsNotes)&&(identical(other.authorization_var, authorization_var) || other.authorization_var == authorization_var)&&(identical(other.authorizationDate, authorizationDate) || other.authorizationDate == authorizationDate)&&(identical(other.authorizationNotes, authorizationNotes) || other.authorizationNotes == authorizationNotes)&&(identical(other.applyForMeter, applyForMeter) || other.applyForMeter == applyForMeter)&&(identical(other.applyForMeterDate, applyForMeterDate) || other.applyForMeterDate == applyForMeterDate)&&(identical(other.applyForMeterNotes, applyForMeterNotes) || other.applyForMeterNotes == applyForMeterNotes)&&(identical(other.inspectionDate, inspectionDate) || other.inspectionDate == inspectionDate)&&(identical(other.inspectionAmount, inspectionAmount) || other.inspectionAmount == inspectionAmount)&&(identical(other.inspectionNotes, inspectionNotes) || other.inspectionNotes == inspectionNotes)&&(identical(other.printLetters, printLetters) || other.printLetters == printLetters)&&(identical(other.printLettersDate, printLettersDate) || other.printLettersDate == printLettersDate)&&(identical(other.printLettersNotes, printLettersNotes) || other.printLettersNotes == printLettersNotes)&&(identical(other.supplyToMeter, supplyToMeter) || other.supplyToMeter == supplyToMeter)&&(identical(other.supplyToMeterDate, supplyToMeterDate) || other.supplyToMeterDate == supplyToMeterDate)&&(identical(other.supplyToMeterNotes, supplyToMeterNotes) || other.supplyToMeterNotes == supplyToMeterNotes)&&(identical(other.supplyAmount1, supplyAmount1) || other.supplyAmount1 == supplyAmount1)&&(identical(other.supplyAmount2, supplyAmount2) || other.supplyAmount2 == supplyAmount2)&&(identical(other.supplyAmount3, supplyAmount3) || other.supplyAmount3 == supplyAmount3)&&(identical(other.supplyAmount4, supplyAmount4) || other.supplyAmount4 == supplyAmount4)&&(identical(other.contractMeter, contractMeter) || other.contractMeter == contractMeter)&&(identical(other.contractMeterDate, contractMeterDate) || other.contractMeterDate == contractMeterDate)&&(identical(other.contractMeterNotes, contractMeterNotes) || other.contractMeterNotes == contractMeterNotes)&&(identical(other.receiveMeter, receiveMeter) || other.receiveMeter == receiveMeter)&&(identical(other.receiveMeterDate, receiveMeterDate) || other.receiveMeterDate == receiveMeterDate)&&(identical(other.receiveMeterNotes, receiveMeterNotes) || other.receiveMeterNotes == receiveMeterNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,receiveDocuments,receiveDocumentsDate,receiveDocumentsNotes,authorization_var,authorizationDate,authorizationNotes,applyForMeter,applyForMeterDate,applyForMeterNotes,inspectionDate,inspectionAmount,inspectionNotes,printLetters,printLettersDate,printLettersNotes,supplyToMeter,supplyToMeterDate,supplyToMeterNotes,supplyAmount1,supplyAmount2,supplyAmount3,supplyAmount4,contractMeter,contractMeterDate,contractMeterNotes,receiveMeter,receiveMeterDate,receiveMeterNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'UtilityMeter(id: $id, customerId: $customerId, receiveDocuments: $receiveDocuments, receiveDocumentsDate: $receiveDocumentsDate, receiveDocumentsNotes: $receiveDocumentsNotes, authorization_var: $authorization_var, authorizationDate: $authorizationDate, authorizationNotes: $authorizationNotes, applyForMeter: $applyForMeter, applyForMeterDate: $applyForMeterDate, applyForMeterNotes: $applyForMeterNotes, inspectionDate: $inspectionDate, inspectionAmount: $inspectionAmount, inspectionNotes: $inspectionNotes, printLetters: $printLetters, printLettersDate: $printLettersDate, printLettersNotes: $printLettersNotes, supplyToMeter: $supplyToMeter, supplyToMeterDate: $supplyToMeterDate, supplyToMeterNotes: $supplyToMeterNotes, supplyAmount1: $supplyAmount1, supplyAmount2: $supplyAmount2, supplyAmount3: $supplyAmount3, supplyAmount4: $supplyAmount4, contractMeter: $contractMeter, contractMeterDate: $contractMeterDate, contractMeterNotes: $contractMeterNotes, receiveMeter: $receiveMeter, receiveMeterDate: $receiveMeterDate, receiveMeterNotes: $receiveMeterNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UtilityMeterCopyWith<$Res>  {
  factory $UtilityMeterCopyWith(UtilityMeter value, $Res Function(UtilityMeter) _then) = _$UtilityMeterCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'receive_documents') bool receiveDocuments,@JsonKey(name: 'receive_documents_date') DateTime? receiveDocumentsDate,@JsonKey(name: 'receive_documents_notes') String? receiveDocumentsNotes, bool authorization_var,@JsonKey(name: 'authorization_var_date') DateTime? authorizationDate,@JsonKey(name: 'authorization_var_notes') String? authorizationNotes,@JsonKey(name: 'apply_for_meter') bool applyForMeter,@JsonKey(name: 'apply_for_meter_date') DateTime? applyForMeterDate,@JsonKey(name: 'apply_for_meter_notes') String? applyForMeterNotes,@JsonKey(name: 'inspection_date') DateTime? inspectionDate,@JsonKey(name: 'inspection_amount') double? inspectionAmount,@JsonKey(name: 'inspection_notes') String? inspectionNotes,@JsonKey(name: 'print_letters') bool printLetters,@JsonKey(name: 'print_letters_date') DateTime? printLettersDate,@JsonKey(name: 'print_letters_notes') String? printLettersNotes,@JsonKey(name: 'supply_to_meter') bool supplyToMeter,@JsonKey(name: 'supply_to_meter_date') DateTime? supplyToMeterDate,@JsonKey(name: 'supply_to_meter_notes') String? supplyToMeterNotes,@JsonKey(name: 'supply_amount_1') double? supplyAmount1,@JsonKey(name: 'supply_amount_2') double? supplyAmount2,@JsonKey(name: 'supply_amount_3') double? supplyAmount3,@JsonKey(name: 'supply_amount_4') double? supplyAmount4,@JsonKey(name: 'contract_meter') bool contractMeter,@JsonKey(name: 'contract_meter_date') DateTime? contractMeterDate,@JsonKey(name: 'contract_meter_notes') String? contractMeterNotes,@JsonKey(name: 'receive_meter') bool receiveMeter,@JsonKey(name: 'receive_meter_date') DateTime? receiveMeterDate,@JsonKey(name: 'receive_meter_notes') String? receiveMeterNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$UtilityMeterCopyWithImpl<$Res>
    implements $UtilityMeterCopyWith<$Res> {
  _$UtilityMeterCopyWithImpl(this._self, this._then);

  final UtilityMeter _self;
  final $Res Function(UtilityMeter) _then;

/// Create a copy of UtilityMeter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? receiveDocuments = null,Object? receiveDocumentsDate = freezed,Object? receiveDocumentsNotes = freezed,Object? authorization_var = null,Object? authorizationDate = freezed,Object? authorizationNotes = freezed,Object? applyForMeter = null,Object? applyForMeterDate = freezed,Object? applyForMeterNotes = freezed,Object? inspectionDate = freezed,Object? inspectionAmount = freezed,Object? inspectionNotes = freezed,Object? printLetters = null,Object? printLettersDate = freezed,Object? printLettersNotes = freezed,Object? supplyToMeter = null,Object? supplyToMeterDate = freezed,Object? supplyToMeterNotes = freezed,Object? supplyAmount1 = freezed,Object? supplyAmount2 = freezed,Object? supplyAmount3 = freezed,Object? supplyAmount4 = freezed,Object? contractMeter = null,Object? contractMeterDate = freezed,Object? contractMeterNotes = freezed,Object? receiveMeter = null,Object? receiveMeterDate = freezed,Object? receiveMeterNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,receiveDocuments: null == receiveDocuments ? _self.receiveDocuments : receiveDocuments // ignore: cast_nullable_to_non_nullable
as bool,receiveDocumentsDate: freezed == receiveDocumentsDate ? _self.receiveDocumentsDate : receiveDocumentsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveDocumentsNotes: freezed == receiveDocumentsNotes ? _self.receiveDocumentsNotes : receiveDocumentsNotes // ignore: cast_nullable_to_non_nullable
as String?,authorization_var: null == authorization_var ? _self.authorization_var : authorization_var // ignore: cast_nullable_to_non_nullable
as bool,authorizationDate: freezed == authorizationDate ? _self.authorizationDate : authorizationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,authorizationNotes: freezed == authorizationNotes ? _self.authorizationNotes : authorizationNotes // ignore: cast_nullable_to_non_nullable
as String?,applyForMeter: null == applyForMeter ? _self.applyForMeter : applyForMeter // ignore: cast_nullable_to_non_nullable
as bool,applyForMeterDate: freezed == applyForMeterDate ? _self.applyForMeterDate : applyForMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applyForMeterNotes: freezed == applyForMeterNotes ? _self.applyForMeterNotes : applyForMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionDate: freezed == inspectionDate ? _self.inspectionDate : inspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionAmount: freezed == inspectionAmount ? _self.inspectionAmount : inspectionAmount // ignore: cast_nullable_to_non_nullable
as double?,inspectionNotes: freezed == inspectionNotes ? _self.inspectionNotes : inspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,printLetters: null == printLetters ? _self.printLetters : printLetters // ignore: cast_nullable_to_non_nullable
as bool,printLettersDate: freezed == printLettersDate ? _self.printLettersDate : printLettersDate // ignore: cast_nullable_to_non_nullable
as DateTime?,printLettersNotes: freezed == printLettersNotes ? _self.printLettersNotes : printLettersNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyToMeter: null == supplyToMeter ? _self.supplyToMeter : supplyToMeter // ignore: cast_nullable_to_non_nullable
as bool,supplyToMeterDate: freezed == supplyToMeterDate ? _self.supplyToMeterDate : supplyToMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyToMeterNotes: freezed == supplyToMeterNotes ? _self.supplyToMeterNotes : supplyToMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount1: freezed == supplyAmount1 ? _self.supplyAmount1 : supplyAmount1 // ignore: cast_nullable_to_non_nullable
as double?,supplyAmount2: freezed == supplyAmount2 ? _self.supplyAmount2 : supplyAmount2 // ignore: cast_nullable_to_non_nullable
as double?,supplyAmount3: freezed == supplyAmount3 ? _self.supplyAmount3 : supplyAmount3 // ignore: cast_nullable_to_non_nullable
as double?,supplyAmount4: freezed == supplyAmount4 ? _self.supplyAmount4 : supplyAmount4 // ignore: cast_nullable_to_non_nullable
as double?,contractMeter: null == contractMeter ? _self.contractMeter : contractMeter // ignore: cast_nullable_to_non_nullable
as bool,contractMeterDate: freezed == contractMeterDate ? _self.contractMeterDate : contractMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,contractMeterNotes: freezed == contractMeterNotes ? _self.contractMeterNotes : contractMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,receiveMeter: null == receiveMeter ? _self.receiveMeter : receiveMeter // ignore: cast_nullable_to_non_nullable
as bool,receiveMeterDate: freezed == receiveMeterDate ? _self.receiveMeterDate : receiveMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveMeterNotes: freezed == receiveMeterNotes ? _self.receiveMeterNotes : receiveMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UtilityMeter].
extension UtilityMeterPatterns on UtilityMeter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UtilityMeter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UtilityMeter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UtilityMeter value)  $default,){
final _that = this;
switch (_that) {
case _UtilityMeter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UtilityMeter value)?  $default,){
final _that = this;
switch (_that) {
case _UtilityMeter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'receive_documents')  bool receiveDocuments, @JsonKey(name: 'receive_documents_date')  DateTime? receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes')  String? receiveDocumentsNotes,  bool authorization_var, @JsonKey(name: 'authorization_var_date')  DateTime? authorizationDate, @JsonKey(name: 'authorization_var_notes')  String? authorizationNotes, @JsonKey(name: 'apply_for_meter')  bool applyForMeter, @JsonKey(name: 'apply_for_meter_date')  DateTime? applyForMeterDate, @JsonKey(name: 'apply_for_meter_notes')  String? applyForMeterNotes, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @JsonKey(name: 'print_letters')  bool printLetters, @JsonKey(name: 'print_letters_date')  DateTime? printLettersDate, @JsonKey(name: 'print_letters_notes')  String? printLettersNotes, @JsonKey(name: 'supply_to_meter')  bool supplyToMeter, @JsonKey(name: 'supply_to_meter_date')  DateTime? supplyToMeterDate, @JsonKey(name: 'supply_to_meter_notes')  String? supplyToMeterNotes, @JsonKey(name: 'supply_amount_1')  double? supplyAmount1, @JsonKey(name: 'supply_amount_2')  double? supplyAmount2, @JsonKey(name: 'supply_amount_3')  double? supplyAmount3, @JsonKey(name: 'supply_amount_4')  double? supplyAmount4, @JsonKey(name: 'contract_meter')  bool contractMeter, @JsonKey(name: 'contract_meter_date')  DateTime? contractMeterDate, @JsonKey(name: 'contract_meter_notes')  String? contractMeterNotes, @JsonKey(name: 'receive_meter')  bool receiveMeter, @JsonKey(name: 'receive_meter_date')  DateTime? receiveMeterDate, @JsonKey(name: 'receive_meter_notes')  String? receiveMeterNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UtilityMeter() when $default != null:
return $default(_that.id,_that.customerId,_that.receiveDocuments,_that.receiveDocumentsDate,_that.receiveDocumentsNotes,_that.authorization_var,_that.authorizationDate,_that.authorizationNotes,_that.applyForMeter,_that.applyForMeterDate,_that.applyForMeterNotes,_that.inspectionDate,_that.inspectionAmount,_that.inspectionNotes,_that.printLetters,_that.printLettersDate,_that.printLettersNotes,_that.supplyToMeter,_that.supplyToMeterDate,_that.supplyToMeterNotes,_that.supplyAmount1,_that.supplyAmount2,_that.supplyAmount3,_that.supplyAmount4,_that.contractMeter,_that.contractMeterDate,_that.contractMeterNotes,_that.receiveMeter,_that.receiveMeterDate,_that.receiveMeterNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'receive_documents')  bool receiveDocuments, @JsonKey(name: 'receive_documents_date')  DateTime? receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes')  String? receiveDocumentsNotes,  bool authorization_var, @JsonKey(name: 'authorization_var_date')  DateTime? authorizationDate, @JsonKey(name: 'authorization_var_notes')  String? authorizationNotes, @JsonKey(name: 'apply_for_meter')  bool applyForMeter, @JsonKey(name: 'apply_for_meter_date')  DateTime? applyForMeterDate, @JsonKey(name: 'apply_for_meter_notes')  String? applyForMeterNotes, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @JsonKey(name: 'print_letters')  bool printLetters, @JsonKey(name: 'print_letters_date')  DateTime? printLettersDate, @JsonKey(name: 'print_letters_notes')  String? printLettersNotes, @JsonKey(name: 'supply_to_meter')  bool supplyToMeter, @JsonKey(name: 'supply_to_meter_date')  DateTime? supplyToMeterDate, @JsonKey(name: 'supply_to_meter_notes')  String? supplyToMeterNotes, @JsonKey(name: 'supply_amount_1')  double? supplyAmount1, @JsonKey(name: 'supply_amount_2')  double? supplyAmount2, @JsonKey(name: 'supply_amount_3')  double? supplyAmount3, @JsonKey(name: 'supply_amount_4')  double? supplyAmount4, @JsonKey(name: 'contract_meter')  bool contractMeter, @JsonKey(name: 'contract_meter_date')  DateTime? contractMeterDate, @JsonKey(name: 'contract_meter_notes')  String? contractMeterNotes, @JsonKey(name: 'receive_meter')  bool receiveMeter, @JsonKey(name: 'receive_meter_date')  DateTime? receiveMeterDate, @JsonKey(name: 'receive_meter_notes')  String? receiveMeterNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UtilityMeter():
return $default(_that.id,_that.customerId,_that.receiveDocuments,_that.receiveDocumentsDate,_that.receiveDocumentsNotes,_that.authorization_var,_that.authorizationDate,_that.authorizationNotes,_that.applyForMeter,_that.applyForMeterDate,_that.applyForMeterNotes,_that.inspectionDate,_that.inspectionAmount,_that.inspectionNotes,_that.printLetters,_that.printLettersDate,_that.printLettersNotes,_that.supplyToMeter,_that.supplyToMeterDate,_that.supplyToMeterNotes,_that.supplyAmount1,_that.supplyAmount2,_that.supplyAmount3,_that.supplyAmount4,_that.contractMeter,_that.contractMeterDate,_that.contractMeterNotes,_that.receiveMeter,_that.receiveMeterDate,_that.receiveMeterNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'receive_documents')  bool receiveDocuments, @JsonKey(name: 'receive_documents_date')  DateTime? receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes')  String? receiveDocumentsNotes,  bool authorization_var, @JsonKey(name: 'authorization_var_date')  DateTime? authorizationDate, @JsonKey(name: 'authorization_var_notes')  String? authorizationNotes, @JsonKey(name: 'apply_for_meter')  bool applyForMeter, @JsonKey(name: 'apply_for_meter_date')  DateTime? applyForMeterDate, @JsonKey(name: 'apply_for_meter_notes')  String? applyForMeterNotes, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @JsonKey(name: 'print_letters')  bool printLetters, @JsonKey(name: 'print_letters_date')  DateTime? printLettersDate, @JsonKey(name: 'print_letters_notes')  String? printLettersNotes, @JsonKey(name: 'supply_to_meter')  bool supplyToMeter, @JsonKey(name: 'supply_to_meter_date')  DateTime? supplyToMeterDate, @JsonKey(name: 'supply_to_meter_notes')  String? supplyToMeterNotes, @JsonKey(name: 'supply_amount_1')  double? supplyAmount1, @JsonKey(name: 'supply_amount_2')  double? supplyAmount2, @JsonKey(name: 'supply_amount_3')  double? supplyAmount3, @JsonKey(name: 'supply_amount_4')  double? supplyAmount4, @JsonKey(name: 'contract_meter')  bool contractMeter, @JsonKey(name: 'contract_meter_date')  DateTime? contractMeterDate, @JsonKey(name: 'contract_meter_notes')  String? contractMeterNotes, @JsonKey(name: 'receive_meter')  bool receiveMeter, @JsonKey(name: 'receive_meter_date')  DateTime? receiveMeterDate, @JsonKey(name: 'receive_meter_notes')  String? receiveMeterNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UtilityMeter() when $default != null:
return $default(_that.id,_that.customerId,_that.receiveDocuments,_that.receiveDocumentsDate,_that.receiveDocumentsNotes,_that.authorization_var,_that.authorizationDate,_that.authorizationNotes,_that.applyForMeter,_that.applyForMeterDate,_that.applyForMeterNotes,_that.inspectionDate,_that.inspectionAmount,_that.inspectionNotes,_that.printLetters,_that.printLettersDate,_that.printLettersNotes,_that.supplyToMeter,_that.supplyToMeterDate,_that.supplyToMeterNotes,_that.supplyAmount1,_that.supplyAmount2,_that.supplyAmount3,_that.supplyAmount4,_that.contractMeter,_that.contractMeterDate,_that.contractMeterNotes,_that.receiveMeter,_that.receiveMeterDate,_that.receiveMeterNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UtilityMeter extends UtilityMeter {
  const _UtilityMeter({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'receive_documents') this.receiveDocuments = false, @JsonKey(name: 'receive_documents_date') this.receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes') this.receiveDocumentsNotes, this.authorization_var = false, @JsonKey(name: 'authorization_var_date') this.authorizationDate, @JsonKey(name: 'authorization_var_notes') this.authorizationNotes, @JsonKey(name: 'apply_for_meter') this.applyForMeter = false, @JsonKey(name: 'apply_for_meter_date') this.applyForMeterDate, @JsonKey(name: 'apply_for_meter_notes') this.applyForMeterNotes, @JsonKey(name: 'inspection_date') this.inspectionDate, @JsonKey(name: 'inspection_amount') this.inspectionAmount, @JsonKey(name: 'inspection_notes') this.inspectionNotes, @JsonKey(name: 'print_letters') this.printLetters = false, @JsonKey(name: 'print_letters_date') this.printLettersDate, @JsonKey(name: 'print_letters_notes') this.printLettersNotes, @JsonKey(name: 'supply_to_meter') this.supplyToMeter = false, @JsonKey(name: 'supply_to_meter_date') this.supplyToMeterDate, @JsonKey(name: 'supply_to_meter_notes') this.supplyToMeterNotes, @JsonKey(name: 'supply_amount_1') this.supplyAmount1, @JsonKey(name: 'supply_amount_2') this.supplyAmount2, @JsonKey(name: 'supply_amount_3') this.supplyAmount3, @JsonKey(name: 'supply_amount_4') this.supplyAmount4, @JsonKey(name: 'contract_meter') this.contractMeter = false, @JsonKey(name: 'contract_meter_date') this.contractMeterDate, @JsonKey(name: 'contract_meter_notes') this.contractMeterNotes, @JsonKey(name: 'receive_meter') this.receiveMeter = false, @JsonKey(name: 'receive_meter_date') this.receiveMeterDate, @JsonKey(name: 'receive_meter_notes') this.receiveMeterNotes, @JsonKey(name: 'stage_notes') this.stageNotes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _UtilityMeter.fromJson(Map<String, dynamic> json) => _$UtilityMeterFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
// Step 1: استلام الأوراق
@override@JsonKey(name: 'receive_documents') final  bool receiveDocuments;
@override@JsonKey(name: 'receive_documents_date') final  DateTime? receiveDocumentsDate;
@override@JsonKey(name: 'receive_documents_notes') final  String? receiveDocumentsNotes;
// Step 2: التوكيل
@override@JsonKey() final  bool authorization_var;
@override@JsonKey(name: 'authorization_var_date') final  DateTime? authorizationDate;
@override@JsonKey(name: 'authorization_var_notes') final  String? authorizationNotes;
// Step 3: التقديم علي العداد
@override@JsonKey(name: 'apply_for_meter') final  bool applyForMeter;
@override@JsonKey(name: 'apply_for_meter_date') final  DateTime? applyForMeterDate;
@override@JsonKey(name: 'apply_for_meter_notes') final  String? applyForMeterNotes;
// Step 4: تحديد ميعاد المعاينة (has money field)
@override@JsonKey(name: 'inspection_date') final  DateTime? inspectionDate;
@override@JsonKey(name: 'inspection_amount') final  double? inspectionAmount;
@override@JsonKey(name: 'inspection_notes') final  String? inspectionNotes;
// Step 5: طباعة الجوابات (NEW)
@override@JsonKey(name: 'print_letters') final  bool printLetters;
@override@JsonKey(name: 'print_letters_date') final  DateTime? printLettersDate;
@override@JsonKey(name: 'print_letters_notes') final  String? printLettersNotes;
// Step 6: التوريد علي العداد (4 money fields)
@override@JsonKey(name: 'supply_to_meter') final  bool supplyToMeter;
@override@JsonKey(name: 'supply_to_meter_date') final  DateTime? supplyToMeterDate;
@override@JsonKey(name: 'supply_to_meter_notes') final  String? supplyToMeterNotes;
@override@JsonKey(name: 'supply_amount_1') final  double? supplyAmount1;
@override@JsonKey(name: 'supply_amount_2') final  double? supplyAmount2;
@override@JsonKey(name: 'supply_amount_3') final  double? supplyAmount3;
@override@JsonKey(name: 'supply_amount_4') final  double? supplyAmount4;
// Step 7: التعاقد علي العداد
@override@JsonKey(name: 'contract_meter') final  bool contractMeter;
@override@JsonKey(name: 'contract_meter_date') final  DateTime? contractMeterDate;
@override@JsonKey(name: 'contract_meter_notes') final  String? contractMeterNotes;
// Step 8: استلام العداد
@override@JsonKey(name: 'receive_meter') final  bool receiveMeter;
@override@JsonKey(name: 'receive_meter_date') final  DateTime? receiveMeterDate;
@override@JsonKey(name: 'receive_meter_notes') final  String? receiveMeterNotes;
// General stage notes
@override@JsonKey(name: 'stage_notes') final  String? stageNotes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of UtilityMeter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtilityMeterCopyWith<_UtilityMeter> get copyWith => __$UtilityMeterCopyWithImpl<_UtilityMeter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UtilityMeterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UtilityMeter&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.receiveDocuments, receiveDocuments) || other.receiveDocuments == receiveDocuments)&&(identical(other.receiveDocumentsDate, receiveDocumentsDate) || other.receiveDocumentsDate == receiveDocumentsDate)&&(identical(other.receiveDocumentsNotes, receiveDocumentsNotes) || other.receiveDocumentsNotes == receiveDocumentsNotes)&&(identical(other.authorization_var, authorization_var) || other.authorization_var == authorization_var)&&(identical(other.authorizationDate, authorizationDate) || other.authorizationDate == authorizationDate)&&(identical(other.authorizationNotes, authorizationNotes) || other.authorizationNotes == authorizationNotes)&&(identical(other.applyForMeter, applyForMeter) || other.applyForMeter == applyForMeter)&&(identical(other.applyForMeterDate, applyForMeterDate) || other.applyForMeterDate == applyForMeterDate)&&(identical(other.applyForMeterNotes, applyForMeterNotes) || other.applyForMeterNotes == applyForMeterNotes)&&(identical(other.inspectionDate, inspectionDate) || other.inspectionDate == inspectionDate)&&(identical(other.inspectionAmount, inspectionAmount) || other.inspectionAmount == inspectionAmount)&&(identical(other.inspectionNotes, inspectionNotes) || other.inspectionNotes == inspectionNotes)&&(identical(other.printLetters, printLetters) || other.printLetters == printLetters)&&(identical(other.printLettersDate, printLettersDate) || other.printLettersDate == printLettersDate)&&(identical(other.printLettersNotes, printLettersNotes) || other.printLettersNotes == printLettersNotes)&&(identical(other.supplyToMeter, supplyToMeter) || other.supplyToMeter == supplyToMeter)&&(identical(other.supplyToMeterDate, supplyToMeterDate) || other.supplyToMeterDate == supplyToMeterDate)&&(identical(other.supplyToMeterNotes, supplyToMeterNotes) || other.supplyToMeterNotes == supplyToMeterNotes)&&(identical(other.supplyAmount1, supplyAmount1) || other.supplyAmount1 == supplyAmount1)&&(identical(other.supplyAmount2, supplyAmount2) || other.supplyAmount2 == supplyAmount2)&&(identical(other.supplyAmount3, supplyAmount3) || other.supplyAmount3 == supplyAmount3)&&(identical(other.supplyAmount4, supplyAmount4) || other.supplyAmount4 == supplyAmount4)&&(identical(other.contractMeter, contractMeter) || other.contractMeter == contractMeter)&&(identical(other.contractMeterDate, contractMeterDate) || other.contractMeterDate == contractMeterDate)&&(identical(other.contractMeterNotes, contractMeterNotes) || other.contractMeterNotes == contractMeterNotes)&&(identical(other.receiveMeter, receiveMeter) || other.receiveMeter == receiveMeter)&&(identical(other.receiveMeterDate, receiveMeterDate) || other.receiveMeterDate == receiveMeterDate)&&(identical(other.receiveMeterNotes, receiveMeterNotes) || other.receiveMeterNotes == receiveMeterNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,receiveDocuments,receiveDocumentsDate,receiveDocumentsNotes,authorization_var,authorizationDate,authorizationNotes,applyForMeter,applyForMeterDate,applyForMeterNotes,inspectionDate,inspectionAmount,inspectionNotes,printLetters,printLettersDate,printLettersNotes,supplyToMeter,supplyToMeterDate,supplyToMeterNotes,supplyAmount1,supplyAmount2,supplyAmount3,supplyAmount4,contractMeter,contractMeterDate,contractMeterNotes,receiveMeter,receiveMeterDate,receiveMeterNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'UtilityMeter(id: $id, customerId: $customerId, receiveDocuments: $receiveDocuments, receiveDocumentsDate: $receiveDocumentsDate, receiveDocumentsNotes: $receiveDocumentsNotes, authorization_var: $authorization_var, authorizationDate: $authorizationDate, authorizationNotes: $authorizationNotes, applyForMeter: $applyForMeter, applyForMeterDate: $applyForMeterDate, applyForMeterNotes: $applyForMeterNotes, inspectionDate: $inspectionDate, inspectionAmount: $inspectionAmount, inspectionNotes: $inspectionNotes, printLetters: $printLetters, printLettersDate: $printLettersDate, printLettersNotes: $printLettersNotes, supplyToMeter: $supplyToMeter, supplyToMeterDate: $supplyToMeterDate, supplyToMeterNotes: $supplyToMeterNotes, supplyAmount1: $supplyAmount1, supplyAmount2: $supplyAmount2, supplyAmount3: $supplyAmount3, supplyAmount4: $supplyAmount4, contractMeter: $contractMeter, contractMeterDate: $contractMeterDate, contractMeterNotes: $contractMeterNotes, receiveMeter: $receiveMeter, receiveMeterDate: $receiveMeterDate, receiveMeterNotes: $receiveMeterNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UtilityMeterCopyWith<$Res> implements $UtilityMeterCopyWith<$Res> {
  factory _$UtilityMeterCopyWith(_UtilityMeter value, $Res Function(_UtilityMeter) _then) = __$UtilityMeterCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'receive_documents') bool receiveDocuments,@JsonKey(name: 'receive_documents_date') DateTime? receiveDocumentsDate,@JsonKey(name: 'receive_documents_notes') String? receiveDocumentsNotes, bool authorization_var,@JsonKey(name: 'authorization_var_date') DateTime? authorizationDate,@JsonKey(name: 'authorization_var_notes') String? authorizationNotes,@JsonKey(name: 'apply_for_meter') bool applyForMeter,@JsonKey(name: 'apply_for_meter_date') DateTime? applyForMeterDate,@JsonKey(name: 'apply_for_meter_notes') String? applyForMeterNotes,@JsonKey(name: 'inspection_date') DateTime? inspectionDate,@JsonKey(name: 'inspection_amount') double? inspectionAmount,@JsonKey(name: 'inspection_notes') String? inspectionNotes,@JsonKey(name: 'print_letters') bool printLetters,@JsonKey(name: 'print_letters_date') DateTime? printLettersDate,@JsonKey(name: 'print_letters_notes') String? printLettersNotes,@JsonKey(name: 'supply_to_meter') bool supplyToMeter,@JsonKey(name: 'supply_to_meter_date') DateTime? supplyToMeterDate,@JsonKey(name: 'supply_to_meter_notes') String? supplyToMeterNotes,@JsonKey(name: 'supply_amount_1') double? supplyAmount1,@JsonKey(name: 'supply_amount_2') double? supplyAmount2,@JsonKey(name: 'supply_amount_3') double? supplyAmount3,@JsonKey(name: 'supply_amount_4') double? supplyAmount4,@JsonKey(name: 'contract_meter') bool contractMeter,@JsonKey(name: 'contract_meter_date') DateTime? contractMeterDate,@JsonKey(name: 'contract_meter_notes') String? contractMeterNotes,@JsonKey(name: 'receive_meter') bool receiveMeter,@JsonKey(name: 'receive_meter_date') DateTime? receiveMeterDate,@JsonKey(name: 'receive_meter_notes') String? receiveMeterNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$UtilityMeterCopyWithImpl<$Res>
    implements _$UtilityMeterCopyWith<$Res> {
  __$UtilityMeterCopyWithImpl(this._self, this._then);

  final _UtilityMeter _self;
  final $Res Function(_UtilityMeter) _then;

/// Create a copy of UtilityMeter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? receiveDocuments = null,Object? receiveDocumentsDate = freezed,Object? receiveDocumentsNotes = freezed,Object? authorization_var = null,Object? authorizationDate = freezed,Object? authorizationNotes = freezed,Object? applyForMeter = null,Object? applyForMeterDate = freezed,Object? applyForMeterNotes = freezed,Object? inspectionDate = freezed,Object? inspectionAmount = freezed,Object? inspectionNotes = freezed,Object? printLetters = null,Object? printLettersDate = freezed,Object? printLettersNotes = freezed,Object? supplyToMeter = null,Object? supplyToMeterDate = freezed,Object? supplyToMeterNotes = freezed,Object? supplyAmount1 = freezed,Object? supplyAmount2 = freezed,Object? supplyAmount3 = freezed,Object? supplyAmount4 = freezed,Object? contractMeter = null,Object? contractMeterDate = freezed,Object? contractMeterNotes = freezed,Object? receiveMeter = null,Object? receiveMeterDate = freezed,Object? receiveMeterNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UtilityMeter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,receiveDocuments: null == receiveDocuments ? _self.receiveDocuments : receiveDocuments // ignore: cast_nullable_to_non_nullable
as bool,receiveDocumentsDate: freezed == receiveDocumentsDate ? _self.receiveDocumentsDate : receiveDocumentsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveDocumentsNotes: freezed == receiveDocumentsNotes ? _self.receiveDocumentsNotes : receiveDocumentsNotes // ignore: cast_nullable_to_non_nullable
as String?,authorization_var: null == authorization_var ? _self.authorization_var : authorization_var // ignore: cast_nullable_to_non_nullable
as bool,authorizationDate: freezed == authorizationDate ? _self.authorizationDate : authorizationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,authorizationNotes: freezed == authorizationNotes ? _self.authorizationNotes : authorizationNotes // ignore: cast_nullable_to_non_nullable
as String?,applyForMeter: null == applyForMeter ? _self.applyForMeter : applyForMeter // ignore: cast_nullable_to_non_nullable
as bool,applyForMeterDate: freezed == applyForMeterDate ? _self.applyForMeterDate : applyForMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applyForMeterNotes: freezed == applyForMeterNotes ? _self.applyForMeterNotes : applyForMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionDate: freezed == inspectionDate ? _self.inspectionDate : inspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionAmount: freezed == inspectionAmount ? _self.inspectionAmount : inspectionAmount // ignore: cast_nullable_to_non_nullable
as double?,inspectionNotes: freezed == inspectionNotes ? _self.inspectionNotes : inspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,printLetters: null == printLetters ? _self.printLetters : printLetters // ignore: cast_nullable_to_non_nullable
as bool,printLettersDate: freezed == printLettersDate ? _self.printLettersDate : printLettersDate // ignore: cast_nullable_to_non_nullable
as DateTime?,printLettersNotes: freezed == printLettersNotes ? _self.printLettersNotes : printLettersNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyToMeter: null == supplyToMeter ? _self.supplyToMeter : supplyToMeter // ignore: cast_nullable_to_non_nullable
as bool,supplyToMeterDate: freezed == supplyToMeterDate ? _self.supplyToMeterDate : supplyToMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyToMeterNotes: freezed == supplyToMeterNotes ? _self.supplyToMeterNotes : supplyToMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount1: freezed == supplyAmount1 ? _self.supplyAmount1 : supplyAmount1 // ignore: cast_nullable_to_non_nullable
as double?,supplyAmount2: freezed == supplyAmount2 ? _self.supplyAmount2 : supplyAmount2 // ignore: cast_nullable_to_non_nullable
as double?,supplyAmount3: freezed == supplyAmount3 ? _self.supplyAmount3 : supplyAmount3 // ignore: cast_nullable_to_non_nullable
as double?,supplyAmount4: freezed == supplyAmount4 ? _self.supplyAmount4 : supplyAmount4 // ignore: cast_nullable_to_non_nullable
as double?,contractMeter: null == contractMeter ? _self.contractMeter : contractMeter // ignore: cast_nullable_to_non_nullable
as bool,contractMeterDate: freezed == contractMeterDate ? _self.contractMeterDate : contractMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,contractMeterNotes: freezed == contractMeterNotes ? _self.contractMeterNotes : contractMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,receiveMeter: null == receiveMeter ? _self.receiveMeter : receiveMeter // ignore: cast_nullable_to_non_nullable
as bool,receiveMeterDate: freezed == receiveMeterDate ? _self.receiveMeterDate : receiveMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveMeterNotes: freezed == receiveMeterNotes ? _self.receiveMeterNotes : receiveMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
