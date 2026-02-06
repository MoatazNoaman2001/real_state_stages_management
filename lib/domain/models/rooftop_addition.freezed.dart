// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rooftop_addition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RooftopAddition {

 int get id;@JsonKey(name: 'customer_id') int get customerId;// Step 1: التقديم علي الطلب
@JsonKey(name: 'submit_request') bool get submitRequest;@JsonKey(name: 'submit_request_date') DateTime? get submitRequestDate;@JsonKey(name: 'submit_request_notes') String? get submitRequestNotes;// Step 2: سداد المعاينة (has money field)
@JsonKey(name: 'pay_inspection') bool get payInspection;@JsonKey(name: 'pay_inspection_date') DateTime? get payInspectionDate;@JsonKey(name: 'pay_inspection_notes') String? get payInspectionNotes;@JsonKey(name: 'inspection_amount') double? get inspectionAmount;// Step 3: ميعاد المعاينة
@JsonKey(name: 'inspection_date') DateTime? get inspectionDate;@JsonKey(name: 'inspection_notes') String? get inspectionNotes;// Step 4: مراجعة مع الجهاز
@JsonKey(name: 'review_with_agency') bool get reviewWithAgency;@JsonKey(name: 'review_with_agency_date') DateTime? get reviewWithAgencyDate;@JsonKey(name: 'review_with_agency_notes') String? get reviewWithAgencyNotes;// Step 5: طباعة الجوابات (NEW)
@JsonKey(name: 'print_letters') bool get printLetters;@JsonKey(name: 'print_letters_date') DateTime? get printLettersDate;@JsonKey(name: 'print_letters_notes') String? get printLettersNotes;// Step 6: التوريد (has money field)
@JsonKey(name: 'supply') bool get supply;@JsonKey(name: 'supply_date') DateTime? get supplyDate;@JsonKey(name: 'supply_notes') String? get supplyNotes;@JsonKey(name: 'supply_amount') double? get supplyAmount;// Step 7: العقد الابتدائي
@JsonKey(name: 'initial_contract') bool get initialContract;@JsonKey(name: 'initial_contract_date') DateTime? get initialContractDate;@JsonKey(name: 'initial_contract_notes') String? get initialContractNotes;// Step 8: العقد الملحق
@JsonKey(name: 'supplementary_contract') bool get supplementaryContract;@JsonKey(name: 'supplementary_contract_date') DateTime? get supplementaryContractDate;@JsonKey(name: 'supplementary_contract_notes') String? get supplementaryContractNotes;// Step 9: وتروح بعدها للترخيص
@JsonKey(name: 'then_to_license') bool get thenToLicense;@JsonKey(name: 'then_to_license_date') DateTime? get thenToLicenseDate;@JsonKey(name: 'then_to_license_notes') String? get thenToLicenseNotes;// General stage notes
@JsonKey(name: 'stage_notes') String? get stageNotes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of RooftopAddition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RooftopAdditionCopyWith<RooftopAddition> get copyWith => _$RooftopAdditionCopyWithImpl<RooftopAddition>(this as RooftopAddition, _$identity);

  /// Serializes this RooftopAddition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RooftopAddition&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.submitRequest, submitRequest) || other.submitRequest == submitRequest)&&(identical(other.submitRequestDate, submitRequestDate) || other.submitRequestDate == submitRequestDate)&&(identical(other.submitRequestNotes, submitRequestNotes) || other.submitRequestNotes == submitRequestNotes)&&(identical(other.payInspection, payInspection) || other.payInspection == payInspection)&&(identical(other.payInspectionDate, payInspectionDate) || other.payInspectionDate == payInspectionDate)&&(identical(other.payInspectionNotes, payInspectionNotes) || other.payInspectionNotes == payInspectionNotes)&&(identical(other.inspectionAmount, inspectionAmount) || other.inspectionAmount == inspectionAmount)&&(identical(other.inspectionDate, inspectionDate) || other.inspectionDate == inspectionDate)&&(identical(other.inspectionNotes, inspectionNotes) || other.inspectionNotes == inspectionNotes)&&(identical(other.reviewWithAgency, reviewWithAgency) || other.reviewWithAgency == reviewWithAgency)&&(identical(other.reviewWithAgencyDate, reviewWithAgencyDate) || other.reviewWithAgencyDate == reviewWithAgencyDate)&&(identical(other.reviewWithAgencyNotes, reviewWithAgencyNotes) || other.reviewWithAgencyNotes == reviewWithAgencyNotes)&&(identical(other.printLetters, printLetters) || other.printLetters == printLetters)&&(identical(other.printLettersDate, printLettersDate) || other.printLettersDate == printLettersDate)&&(identical(other.printLettersNotes, printLettersNotes) || other.printLettersNotes == printLettersNotes)&&(identical(other.supply, supply) || other.supply == supply)&&(identical(other.supplyDate, supplyDate) || other.supplyDate == supplyDate)&&(identical(other.supplyNotes, supplyNotes) || other.supplyNotes == supplyNotes)&&(identical(other.supplyAmount, supplyAmount) || other.supplyAmount == supplyAmount)&&(identical(other.initialContract, initialContract) || other.initialContract == initialContract)&&(identical(other.initialContractDate, initialContractDate) || other.initialContractDate == initialContractDate)&&(identical(other.initialContractNotes, initialContractNotes) || other.initialContractNotes == initialContractNotes)&&(identical(other.supplementaryContract, supplementaryContract) || other.supplementaryContract == supplementaryContract)&&(identical(other.supplementaryContractDate, supplementaryContractDate) || other.supplementaryContractDate == supplementaryContractDate)&&(identical(other.supplementaryContractNotes, supplementaryContractNotes) || other.supplementaryContractNotes == supplementaryContractNotes)&&(identical(other.thenToLicense, thenToLicense) || other.thenToLicense == thenToLicense)&&(identical(other.thenToLicenseDate, thenToLicenseDate) || other.thenToLicenseDate == thenToLicenseDate)&&(identical(other.thenToLicenseNotes, thenToLicenseNotes) || other.thenToLicenseNotes == thenToLicenseNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,submitRequest,submitRequestDate,submitRequestNotes,payInspection,payInspectionDate,payInspectionNotes,inspectionAmount,inspectionDate,inspectionNotes,reviewWithAgency,reviewWithAgencyDate,reviewWithAgencyNotes,printLetters,printLettersDate,printLettersNotes,supply,supplyDate,supplyNotes,supplyAmount,initialContract,initialContractDate,initialContractNotes,supplementaryContract,supplementaryContractDate,supplementaryContractNotes,thenToLicense,thenToLicenseDate,thenToLicenseNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'RooftopAddition(id: $id, customerId: $customerId, submitRequest: $submitRequest, submitRequestDate: $submitRequestDate, submitRequestNotes: $submitRequestNotes, payInspection: $payInspection, payInspectionDate: $payInspectionDate, payInspectionNotes: $payInspectionNotes, inspectionAmount: $inspectionAmount, inspectionDate: $inspectionDate, inspectionNotes: $inspectionNotes, reviewWithAgency: $reviewWithAgency, reviewWithAgencyDate: $reviewWithAgencyDate, reviewWithAgencyNotes: $reviewWithAgencyNotes, printLetters: $printLetters, printLettersDate: $printLettersDate, printLettersNotes: $printLettersNotes, supply: $supply, supplyDate: $supplyDate, supplyNotes: $supplyNotes, supplyAmount: $supplyAmount, initialContract: $initialContract, initialContractDate: $initialContractDate, initialContractNotes: $initialContractNotes, supplementaryContract: $supplementaryContract, supplementaryContractDate: $supplementaryContractDate, supplementaryContractNotes: $supplementaryContractNotes, thenToLicense: $thenToLicense, thenToLicenseDate: $thenToLicenseDate, thenToLicenseNotes: $thenToLicenseNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RooftopAdditionCopyWith<$Res>  {
  factory $RooftopAdditionCopyWith(RooftopAddition value, $Res Function(RooftopAddition) _then) = _$RooftopAdditionCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'submit_request') bool submitRequest,@JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,@JsonKey(name: 'submit_request_notes') String? submitRequestNotes,@JsonKey(name: 'pay_inspection') bool payInspection,@JsonKey(name: 'pay_inspection_date') DateTime? payInspectionDate,@JsonKey(name: 'pay_inspection_notes') String? payInspectionNotes,@JsonKey(name: 'inspection_amount') double? inspectionAmount,@JsonKey(name: 'inspection_date') DateTime? inspectionDate,@JsonKey(name: 'inspection_notes') String? inspectionNotes,@JsonKey(name: 'review_with_agency') bool reviewWithAgency,@JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,@JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,@JsonKey(name: 'print_letters') bool printLetters,@JsonKey(name: 'print_letters_date') DateTime? printLettersDate,@JsonKey(name: 'print_letters_notes') String? printLettersNotes,@JsonKey(name: 'supply') bool supply,@JsonKey(name: 'supply_date') DateTime? supplyDate,@JsonKey(name: 'supply_notes') String? supplyNotes,@JsonKey(name: 'supply_amount') double? supplyAmount,@JsonKey(name: 'initial_contract') bool initialContract,@JsonKey(name: 'initial_contract_date') DateTime? initialContractDate,@JsonKey(name: 'initial_contract_notes') String? initialContractNotes,@JsonKey(name: 'supplementary_contract') bool supplementaryContract,@JsonKey(name: 'supplementary_contract_date') DateTime? supplementaryContractDate,@JsonKey(name: 'supplementary_contract_notes') String? supplementaryContractNotes,@JsonKey(name: 'then_to_license') bool thenToLicense,@JsonKey(name: 'then_to_license_date') DateTime? thenToLicenseDate,@JsonKey(name: 'then_to_license_notes') String? thenToLicenseNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$RooftopAdditionCopyWithImpl<$Res>
    implements $RooftopAdditionCopyWith<$Res> {
  _$RooftopAdditionCopyWithImpl(this._self, this._then);

  final RooftopAddition _self;
  final $Res Function(RooftopAddition) _then;

/// Create a copy of RooftopAddition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? submitRequest = null,Object? submitRequestDate = freezed,Object? submitRequestNotes = freezed,Object? payInspection = null,Object? payInspectionDate = freezed,Object? payInspectionNotes = freezed,Object? inspectionAmount = freezed,Object? inspectionDate = freezed,Object? inspectionNotes = freezed,Object? reviewWithAgency = null,Object? reviewWithAgencyDate = freezed,Object? reviewWithAgencyNotes = freezed,Object? printLetters = null,Object? printLettersDate = freezed,Object? printLettersNotes = freezed,Object? supply = null,Object? supplyDate = freezed,Object? supplyNotes = freezed,Object? supplyAmount = freezed,Object? initialContract = null,Object? initialContractDate = freezed,Object? initialContractNotes = freezed,Object? supplementaryContract = null,Object? supplementaryContractDate = freezed,Object? supplementaryContractNotes = freezed,Object? thenToLicense = null,Object? thenToLicenseDate = freezed,Object? thenToLicenseNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,submitRequest: null == submitRequest ? _self.submitRequest : submitRequest // ignore: cast_nullable_to_non_nullable
as bool,submitRequestDate: freezed == submitRequestDate ? _self.submitRequestDate : submitRequestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitRequestNotes: freezed == submitRequestNotes ? _self.submitRequestNotes : submitRequestNotes // ignore: cast_nullable_to_non_nullable
as String?,payInspection: null == payInspection ? _self.payInspection : payInspection // ignore: cast_nullable_to_non_nullable
as bool,payInspectionDate: freezed == payInspectionDate ? _self.payInspectionDate : payInspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,payInspectionNotes: freezed == payInspectionNotes ? _self.payInspectionNotes : payInspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionAmount: freezed == inspectionAmount ? _self.inspectionAmount : inspectionAmount // ignore: cast_nullable_to_non_nullable
as double?,inspectionDate: freezed == inspectionDate ? _self.inspectionDate : inspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionNotes: freezed == inspectionNotes ? _self.inspectionNotes : inspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,reviewWithAgency: null == reviewWithAgency ? _self.reviewWithAgency : reviewWithAgency // ignore: cast_nullable_to_non_nullable
as bool,reviewWithAgencyDate: freezed == reviewWithAgencyDate ? _self.reviewWithAgencyDate : reviewWithAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewWithAgencyNotes: freezed == reviewWithAgencyNotes ? _self.reviewWithAgencyNotes : reviewWithAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,printLetters: null == printLetters ? _self.printLetters : printLetters // ignore: cast_nullable_to_non_nullable
as bool,printLettersDate: freezed == printLettersDate ? _self.printLettersDate : printLettersDate // ignore: cast_nullable_to_non_nullable
as DateTime?,printLettersNotes: freezed == printLettersNotes ? _self.printLettersNotes : printLettersNotes // ignore: cast_nullable_to_non_nullable
as String?,supply: null == supply ? _self.supply : supply // ignore: cast_nullable_to_non_nullable
as bool,supplyDate: freezed == supplyDate ? _self.supplyDate : supplyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyNotes: freezed == supplyNotes ? _self.supplyNotes : supplyNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount: freezed == supplyAmount ? _self.supplyAmount : supplyAmount // ignore: cast_nullable_to_non_nullable
as double?,initialContract: null == initialContract ? _self.initialContract : initialContract // ignore: cast_nullable_to_non_nullable
as bool,initialContractDate: freezed == initialContractDate ? _self.initialContractDate : initialContractDate // ignore: cast_nullable_to_non_nullable
as DateTime?,initialContractNotes: freezed == initialContractNotes ? _self.initialContractNotes : initialContractNotes // ignore: cast_nullable_to_non_nullable
as String?,supplementaryContract: null == supplementaryContract ? _self.supplementaryContract : supplementaryContract // ignore: cast_nullable_to_non_nullable
as bool,supplementaryContractDate: freezed == supplementaryContractDate ? _self.supplementaryContractDate : supplementaryContractDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplementaryContractNotes: freezed == supplementaryContractNotes ? _self.supplementaryContractNotes : supplementaryContractNotes // ignore: cast_nullable_to_non_nullable
as String?,thenToLicense: null == thenToLicense ? _self.thenToLicense : thenToLicense // ignore: cast_nullable_to_non_nullable
as bool,thenToLicenseDate: freezed == thenToLicenseDate ? _self.thenToLicenseDate : thenToLicenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,thenToLicenseNotes: freezed == thenToLicenseNotes ? _self.thenToLicenseNotes : thenToLicenseNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RooftopAddition].
extension RooftopAdditionPatterns on RooftopAddition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RooftopAddition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RooftopAddition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RooftopAddition value)  $default,){
final _that = this;
switch (_that) {
case _RooftopAddition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RooftopAddition value)?  $default,){
final _that = this;
switch (_that) {
case _RooftopAddition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'pay_inspection')  bool payInspection, @JsonKey(name: 'pay_inspection_date')  DateTime? payInspectionDate, @JsonKey(name: 'pay_inspection_notes')  String? payInspectionNotes, @JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'print_letters')  bool printLetters, @JsonKey(name: 'print_letters_date')  DateTime? printLettersDate, @JsonKey(name: 'print_letters_notes')  String? printLettersNotes, @JsonKey(name: 'supply')  bool supply, @JsonKey(name: 'supply_date')  DateTime? supplyDate, @JsonKey(name: 'supply_notes')  String? supplyNotes, @JsonKey(name: 'supply_amount')  double? supplyAmount, @JsonKey(name: 'initial_contract')  bool initialContract, @JsonKey(name: 'initial_contract_date')  DateTime? initialContractDate, @JsonKey(name: 'initial_contract_notes')  String? initialContractNotes, @JsonKey(name: 'supplementary_contract')  bool supplementaryContract, @JsonKey(name: 'supplementary_contract_date')  DateTime? supplementaryContractDate, @JsonKey(name: 'supplementary_contract_notes')  String? supplementaryContractNotes, @JsonKey(name: 'then_to_license')  bool thenToLicense, @JsonKey(name: 'then_to_license_date')  DateTime? thenToLicenseDate, @JsonKey(name: 'then_to_license_notes')  String? thenToLicenseNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RooftopAddition() when $default != null:
return $default(_that.id,_that.customerId,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.payInspection,_that.payInspectionDate,_that.payInspectionNotes,_that.inspectionAmount,_that.inspectionDate,_that.inspectionNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.printLetters,_that.printLettersDate,_that.printLettersNotes,_that.supply,_that.supplyDate,_that.supplyNotes,_that.supplyAmount,_that.initialContract,_that.initialContractDate,_that.initialContractNotes,_that.supplementaryContract,_that.supplementaryContractDate,_that.supplementaryContractNotes,_that.thenToLicense,_that.thenToLicenseDate,_that.thenToLicenseNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'pay_inspection')  bool payInspection, @JsonKey(name: 'pay_inspection_date')  DateTime? payInspectionDate, @JsonKey(name: 'pay_inspection_notes')  String? payInspectionNotes, @JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'print_letters')  bool printLetters, @JsonKey(name: 'print_letters_date')  DateTime? printLettersDate, @JsonKey(name: 'print_letters_notes')  String? printLettersNotes, @JsonKey(name: 'supply')  bool supply, @JsonKey(name: 'supply_date')  DateTime? supplyDate, @JsonKey(name: 'supply_notes')  String? supplyNotes, @JsonKey(name: 'supply_amount')  double? supplyAmount, @JsonKey(name: 'initial_contract')  bool initialContract, @JsonKey(name: 'initial_contract_date')  DateTime? initialContractDate, @JsonKey(name: 'initial_contract_notes')  String? initialContractNotes, @JsonKey(name: 'supplementary_contract')  bool supplementaryContract, @JsonKey(name: 'supplementary_contract_date')  DateTime? supplementaryContractDate, @JsonKey(name: 'supplementary_contract_notes')  String? supplementaryContractNotes, @JsonKey(name: 'then_to_license')  bool thenToLicense, @JsonKey(name: 'then_to_license_date')  DateTime? thenToLicenseDate, @JsonKey(name: 'then_to_license_notes')  String? thenToLicenseNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RooftopAddition():
return $default(_that.id,_that.customerId,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.payInspection,_that.payInspectionDate,_that.payInspectionNotes,_that.inspectionAmount,_that.inspectionDate,_that.inspectionNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.printLetters,_that.printLettersDate,_that.printLettersNotes,_that.supply,_that.supplyDate,_that.supplyNotes,_that.supplyAmount,_that.initialContract,_that.initialContractDate,_that.initialContractNotes,_that.supplementaryContract,_that.supplementaryContractDate,_that.supplementaryContractNotes,_that.thenToLicense,_that.thenToLicenseDate,_that.thenToLicenseNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'submit_request')  bool submitRequest, @JsonKey(name: 'submit_request_date')  DateTime? submitRequestDate, @JsonKey(name: 'submit_request_notes')  String? submitRequestNotes, @JsonKey(name: 'pay_inspection')  bool payInspection, @JsonKey(name: 'pay_inspection_date')  DateTime? payInspectionDate, @JsonKey(name: 'pay_inspection_notes')  String? payInspectionNotes, @JsonKey(name: 'inspection_amount')  double? inspectionAmount, @JsonKey(name: 'inspection_date')  DateTime? inspectionDate, @JsonKey(name: 'inspection_notes')  String? inspectionNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'print_letters')  bool printLetters, @JsonKey(name: 'print_letters_date')  DateTime? printLettersDate, @JsonKey(name: 'print_letters_notes')  String? printLettersNotes, @JsonKey(name: 'supply')  bool supply, @JsonKey(name: 'supply_date')  DateTime? supplyDate, @JsonKey(name: 'supply_notes')  String? supplyNotes, @JsonKey(name: 'supply_amount')  double? supplyAmount, @JsonKey(name: 'initial_contract')  bool initialContract, @JsonKey(name: 'initial_contract_date')  DateTime? initialContractDate, @JsonKey(name: 'initial_contract_notes')  String? initialContractNotes, @JsonKey(name: 'supplementary_contract')  bool supplementaryContract, @JsonKey(name: 'supplementary_contract_date')  DateTime? supplementaryContractDate, @JsonKey(name: 'supplementary_contract_notes')  String? supplementaryContractNotes, @JsonKey(name: 'then_to_license')  bool thenToLicense, @JsonKey(name: 'then_to_license_date')  DateTime? thenToLicenseDate, @JsonKey(name: 'then_to_license_notes')  String? thenToLicenseNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RooftopAddition() when $default != null:
return $default(_that.id,_that.customerId,_that.submitRequest,_that.submitRequestDate,_that.submitRequestNotes,_that.payInspection,_that.payInspectionDate,_that.payInspectionNotes,_that.inspectionAmount,_that.inspectionDate,_that.inspectionNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.printLetters,_that.printLettersDate,_that.printLettersNotes,_that.supply,_that.supplyDate,_that.supplyNotes,_that.supplyAmount,_that.initialContract,_that.initialContractDate,_that.initialContractNotes,_that.supplementaryContract,_that.supplementaryContractDate,_that.supplementaryContractNotes,_that.thenToLicense,_that.thenToLicenseDate,_that.thenToLicenseNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RooftopAddition extends RooftopAddition {
  const _RooftopAddition({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'submit_request') this.submitRequest = false, @JsonKey(name: 'submit_request_date') this.submitRequestDate, @JsonKey(name: 'submit_request_notes') this.submitRequestNotes, @JsonKey(name: 'pay_inspection') this.payInspection = false, @JsonKey(name: 'pay_inspection_date') this.payInspectionDate, @JsonKey(name: 'pay_inspection_notes') this.payInspectionNotes, @JsonKey(name: 'inspection_amount') this.inspectionAmount, @JsonKey(name: 'inspection_date') this.inspectionDate, @JsonKey(name: 'inspection_notes') this.inspectionNotes, @JsonKey(name: 'review_with_agency') this.reviewWithAgency = false, @JsonKey(name: 'review_with_agency_date') this.reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes') this.reviewWithAgencyNotes, @JsonKey(name: 'print_letters') this.printLetters = false, @JsonKey(name: 'print_letters_date') this.printLettersDate, @JsonKey(name: 'print_letters_notes') this.printLettersNotes, @JsonKey(name: 'supply') this.supply = false, @JsonKey(name: 'supply_date') this.supplyDate, @JsonKey(name: 'supply_notes') this.supplyNotes, @JsonKey(name: 'supply_amount') this.supplyAmount, @JsonKey(name: 'initial_contract') this.initialContract = false, @JsonKey(name: 'initial_contract_date') this.initialContractDate, @JsonKey(name: 'initial_contract_notes') this.initialContractNotes, @JsonKey(name: 'supplementary_contract') this.supplementaryContract = false, @JsonKey(name: 'supplementary_contract_date') this.supplementaryContractDate, @JsonKey(name: 'supplementary_contract_notes') this.supplementaryContractNotes, @JsonKey(name: 'then_to_license') this.thenToLicense = false, @JsonKey(name: 'then_to_license_date') this.thenToLicenseDate, @JsonKey(name: 'then_to_license_notes') this.thenToLicenseNotes, @JsonKey(name: 'stage_notes') this.stageNotes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _RooftopAddition.fromJson(Map<String, dynamic> json) => _$RooftopAdditionFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
// Step 1: التقديم علي الطلب
@override@JsonKey(name: 'submit_request') final  bool submitRequest;
@override@JsonKey(name: 'submit_request_date') final  DateTime? submitRequestDate;
@override@JsonKey(name: 'submit_request_notes') final  String? submitRequestNotes;
// Step 2: سداد المعاينة (has money field)
@override@JsonKey(name: 'pay_inspection') final  bool payInspection;
@override@JsonKey(name: 'pay_inspection_date') final  DateTime? payInspectionDate;
@override@JsonKey(name: 'pay_inspection_notes') final  String? payInspectionNotes;
@override@JsonKey(name: 'inspection_amount') final  double? inspectionAmount;
// Step 3: ميعاد المعاينة
@override@JsonKey(name: 'inspection_date') final  DateTime? inspectionDate;
@override@JsonKey(name: 'inspection_notes') final  String? inspectionNotes;
// Step 4: مراجعة مع الجهاز
@override@JsonKey(name: 'review_with_agency') final  bool reviewWithAgency;
@override@JsonKey(name: 'review_with_agency_date') final  DateTime? reviewWithAgencyDate;
@override@JsonKey(name: 'review_with_agency_notes') final  String? reviewWithAgencyNotes;
// Step 5: طباعة الجوابات (NEW)
@override@JsonKey(name: 'print_letters') final  bool printLetters;
@override@JsonKey(name: 'print_letters_date') final  DateTime? printLettersDate;
@override@JsonKey(name: 'print_letters_notes') final  String? printLettersNotes;
// Step 6: التوريد (has money field)
@override@JsonKey(name: 'supply') final  bool supply;
@override@JsonKey(name: 'supply_date') final  DateTime? supplyDate;
@override@JsonKey(name: 'supply_notes') final  String? supplyNotes;
@override@JsonKey(name: 'supply_amount') final  double? supplyAmount;
// Step 7: العقد الابتدائي
@override@JsonKey(name: 'initial_contract') final  bool initialContract;
@override@JsonKey(name: 'initial_contract_date') final  DateTime? initialContractDate;
@override@JsonKey(name: 'initial_contract_notes') final  String? initialContractNotes;
// Step 8: العقد الملحق
@override@JsonKey(name: 'supplementary_contract') final  bool supplementaryContract;
@override@JsonKey(name: 'supplementary_contract_date') final  DateTime? supplementaryContractDate;
@override@JsonKey(name: 'supplementary_contract_notes') final  String? supplementaryContractNotes;
// Step 9: وتروح بعدها للترخيص
@override@JsonKey(name: 'then_to_license') final  bool thenToLicense;
@override@JsonKey(name: 'then_to_license_date') final  DateTime? thenToLicenseDate;
@override@JsonKey(name: 'then_to_license_notes') final  String? thenToLicenseNotes;
// General stage notes
@override@JsonKey(name: 'stage_notes') final  String? stageNotes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of RooftopAddition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RooftopAdditionCopyWith<_RooftopAddition> get copyWith => __$RooftopAdditionCopyWithImpl<_RooftopAddition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RooftopAdditionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RooftopAddition&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.submitRequest, submitRequest) || other.submitRequest == submitRequest)&&(identical(other.submitRequestDate, submitRequestDate) || other.submitRequestDate == submitRequestDate)&&(identical(other.submitRequestNotes, submitRequestNotes) || other.submitRequestNotes == submitRequestNotes)&&(identical(other.payInspection, payInspection) || other.payInspection == payInspection)&&(identical(other.payInspectionDate, payInspectionDate) || other.payInspectionDate == payInspectionDate)&&(identical(other.payInspectionNotes, payInspectionNotes) || other.payInspectionNotes == payInspectionNotes)&&(identical(other.inspectionAmount, inspectionAmount) || other.inspectionAmount == inspectionAmount)&&(identical(other.inspectionDate, inspectionDate) || other.inspectionDate == inspectionDate)&&(identical(other.inspectionNotes, inspectionNotes) || other.inspectionNotes == inspectionNotes)&&(identical(other.reviewWithAgency, reviewWithAgency) || other.reviewWithAgency == reviewWithAgency)&&(identical(other.reviewWithAgencyDate, reviewWithAgencyDate) || other.reviewWithAgencyDate == reviewWithAgencyDate)&&(identical(other.reviewWithAgencyNotes, reviewWithAgencyNotes) || other.reviewWithAgencyNotes == reviewWithAgencyNotes)&&(identical(other.printLetters, printLetters) || other.printLetters == printLetters)&&(identical(other.printLettersDate, printLettersDate) || other.printLettersDate == printLettersDate)&&(identical(other.printLettersNotes, printLettersNotes) || other.printLettersNotes == printLettersNotes)&&(identical(other.supply, supply) || other.supply == supply)&&(identical(other.supplyDate, supplyDate) || other.supplyDate == supplyDate)&&(identical(other.supplyNotes, supplyNotes) || other.supplyNotes == supplyNotes)&&(identical(other.supplyAmount, supplyAmount) || other.supplyAmount == supplyAmount)&&(identical(other.initialContract, initialContract) || other.initialContract == initialContract)&&(identical(other.initialContractDate, initialContractDate) || other.initialContractDate == initialContractDate)&&(identical(other.initialContractNotes, initialContractNotes) || other.initialContractNotes == initialContractNotes)&&(identical(other.supplementaryContract, supplementaryContract) || other.supplementaryContract == supplementaryContract)&&(identical(other.supplementaryContractDate, supplementaryContractDate) || other.supplementaryContractDate == supplementaryContractDate)&&(identical(other.supplementaryContractNotes, supplementaryContractNotes) || other.supplementaryContractNotes == supplementaryContractNotes)&&(identical(other.thenToLicense, thenToLicense) || other.thenToLicense == thenToLicense)&&(identical(other.thenToLicenseDate, thenToLicenseDate) || other.thenToLicenseDate == thenToLicenseDate)&&(identical(other.thenToLicenseNotes, thenToLicenseNotes) || other.thenToLicenseNotes == thenToLicenseNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,submitRequest,submitRequestDate,submitRequestNotes,payInspection,payInspectionDate,payInspectionNotes,inspectionAmount,inspectionDate,inspectionNotes,reviewWithAgency,reviewWithAgencyDate,reviewWithAgencyNotes,printLetters,printLettersDate,printLettersNotes,supply,supplyDate,supplyNotes,supplyAmount,initialContract,initialContractDate,initialContractNotes,supplementaryContract,supplementaryContractDate,supplementaryContractNotes,thenToLicense,thenToLicenseDate,thenToLicenseNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'RooftopAddition(id: $id, customerId: $customerId, submitRequest: $submitRequest, submitRequestDate: $submitRequestDate, submitRequestNotes: $submitRequestNotes, payInspection: $payInspection, payInspectionDate: $payInspectionDate, payInspectionNotes: $payInspectionNotes, inspectionAmount: $inspectionAmount, inspectionDate: $inspectionDate, inspectionNotes: $inspectionNotes, reviewWithAgency: $reviewWithAgency, reviewWithAgencyDate: $reviewWithAgencyDate, reviewWithAgencyNotes: $reviewWithAgencyNotes, printLetters: $printLetters, printLettersDate: $printLettersDate, printLettersNotes: $printLettersNotes, supply: $supply, supplyDate: $supplyDate, supplyNotes: $supplyNotes, supplyAmount: $supplyAmount, initialContract: $initialContract, initialContractDate: $initialContractDate, initialContractNotes: $initialContractNotes, supplementaryContract: $supplementaryContract, supplementaryContractDate: $supplementaryContractDate, supplementaryContractNotes: $supplementaryContractNotes, thenToLicense: $thenToLicense, thenToLicenseDate: $thenToLicenseDate, thenToLicenseNotes: $thenToLicenseNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RooftopAdditionCopyWith<$Res> implements $RooftopAdditionCopyWith<$Res> {
  factory _$RooftopAdditionCopyWith(_RooftopAddition value, $Res Function(_RooftopAddition) _then) = __$RooftopAdditionCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'submit_request') bool submitRequest,@JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,@JsonKey(name: 'submit_request_notes') String? submitRequestNotes,@JsonKey(name: 'pay_inspection') bool payInspection,@JsonKey(name: 'pay_inspection_date') DateTime? payInspectionDate,@JsonKey(name: 'pay_inspection_notes') String? payInspectionNotes,@JsonKey(name: 'inspection_amount') double? inspectionAmount,@JsonKey(name: 'inspection_date') DateTime? inspectionDate,@JsonKey(name: 'inspection_notes') String? inspectionNotes,@JsonKey(name: 'review_with_agency') bool reviewWithAgency,@JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,@JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,@JsonKey(name: 'print_letters') bool printLetters,@JsonKey(name: 'print_letters_date') DateTime? printLettersDate,@JsonKey(name: 'print_letters_notes') String? printLettersNotes,@JsonKey(name: 'supply') bool supply,@JsonKey(name: 'supply_date') DateTime? supplyDate,@JsonKey(name: 'supply_notes') String? supplyNotes,@JsonKey(name: 'supply_amount') double? supplyAmount,@JsonKey(name: 'initial_contract') bool initialContract,@JsonKey(name: 'initial_contract_date') DateTime? initialContractDate,@JsonKey(name: 'initial_contract_notes') String? initialContractNotes,@JsonKey(name: 'supplementary_contract') bool supplementaryContract,@JsonKey(name: 'supplementary_contract_date') DateTime? supplementaryContractDate,@JsonKey(name: 'supplementary_contract_notes') String? supplementaryContractNotes,@JsonKey(name: 'then_to_license') bool thenToLicense,@JsonKey(name: 'then_to_license_date') DateTime? thenToLicenseDate,@JsonKey(name: 'then_to_license_notes') String? thenToLicenseNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$RooftopAdditionCopyWithImpl<$Res>
    implements _$RooftopAdditionCopyWith<$Res> {
  __$RooftopAdditionCopyWithImpl(this._self, this._then);

  final _RooftopAddition _self;
  final $Res Function(_RooftopAddition) _then;

/// Create a copy of RooftopAddition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? submitRequest = null,Object? submitRequestDate = freezed,Object? submitRequestNotes = freezed,Object? payInspection = null,Object? payInspectionDate = freezed,Object? payInspectionNotes = freezed,Object? inspectionAmount = freezed,Object? inspectionDate = freezed,Object? inspectionNotes = freezed,Object? reviewWithAgency = null,Object? reviewWithAgencyDate = freezed,Object? reviewWithAgencyNotes = freezed,Object? printLetters = null,Object? printLettersDate = freezed,Object? printLettersNotes = freezed,Object? supply = null,Object? supplyDate = freezed,Object? supplyNotes = freezed,Object? supplyAmount = freezed,Object? initialContract = null,Object? initialContractDate = freezed,Object? initialContractNotes = freezed,Object? supplementaryContract = null,Object? supplementaryContractDate = freezed,Object? supplementaryContractNotes = freezed,Object? thenToLicense = null,Object? thenToLicenseDate = freezed,Object? thenToLicenseNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RooftopAddition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,submitRequest: null == submitRequest ? _self.submitRequest : submitRequest // ignore: cast_nullable_to_non_nullable
as bool,submitRequestDate: freezed == submitRequestDate ? _self.submitRequestDate : submitRequestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitRequestNotes: freezed == submitRequestNotes ? _self.submitRequestNotes : submitRequestNotes // ignore: cast_nullable_to_non_nullable
as String?,payInspection: null == payInspection ? _self.payInspection : payInspection // ignore: cast_nullable_to_non_nullable
as bool,payInspectionDate: freezed == payInspectionDate ? _self.payInspectionDate : payInspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,payInspectionNotes: freezed == payInspectionNotes ? _self.payInspectionNotes : payInspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,inspectionAmount: freezed == inspectionAmount ? _self.inspectionAmount : inspectionAmount // ignore: cast_nullable_to_non_nullable
as double?,inspectionDate: freezed == inspectionDate ? _self.inspectionDate : inspectionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,inspectionNotes: freezed == inspectionNotes ? _self.inspectionNotes : inspectionNotes // ignore: cast_nullable_to_non_nullable
as String?,reviewWithAgency: null == reviewWithAgency ? _self.reviewWithAgency : reviewWithAgency // ignore: cast_nullable_to_non_nullable
as bool,reviewWithAgencyDate: freezed == reviewWithAgencyDate ? _self.reviewWithAgencyDate : reviewWithAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewWithAgencyNotes: freezed == reviewWithAgencyNotes ? _self.reviewWithAgencyNotes : reviewWithAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,printLetters: null == printLetters ? _self.printLetters : printLetters // ignore: cast_nullable_to_non_nullable
as bool,printLettersDate: freezed == printLettersDate ? _self.printLettersDate : printLettersDate // ignore: cast_nullable_to_non_nullable
as DateTime?,printLettersNotes: freezed == printLettersNotes ? _self.printLettersNotes : printLettersNotes // ignore: cast_nullable_to_non_nullable
as String?,supply: null == supply ? _self.supply : supply // ignore: cast_nullable_to_non_nullable
as bool,supplyDate: freezed == supplyDate ? _self.supplyDate : supplyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyNotes: freezed == supplyNotes ? _self.supplyNotes : supplyNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount: freezed == supplyAmount ? _self.supplyAmount : supplyAmount // ignore: cast_nullable_to_non_nullable
as double?,initialContract: null == initialContract ? _self.initialContract : initialContract // ignore: cast_nullable_to_non_nullable
as bool,initialContractDate: freezed == initialContractDate ? _self.initialContractDate : initialContractDate // ignore: cast_nullable_to_non_nullable
as DateTime?,initialContractNotes: freezed == initialContractNotes ? _self.initialContractNotes : initialContractNotes // ignore: cast_nullable_to_non_nullable
as String?,supplementaryContract: null == supplementaryContract ? _self.supplementaryContract : supplementaryContract // ignore: cast_nullable_to_non_nullable
as bool,supplementaryContractDate: freezed == supplementaryContractDate ? _self.supplementaryContractDate : supplementaryContractDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplementaryContractNotes: freezed == supplementaryContractNotes ? _self.supplementaryContractNotes : supplementaryContractNotes // ignore: cast_nullable_to_non_nullable
as String?,thenToLicense: null == thenToLicense ? _self.thenToLicense : thenToLicense // ignore: cast_nullable_to_non_nullable
as bool,thenToLicenseDate: freezed == thenToLicenseDate ? _self.thenToLicenseDate : thenToLicenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,thenToLicenseNotes: freezed == thenToLicenseNotes ? _self.thenToLicenseNotes : thenToLicenseNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
