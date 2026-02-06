// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'excavation_permit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExcavationPermit {

 int get id;@JsonKey(name: 'customer_id') int get customerId;// Step 1: شهادة اشراف
@JsonKey(name: 'supervision_certificate') bool get supervisionCertificate;@JsonKey(name: 'supervision_certificate_date') DateTime? get supervisionCertificateDate;@JsonKey(name: 'supervision_certificate_notes') String? get supervisionCertificateNotes;// Step 2: عقد مقاولة
@JsonKey(name: 'contract_agreement') bool get contractAgreement;@JsonKey(name: 'contract_agreement_date') DateTime? get contractAgreementDate;@JsonKey(name: 'contract_agreement_notes') String? get contractAgreementNotes;// Step 3: اعتماد عقد المقاولة من النقابة
@JsonKey(name: 'approve_contract_from_union') bool get approveContractFromUnion;@JsonKey(name: 'approve_contract_from_union_date') DateTime? get approveContractFromUnionDate;@JsonKey(name: 'approve_contract_from_union_notes') String? get approveContractFromUnionNotes;// Step 4: توريد النقابة (has money field)
@JsonKey(name: 'supply_to_union') bool get supplyToUnion;@JsonKey(name: 'supply_to_union_date') DateTime? get supplyToUnionDate;@JsonKey(name: 'supply_to_union_notes') String? get supplyToUnionNotes;@JsonKey(name: 'union_supply_amount') double? get unionSupplyAmount;// Step 5: اصدار تصريح الحفر
@JsonKey(name: 'issue_excavation_permit') bool get issueExcavationPermit;@JsonKey(name: 'issue_excavation_permit_date') DateTime? get issueExcavationPermitDate;@JsonKey(name: 'issue_excavation_permit_notes') String? get issueExcavationPermitNotes;// Step 6: تصريح الجيش
@JsonKey(name: 'army_permit') bool get armyPermit;@JsonKey(name: 'army_permit_date') DateTime? get armyPermitDate;@JsonKey(name: 'army_permit_notes') String? get armyPermitNotes;// Step 7: تصريح معدات
@JsonKey(name: 'equipment_permit') bool get equipmentPermit;@JsonKey(name: 'equipment_permit_date') DateTime? get equipmentPermitDate;@JsonKey(name: 'equipment_permit_notes') String? get equipmentPermitNotes;// General stage notes
@JsonKey(name: 'stage_notes') String? get stageNotes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ExcavationPermit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExcavationPermitCopyWith<ExcavationPermit> get copyWith => _$ExcavationPermitCopyWithImpl<ExcavationPermit>(this as ExcavationPermit, _$identity);

  /// Serializes this ExcavationPermit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExcavationPermit&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.supervisionCertificate, supervisionCertificate) || other.supervisionCertificate == supervisionCertificate)&&(identical(other.supervisionCertificateDate, supervisionCertificateDate) || other.supervisionCertificateDate == supervisionCertificateDate)&&(identical(other.supervisionCertificateNotes, supervisionCertificateNotes) || other.supervisionCertificateNotes == supervisionCertificateNotes)&&(identical(other.contractAgreement, contractAgreement) || other.contractAgreement == contractAgreement)&&(identical(other.contractAgreementDate, contractAgreementDate) || other.contractAgreementDate == contractAgreementDate)&&(identical(other.contractAgreementNotes, contractAgreementNotes) || other.contractAgreementNotes == contractAgreementNotes)&&(identical(other.approveContractFromUnion, approveContractFromUnion) || other.approveContractFromUnion == approveContractFromUnion)&&(identical(other.approveContractFromUnionDate, approveContractFromUnionDate) || other.approveContractFromUnionDate == approveContractFromUnionDate)&&(identical(other.approveContractFromUnionNotes, approveContractFromUnionNotes) || other.approveContractFromUnionNotes == approveContractFromUnionNotes)&&(identical(other.supplyToUnion, supplyToUnion) || other.supplyToUnion == supplyToUnion)&&(identical(other.supplyToUnionDate, supplyToUnionDate) || other.supplyToUnionDate == supplyToUnionDate)&&(identical(other.supplyToUnionNotes, supplyToUnionNotes) || other.supplyToUnionNotes == supplyToUnionNotes)&&(identical(other.unionSupplyAmount, unionSupplyAmount) || other.unionSupplyAmount == unionSupplyAmount)&&(identical(other.issueExcavationPermit, issueExcavationPermit) || other.issueExcavationPermit == issueExcavationPermit)&&(identical(other.issueExcavationPermitDate, issueExcavationPermitDate) || other.issueExcavationPermitDate == issueExcavationPermitDate)&&(identical(other.issueExcavationPermitNotes, issueExcavationPermitNotes) || other.issueExcavationPermitNotes == issueExcavationPermitNotes)&&(identical(other.armyPermit, armyPermit) || other.armyPermit == armyPermit)&&(identical(other.armyPermitDate, armyPermitDate) || other.armyPermitDate == armyPermitDate)&&(identical(other.armyPermitNotes, armyPermitNotes) || other.armyPermitNotes == armyPermitNotes)&&(identical(other.equipmentPermit, equipmentPermit) || other.equipmentPermit == equipmentPermit)&&(identical(other.equipmentPermitDate, equipmentPermitDate) || other.equipmentPermitDate == equipmentPermitDate)&&(identical(other.equipmentPermitNotes, equipmentPermitNotes) || other.equipmentPermitNotes == equipmentPermitNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,supervisionCertificate,supervisionCertificateDate,supervisionCertificateNotes,contractAgreement,contractAgreementDate,contractAgreementNotes,approveContractFromUnion,approveContractFromUnionDate,approveContractFromUnionNotes,supplyToUnion,supplyToUnionDate,supplyToUnionNotes,unionSupplyAmount,issueExcavationPermit,issueExcavationPermitDate,issueExcavationPermitNotes,armyPermit,armyPermitDate,armyPermitNotes,equipmentPermit,equipmentPermitDate,equipmentPermitNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'ExcavationPermit(id: $id, customerId: $customerId, supervisionCertificate: $supervisionCertificate, supervisionCertificateDate: $supervisionCertificateDate, supervisionCertificateNotes: $supervisionCertificateNotes, contractAgreement: $contractAgreement, contractAgreementDate: $contractAgreementDate, contractAgreementNotes: $contractAgreementNotes, approveContractFromUnion: $approveContractFromUnion, approveContractFromUnionDate: $approveContractFromUnionDate, approveContractFromUnionNotes: $approveContractFromUnionNotes, supplyToUnion: $supplyToUnion, supplyToUnionDate: $supplyToUnionDate, supplyToUnionNotes: $supplyToUnionNotes, unionSupplyAmount: $unionSupplyAmount, issueExcavationPermit: $issueExcavationPermit, issueExcavationPermitDate: $issueExcavationPermitDate, issueExcavationPermitNotes: $issueExcavationPermitNotes, armyPermit: $armyPermit, armyPermitDate: $armyPermitDate, armyPermitNotes: $armyPermitNotes, equipmentPermit: $equipmentPermit, equipmentPermitDate: $equipmentPermitDate, equipmentPermitNotes: $equipmentPermitNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ExcavationPermitCopyWith<$Res>  {
  factory $ExcavationPermitCopyWith(ExcavationPermit value, $Res Function(ExcavationPermit) _then) = _$ExcavationPermitCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'supervision_certificate') bool supervisionCertificate,@JsonKey(name: 'supervision_certificate_date') DateTime? supervisionCertificateDate,@JsonKey(name: 'supervision_certificate_notes') String? supervisionCertificateNotes,@JsonKey(name: 'contract_agreement') bool contractAgreement,@JsonKey(name: 'contract_agreement_date') DateTime? contractAgreementDate,@JsonKey(name: 'contract_agreement_notes') String? contractAgreementNotes,@JsonKey(name: 'approve_contract_from_union') bool approveContractFromUnion,@JsonKey(name: 'approve_contract_from_union_date') DateTime? approveContractFromUnionDate,@JsonKey(name: 'approve_contract_from_union_notes') String? approveContractFromUnionNotes,@JsonKey(name: 'supply_to_union') bool supplyToUnion,@JsonKey(name: 'supply_to_union_date') DateTime? supplyToUnionDate,@JsonKey(name: 'supply_to_union_notes') String? supplyToUnionNotes,@JsonKey(name: 'union_supply_amount') double? unionSupplyAmount,@JsonKey(name: 'issue_excavation_permit') bool issueExcavationPermit,@JsonKey(name: 'issue_excavation_permit_date') DateTime? issueExcavationPermitDate,@JsonKey(name: 'issue_excavation_permit_notes') String? issueExcavationPermitNotes,@JsonKey(name: 'army_permit') bool armyPermit,@JsonKey(name: 'army_permit_date') DateTime? armyPermitDate,@JsonKey(name: 'army_permit_notes') String? armyPermitNotes,@JsonKey(name: 'equipment_permit') bool equipmentPermit,@JsonKey(name: 'equipment_permit_date') DateTime? equipmentPermitDate,@JsonKey(name: 'equipment_permit_notes') String? equipmentPermitNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ExcavationPermitCopyWithImpl<$Res>
    implements $ExcavationPermitCopyWith<$Res> {
  _$ExcavationPermitCopyWithImpl(this._self, this._then);

  final ExcavationPermit _self;
  final $Res Function(ExcavationPermit) _then;

/// Create a copy of ExcavationPermit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? supervisionCertificate = null,Object? supervisionCertificateDate = freezed,Object? supervisionCertificateNotes = freezed,Object? contractAgreement = null,Object? contractAgreementDate = freezed,Object? contractAgreementNotes = freezed,Object? approveContractFromUnion = null,Object? approveContractFromUnionDate = freezed,Object? approveContractFromUnionNotes = freezed,Object? supplyToUnion = null,Object? supplyToUnionDate = freezed,Object? supplyToUnionNotes = freezed,Object? unionSupplyAmount = freezed,Object? issueExcavationPermit = null,Object? issueExcavationPermitDate = freezed,Object? issueExcavationPermitNotes = freezed,Object? armyPermit = null,Object? armyPermitDate = freezed,Object? armyPermitNotes = freezed,Object? equipmentPermit = null,Object? equipmentPermitDate = freezed,Object? equipmentPermitNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,supervisionCertificate: null == supervisionCertificate ? _self.supervisionCertificate : supervisionCertificate // ignore: cast_nullable_to_non_nullable
as bool,supervisionCertificateDate: freezed == supervisionCertificateDate ? _self.supervisionCertificateDate : supervisionCertificateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supervisionCertificateNotes: freezed == supervisionCertificateNotes ? _self.supervisionCertificateNotes : supervisionCertificateNotes // ignore: cast_nullable_to_non_nullable
as String?,contractAgreement: null == contractAgreement ? _self.contractAgreement : contractAgreement // ignore: cast_nullable_to_non_nullable
as bool,contractAgreementDate: freezed == contractAgreementDate ? _self.contractAgreementDate : contractAgreementDate // ignore: cast_nullable_to_non_nullable
as DateTime?,contractAgreementNotes: freezed == contractAgreementNotes ? _self.contractAgreementNotes : contractAgreementNotes // ignore: cast_nullable_to_non_nullable
as String?,approveContractFromUnion: null == approveContractFromUnion ? _self.approveContractFromUnion : approveContractFromUnion // ignore: cast_nullable_to_non_nullable
as bool,approveContractFromUnionDate: freezed == approveContractFromUnionDate ? _self.approveContractFromUnionDate : approveContractFromUnionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approveContractFromUnionNotes: freezed == approveContractFromUnionNotes ? _self.approveContractFromUnionNotes : approveContractFromUnionNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyToUnion: null == supplyToUnion ? _self.supplyToUnion : supplyToUnion // ignore: cast_nullable_to_non_nullable
as bool,supplyToUnionDate: freezed == supplyToUnionDate ? _self.supplyToUnionDate : supplyToUnionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyToUnionNotes: freezed == supplyToUnionNotes ? _self.supplyToUnionNotes : supplyToUnionNotes // ignore: cast_nullable_to_non_nullable
as String?,unionSupplyAmount: freezed == unionSupplyAmount ? _self.unionSupplyAmount : unionSupplyAmount // ignore: cast_nullable_to_non_nullable
as double?,issueExcavationPermit: null == issueExcavationPermit ? _self.issueExcavationPermit : issueExcavationPermit // ignore: cast_nullable_to_non_nullable
as bool,issueExcavationPermitDate: freezed == issueExcavationPermitDate ? _self.issueExcavationPermitDate : issueExcavationPermitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,issueExcavationPermitNotes: freezed == issueExcavationPermitNotes ? _self.issueExcavationPermitNotes : issueExcavationPermitNotes // ignore: cast_nullable_to_non_nullable
as String?,armyPermit: null == armyPermit ? _self.armyPermit : armyPermit // ignore: cast_nullable_to_non_nullable
as bool,armyPermitDate: freezed == armyPermitDate ? _self.armyPermitDate : armyPermitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,armyPermitNotes: freezed == armyPermitNotes ? _self.armyPermitNotes : armyPermitNotes // ignore: cast_nullable_to_non_nullable
as String?,equipmentPermit: null == equipmentPermit ? _self.equipmentPermit : equipmentPermit // ignore: cast_nullable_to_non_nullable
as bool,equipmentPermitDate: freezed == equipmentPermitDate ? _self.equipmentPermitDate : equipmentPermitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,equipmentPermitNotes: freezed == equipmentPermitNotes ? _self.equipmentPermitNotes : equipmentPermitNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ExcavationPermit].
extension ExcavationPermitPatterns on ExcavationPermit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExcavationPermit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExcavationPermit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExcavationPermit value)  $default,){
final _that = this;
switch (_that) {
case _ExcavationPermit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExcavationPermit value)?  $default,){
final _that = this;
switch (_that) {
case _ExcavationPermit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'supervision_certificate')  bool supervisionCertificate, @JsonKey(name: 'supervision_certificate_date')  DateTime? supervisionCertificateDate, @JsonKey(name: 'supervision_certificate_notes')  String? supervisionCertificateNotes, @JsonKey(name: 'contract_agreement')  bool contractAgreement, @JsonKey(name: 'contract_agreement_date')  DateTime? contractAgreementDate, @JsonKey(name: 'contract_agreement_notes')  String? contractAgreementNotes, @JsonKey(name: 'approve_contract_from_union')  bool approveContractFromUnion, @JsonKey(name: 'approve_contract_from_union_date')  DateTime? approveContractFromUnionDate, @JsonKey(name: 'approve_contract_from_union_notes')  String? approveContractFromUnionNotes, @JsonKey(name: 'supply_to_union')  bool supplyToUnion, @JsonKey(name: 'supply_to_union_date')  DateTime? supplyToUnionDate, @JsonKey(name: 'supply_to_union_notes')  String? supplyToUnionNotes, @JsonKey(name: 'union_supply_amount')  double? unionSupplyAmount, @JsonKey(name: 'issue_excavation_permit')  bool issueExcavationPermit, @JsonKey(name: 'issue_excavation_permit_date')  DateTime? issueExcavationPermitDate, @JsonKey(name: 'issue_excavation_permit_notes')  String? issueExcavationPermitNotes, @JsonKey(name: 'army_permit')  bool armyPermit, @JsonKey(name: 'army_permit_date')  DateTime? armyPermitDate, @JsonKey(name: 'army_permit_notes')  String? armyPermitNotes, @JsonKey(name: 'equipment_permit')  bool equipmentPermit, @JsonKey(name: 'equipment_permit_date')  DateTime? equipmentPermitDate, @JsonKey(name: 'equipment_permit_notes')  String? equipmentPermitNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExcavationPermit() when $default != null:
return $default(_that.id,_that.customerId,_that.supervisionCertificate,_that.supervisionCertificateDate,_that.supervisionCertificateNotes,_that.contractAgreement,_that.contractAgreementDate,_that.contractAgreementNotes,_that.approveContractFromUnion,_that.approveContractFromUnionDate,_that.approveContractFromUnionNotes,_that.supplyToUnion,_that.supplyToUnionDate,_that.supplyToUnionNotes,_that.unionSupplyAmount,_that.issueExcavationPermit,_that.issueExcavationPermitDate,_that.issueExcavationPermitNotes,_that.armyPermit,_that.armyPermitDate,_that.armyPermitNotes,_that.equipmentPermit,_that.equipmentPermitDate,_that.equipmentPermitNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'supervision_certificate')  bool supervisionCertificate, @JsonKey(name: 'supervision_certificate_date')  DateTime? supervisionCertificateDate, @JsonKey(name: 'supervision_certificate_notes')  String? supervisionCertificateNotes, @JsonKey(name: 'contract_agreement')  bool contractAgreement, @JsonKey(name: 'contract_agreement_date')  DateTime? contractAgreementDate, @JsonKey(name: 'contract_agreement_notes')  String? contractAgreementNotes, @JsonKey(name: 'approve_contract_from_union')  bool approveContractFromUnion, @JsonKey(name: 'approve_contract_from_union_date')  DateTime? approveContractFromUnionDate, @JsonKey(name: 'approve_contract_from_union_notes')  String? approveContractFromUnionNotes, @JsonKey(name: 'supply_to_union')  bool supplyToUnion, @JsonKey(name: 'supply_to_union_date')  DateTime? supplyToUnionDate, @JsonKey(name: 'supply_to_union_notes')  String? supplyToUnionNotes, @JsonKey(name: 'union_supply_amount')  double? unionSupplyAmount, @JsonKey(name: 'issue_excavation_permit')  bool issueExcavationPermit, @JsonKey(name: 'issue_excavation_permit_date')  DateTime? issueExcavationPermitDate, @JsonKey(name: 'issue_excavation_permit_notes')  String? issueExcavationPermitNotes, @JsonKey(name: 'army_permit')  bool armyPermit, @JsonKey(name: 'army_permit_date')  DateTime? armyPermitDate, @JsonKey(name: 'army_permit_notes')  String? armyPermitNotes, @JsonKey(name: 'equipment_permit')  bool equipmentPermit, @JsonKey(name: 'equipment_permit_date')  DateTime? equipmentPermitDate, @JsonKey(name: 'equipment_permit_notes')  String? equipmentPermitNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ExcavationPermit():
return $default(_that.id,_that.customerId,_that.supervisionCertificate,_that.supervisionCertificateDate,_that.supervisionCertificateNotes,_that.contractAgreement,_that.contractAgreementDate,_that.contractAgreementNotes,_that.approveContractFromUnion,_that.approveContractFromUnionDate,_that.approveContractFromUnionNotes,_that.supplyToUnion,_that.supplyToUnionDate,_that.supplyToUnionNotes,_that.unionSupplyAmount,_that.issueExcavationPermit,_that.issueExcavationPermitDate,_that.issueExcavationPermitNotes,_that.armyPermit,_that.armyPermitDate,_that.armyPermitNotes,_that.equipmentPermit,_that.equipmentPermitDate,_that.equipmentPermitNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'supervision_certificate')  bool supervisionCertificate, @JsonKey(name: 'supervision_certificate_date')  DateTime? supervisionCertificateDate, @JsonKey(name: 'supervision_certificate_notes')  String? supervisionCertificateNotes, @JsonKey(name: 'contract_agreement')  bool contractAgreement, @JsonKey(name: 'contract_agreement_date')  DateTime? contractAgreementDate, @JsonKey(name: 'contract_agreement_notes')  String? contractAgreementNotes, @JsonKey(name: 'approve_contract_from_union')  bool approveContractFromUnion, @JsonKey(name: 'approve_contract_from_union_date')  DateTime? approveContractFromUnionDate, @JsonKey(name: 'approve_contract_from_union_notes')  String? approveContractFromUnionNotes, @JsonKey(name: 'supply_to_union')  bool supplyToUnion, @JsonKey(name: 'supply_to_union_date')  DateTime? supplyToUnionDate, @JsonKey(name: 'supply_to_union_notes')  String? supplyToUnionNotes, @JsonKey(name: 'union_supply_amount')  double? unionSupplyAmount, @JsonKey(name: 'issue_excavation_permit')  bool issueExcavationPermit, @JsonKey(name: 'issue_excavation_permit_date')  DateTime? issueExcavationPermitDate, @JsonKey(name: 'issue_excavation_permit_notes')  String? issueExcavationPermitNotes, @JsonKey(name: 'army_permit')  bool armyPermit, @JsonKey(name: 'army_permit_date')  DateTime? armyPermitDate, @JsonKey(name: 'army_permit_notes')  String? armyPermitNotes, @JsonKey(name: 'equipment_permit')  bool equipmentPermit, @JsonKey(name: 'equipment_permit_date')  DateTime? equipmentPermitDate, @JsonKey(name: 'equipment_permit_notes')  String? equipmentPermitNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ExcavationPermit() when $default != null:
return $default(_that.id,_that.customerId,_that.supervisionCertificate,_that.supervisionCertificateDate,_that.supervisionCertificateNotes,_that.contractAgreement,_that.contractAgreementDate,_that.contractAgreementNotes,_that.approveContractFromUnion,_that.approveContractFromUnionDate,_that.approveContractFromUnionNotes,_that.supplyToUnion,_that.supplyToUnionDate,_that.supplyToUnionNotes,_that.unionSupplyAmount,_that.issueExcavationPermit,_that.issueExcavationPermitDate,_that.issueExcavationPermitNotes,_that.armyPermit,_that.armyPermitDate,_that.armyPermitNotes,_that.equipmentPermit,_that.equipmentPermitDate,_that.equipmentPermitNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExcavationPermit extends ExcavationPermit {
  const _ExcavationPermit({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'supervision_certificate') this.supervisionCertificate = false, @JsonKey(name: 'supervision_certificate_date') this.supervisionCertificateDate, @JsonKey(name: 'supervision_certificate_notes') this.supervisionCertificateNotes, @JsonKey(name: 'contract_agreement') this.contractAgreement = false, @JsonKey(name: 'contract_agreement_date') this.contractAgreementDate, @JsonKey(name: 'contract_agreement_notes') this.contractAgreementNotes, @JsonKey(name: 'approve_contract_from_union') this.approveContractFromUnion = false, @JsonKey(name: 'approve_contract_from_union_date') this.approveContractFromUnionDate, @JsonKey(name: 'approve_contract_from_union_notes') this.approveContractFromUnionNotes, @JsonKey(name: 'supply_to_union') this.supplyToUnion = false, @JsonKey(name: 'supply_to_union_date') this.supplyToUnionDate, @JsonKey(name: 'supply_to_union_notes') this.supplyToUnionNotes, @JsonKey(name: 'union_supply_amount') this.unionSupplyAmount, @JsonKey(name: 'issue_excavation_permit') this.issueExcavationPermit = false, @JsonKey(name: 'issue_excavation_permit_date') this.issueExcavationPermitDate, @JsonKey(name: 'issue_excavation_permit_notes') this.issueExcavationPermitNotes, @JsonKey(name: 'army_permit') this.armyPermit = false, @JsonKey(name: 'army_permit_date') this.armyPermitDate, @JsonKey(name: 'army_permit_notes') this.armyPermitNotes, @JsonKey(name: 'equipment_permit') this.equipmentPermit = false, @JsonKey(name: 'equipment_permit_date') this.equipmentPermitDate, @JsonKey(name: 'equipment_permit_notes') this.equipmentPermitNotes, @JsonKey(name: 'stage_notes') this.stageNotes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _ExcavationPermit.fromJson(Map<String, dynamic> json) => _$ExcavationPermitFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
// Step 1: شهادة اشراف
@override@JsonKey(name: 'supervision_certificate') final  bool supervisionCertificate;
@override@JsonKey(name: 'supervision_certificate_date') final  DateTime? supervisionCertificateDate;
@override@JsonKey(name: 'supervision_certificate_notes') final  String? supervisionCertificateNotes;
// Step 2: عقد مقاولة
@override@JsonKey(name: 'contract_agreement') final  bool contractAgreement;
@override@JsonKey(name: 'contract_agreement_date') final  DateTime? contractAgreementDate;
@override@JsonKey(name: 'contract_agreement_notes') final  String? contractAgreementNotes;
// Step 3: اعتماد عقد المقاولة من النقابة
@override@JsonKey(name: 'approve_contract_from_union') final  bool approveContractFromUnion;
@override@JsonKey(name: 'approve_contract_from_union_date') final  DateTime? approveContractFromUnionDate;
@override@JsonKey(name: 'approve_contract_from_union_notes') final  String? approveContractFromUnionNotes;
// Step 4: توريد النقابة (has money field)
@override@JsonKey(name: 'supply_to_union') final  bool supplyToUnion;
@override@JsonKey(name: 'supply_to_union_date') final  DateTime? supplyToUnionDate;
@override@JsonKey(name: 'supply_to_union_notes') final  String? supplyToUnionNotes;
@override@JsonKey(name: 'union_supply_amount') final  double? unionSupplyAmount;
// Step 5: اصدار تصريح الحفر
@override@JsonKey(name: 'issue_excavation_permit') final  bool issueExcavationPermit;
@override@JsonKey(name: 'issue_excavation_permit_date') final  DateTime? issueExcavationPermitDate;
@override@JsonKey(name: 'issue_excavation_permit_notes') final  String? issueExcavationPermitNotes;
// Step 6: تصريح الجيش
@override@JsonKey(name: 'army_permit') final  bool armyPermit;
@override@JsonKey(name: 'army_permit_date') final  DateTime? armyPermitDate;
@override@JsonKey(name: 'army_permit_notes') final  String? armyPermitNotes;
// Step 7: تصريح معدات
@override@JsonKey(name: 'equipment_permit') final  bool equipmentPermit;
@override@JsonKey(name: 'equipment_permit_date') final  DateTime? equipmentPermitDate;
@override@JsonKey(name: 'equipment_permit_notes') final  String? equipmentPermitNotes;
// General stage notes
@override@JsonKey(name: 'stage_notes') final  String? stageNotes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ExcavationPermit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExcavationPermitCopyWith<_ExcavationPermit> get copyWith => __$ExcavationPermitCopyWithImpl<_ExcavationPermit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExcavationPermitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExcavationPermit&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.supervisionCertificate, supervisionCertificate) || other.supervisionCertificate == supervisionCertificate)&&(identical(other.supervisionCertificateDate, supervisionCertificateDate) || other.supervisionCertificateDate == supervisionCertificateDate)&&(identical(other.supervisionCertificateNotes, supervisionCertificateNotes) || other.supervisionCertificateNotes == supervisionCertificateNotes)&&(identical(other.contractAgreement, contractAgreement) || other.contractAgreement == contractAgreement)&&(identical(other.contractAgreementDate, contractAgreementDate) || other.contractAgreementDate == contractAgreementDate)&&(identical(other.contractAgreementNotes, contractAgreementNotes) || other.contractAgreementNotes == contractAgreementNotes)&&(identical(other.approveContractFromUnion, approveContractFromUnion) || other.approveContractFromUnion == approveContractFromUnion)&&(identical(other.approveContractFromUnionDate, approveContractFromUnionDate) || other.approveContractFromUnionDate == approveContractFromUnionDate)&&(identical(other.approveContractFromUnionNotes, approveContractFromUnionNotes) || other.approveContractFromUnionNotes == approveContractFromUnionNotes)&&(identical(other.supplyToUnion, supplyToUnion) || other.supplyToUnion == supplyToUnion)&&(identical(other.supplyToUnionDate, supplyToUnionDate) || other.supplyToUnionDate == supplyToUnionDate)&&(identical(other.supplyToUnionNotes, supplyToUnionNotes) || other.supplyToUnionNotes == supplyToUnionNotes)&&(identical(other.unionSupplyAmount, unionSupplyAmount) || other.unionSupplyAmount == unionSupplyAmount)&&(identical(other.issueExcavationPermit, issueExcavationPermit) || other.issueExcavationPermit == issueExcavationPermit)&&(identical(other.issueExcavationPermitDate, issueExcavationPermitDate) || other.issueExcavationPermitDate == issueExcavationPermitDate)&&(identical(other.issueExcavationPermitNotes, issueExcavationPermitNotes) || other.issueExcavationPermitNotes == issueExcavationPermitNotes)&&(identical(other.armyPermit, armyPermit) || other.armyPermit == armyPermit)&&(identical(other.armyPermitDate, armyPermitDate) || other.armyPermitDate == armyPermitDate)&&(identical(other.armyPermitNotes, armyPermitNotes) || other.armyPermitNotes == armyPermitNotes)&&(identical(other.equipmentPermit, equipmentPermit) || other.equipmentPermit == equipmentPermit)&&(identical(other.equipmentPermitDate, equipmentPermitDate) || other.equipmentPermitDate == equipmentPermitDate)&&(identical(other.equipmentPermitNotes, equipmentPermitNotes) || other.equipmentPermitNotes == equipmentPermitNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,supervisionCertificate,supervisionCertificateDate,supervisionCertificateNotes,contractAgreement,contractAgreementDate,contractAgreementNotes,approveContractFromUnion,approveContractFromUnionDate,approveContractFromUnionNotes,supplyToUnion,supplyToUnionDate,supplyToUnionNotes,unionSupplyAmount,issueExcavationPermit,issueExcavationPermitDate,issueExcavationPermitNotes,armyPermit,armyPermitDate,armyPermitNotes,equipmentPermit,equipmentPermitDate,equipmentPermitNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'ExcavationPermit(id: $id, customerId: $customerId, supervisionCertificate: $supervisionCertificate, supervisionCertificateDate: $supervisionCertificateDate, supervisionCertificateNotes: $supervisionCertificateNotes, contractAgreement: $contractAgreement, contractAgreementDate: $contractAgreementDate, contractAgreementNotes: $contractAgreementNotes, approveContractFromUnion: $approveContractFromUnion, approveContractFromUnionDate: $approveContractFromUnionDate, approveContractFromUnionNotes: $approveContractFromUnionNotes, supplyToUnion: $supplyToUnion, supplyToUnionDate: $supplyToUnionDate, supplyToUnionNotes: $supplyToUnionNotes, unionSupplyAmount: $unionSupplyAmount, issueExcavationPermit: $issueExcavationPermit, issueExcavationPermitDate: $issueExcavationPermitDate, issueExcavationPermitNotes: $issueExcavationPermitNotes, armyPermit: $armyPermit, armyPermitDate: $armyPermitDate, armyPermitNotes: $armyPermitNotes, equipmentPermit: $equipmentPermit, equipmentPermitDate: $equipmentPermitDate, equipmentPermitNotes: $equipmentPermitNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ExcavationPermitCopyWith<$Res> implements $ExcavationPermitCopyWith<$Res> {
  factory _$ExcavationPermitCopyWith(_ExcavationPermit value, $Res Function(_ExcavationPermit) _then) = __$ExcavationPermitCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'supervision_certificate') bool supervisionCertificate,@JsonKey(name: 'supervision_certificate_date') DateTime? supervisionCertificateDate,@JsonKey(name: 'supervision_certificate_notes') String? supervisionCertificateNotes,@JsonKey(name: 'contract_agreement') bool contractAgreement,@JsonKey(name: 'contract_agreement_date') DateTime? contractAgreementDate,@JsonKey(name: 'contract_agreement_notes') String? contractAgreementNotes,@JsonKey(name: 'approve_contract_from_union') bool approveContractFromUnion,@JsonKey(name: 'approve_contract_from_union_date') DateTime? approveContractFromUnionDate,@JsonKey(name: 'approve_contract_from_union_notes') String? approveContractFromUnionNotes,@JsonKey(name: 'supply_to_union') bool supplyToUnion,@JsonKey(name: 'supply_to_union_date') DateTime? supplyToUnionDate,@JsonKey(name: 'supply_to_union_notes') String? supplyToUnionNotes,@JsonKey(name: 'union_supply_amount') double? unionSupplyAmount,@JsonKey(name: 'issue_excavation_permit') bool issueExcavationPermit,@JsonKey(name: 'issue_excavation_permit_date') DateTime? issueExcavationPermitDate,@JsonKey(name: 'issue_excavation_permit_notes') String? issueExcavationPermitNotes,@JsonKey(name: 'army_permit') bool armyPermit,@JsonKey(name: 'army_permit_date') DateTime? armyPermitDate,@JsonKey(name: 'army_permit_notes') String? armyPermitNotes,@JsonKey(name: 'equipment_permit') bool equipmentPermit,@JsonKey(name: 'equipment_permit_date') DateTime? equipmentPermitDate,@JsonKey(name: 'equipment_permit_notes') String? equipmentPermitNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ExcavationPermitCopyWithImpl<$Res>
    implements _$ExcavationPermitCopyWith<$Res> {
  __$ExcavationPermitCopyWithImpl(this._self, this._then);

  final _ExcavationPermit _self;
  final $Res Function(_ExcavationPermit) _then;

/// Create a copy of ExcavationPermit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? supervisionCertificate = null,Object? supervisionCertificateDate = freezed,Object? supervisionCertificateNotes = freezed,Object? contractAgreement = null,Object? contractAgreementDate = freezed,Object? contractAgreementNotes = freezed,Object? approveContractFromUnion = null,Object? approveContractFromUnionDate = freezed,Object? approveContractFromUnionNotes = freezed,Object? supplyToUnion = null,Object? supplyToUnionDate = freezed,Object? supplyToUnionNotes = freezed,Object? unionSupplyAmount = freezed,Object? issueExcavationPermit = null,Object? issueExcavationPermitDate = freezed,Object? issueExcavationPermitNotes = freezed,Object? armyPermit = null,Object? armyPermitDate = freezed,Object? armyPermitNotes = freezed,Object? equipmentPermit = null,Object? equipmentPermitDate = freezed,Object? equipmentPermitNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ExcavationPermit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,supervisionCertificate: null == supervisionCertificate ? _self.supervisionCertificate : supervisionCertificate // ignore: cast_nullable_to_non_nullable
as bool,supervisionCertificateDate: freezed == supervisionCertificateDate ? _self.supervisionCertificateDate : supervisionCertificateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supervisionCertificateNotes: freezed == supervisionCertificateNotes ? _self.supervisionCertificateNotes : supervisionCertificateNotes // ignore: cast_nullable_to_non_nullable
as String?,contractAgreement: null == contractAgreement ? _self.contractAgreement : contractAgreement // ignore: cast_nullable_to_non_nullable
as bool,contractAgreementDate: freezed == contractAgreementDate ? _self.contractAgreementDate : contractAgreementDate // ignore: cast_nullable_to_non_nullable
as DateTime?,contractAgreementNotes: freezed == contractAgreementNotes ? _self.contractAgreementNotes : contractAgreementNotes // ignore: cast_nullable_to_non_nullable
as String?,approveContractFromUnion: null == approveContractFromUnion ? _self.approveContractFromUnion : approveContractFromUnion // ignore: cast_nullable_to_non_nullable
as bool,approveContractFromUnionDate: freezed == approveContractFromUnionDate ? _self.approveContractFromUnionDate : approveContractFromUnionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approveContractFromUnionNotes: freezed == approveContractFromUnionNotes ? _self.approveContractFromUnionNotes : approveContractFromUnionNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyToUnion: null == supplyToUnion ? _self.supplyToUnion : supplyToUnion // ignore: cast_nullable_to_non_nullable
as bool,supplyToUnionDate: freezed == supplyToUnionDate ? _self.supplyToUnionDate : supplyToUnionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyToUnionNotes: freezed == supplyToUnionNotes ? _self.supplyToUnionNotes : supplyToUnionNotes // ignore: cast_nullable_to_non_nullable
as String?,unionSupplyAmount: freezed == unionSupplyAmount ? _self.unionSupplyAmount : unionSupplyAmount // ignore: cast_nullable_to_non_nullable
as double?,issueExcavationPermit: null == issueExcavationPermit ? _self.issueExcavationPermit : issueExcavationPermit // ignore: cast_nullable_to_non_nullable
as bool,issueExcavationPermitDate: freezed == issueExcavationPermitDate ? _self.issueExcavationPermitDate : issueExcavationPermitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,issueExcavationPermitNotes: freezed == issueExcavationPermitNotes ? _self.issueExcavationPermitNotes : issueExcavationPermitNotes // ignore: cast_nullable_to_non_nullable
as String?,armyPermit: null == armyPermit ? _self.armyPermit : armyPermit // ignore: cast_nullable_to_non_nullable
as bool,armyPermitDate: freezed == armyPermitDate ? _self.armyPermitDate : armyPermitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,armyPermitNotes: freezed == armyPermitNotes ? _self.armyPermitNotes : armyPermitNotes // ignore: cast_nullable_to_non_nullable
as String?,equipmentPermit: null == equipmentPermit ? _self.equipmentPermit : equipmentPermit // ignore: cast_nullable_to_non_nullable
as bool,equipmentPermitDate: freezed == equipmentPermitDate ? _self.equipmentPermitDate : equipmentPermitDate // ignore: cast_nullable_to_non_nullable
as DateTime?,equipmentPermitNotes: freezed == equipmentPermitNotes ? _self.equipmentPermitNotes : equipmentPermitNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
