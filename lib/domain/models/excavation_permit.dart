import 'package:freezed_annotation/freezed_annotation.dart';

part 'excavation_permit.freezed.dart';
part 'excavation_permit.g.dart';

@freezed
abstract class ExcavationPermit with _$ExcavationPermit {
  const factory ExcavationPermit({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    // Step 1: شهادة اشراف
    @Default(false) @JsonKey(name: 'supervision_certificate') bool supervisionCertificate,
    @JsonKey(name: 'supervision_certificate_date') DateTime? supervisionCertificateDate,
    @JsonKey(name: 'supervision_certificate_notes') String? supervisionCertificateNotes,

    // Step 2: عقد مقاولة
    @Default(false) @JsonKey(name: 'contract_agreement') bool contractAgreement,
    @JsonKey(name: 'contract_agreement_date') DateTime? contractAgreementDate,
    @JsonKey(name: 'contract_agreement_notes') String? contractAgreementNotes,

    // Step 3: اعتماد عقد المقاولة من النقابة
    @Default(false) @JsonKey(name: 'approve_contract_from_union') bool approveContractFromUnion,
    @JsonKey(name: 'approve_contract_from_union_date') DateTime? approveContractFromUnionDate,
    @JsonKey(name: 'approve_contract_from_union_notes') String? approveContractFromUnionNotes,

    // Step 4: توريد النقابة (has money field)
    @Default(false) @JsonKey(name: 'supply_to_union') bool supplyToUnion,
    @JsonKey(name: 'supply_to_union_date') DateTime? supplyToUnionDate,
    @JsonKey(name: 'supply_to_union_notes') String? supplyToUnionNotes,
    @JsonKey(name: 'union_supply_amount') double? unionSupplyAmount,

    // Step 5: اصدار تصريح الحفر
    @Default(false) @JsonKey(name: 'issue_excavation_permit') bool issueExcavationPermit,
    @JsonKey(name: 'issue_excavation_permit_date') DateTime? issueExcavationPermitDate,
    @JsonKey(name: 'issue_excavation_permit_notes') String? issueExcavationPermitNotes,

    // Step 6: تصريح الجيش
    @Default(false) @JsonKey(name: 'army_permit') bool armyPermit,
    @JsonKey(name: 'army_permit_date') DateTime? armyPermitDate,
    @JsonKey(name: 'army_permit_notes') String? armyPermitNotes,

    // Step 7: تصريح معدات
    @Default(false) @JsonKey(name: 'equipment_permit') bool equipmentPermit,
    @JsonKey(name: 'equipment_permit_date') DateTime? equipmentPermitDate,
    @JsonKey(name: 'equipment_permit_notes') String? equipmentPermitNotes,

    // General stage notes
    @JsonKey(name: 'stage_notes') String? stageNotes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ExcavationPermit;

  const ExcavationPermit._();

  factory ExcavationPermit.fromJson(Map<String, dynamic> json) =>
      _$ExcavationPermitFromJson(json);

  static const int totalSteps = 7;

  int get completedSteps {
    int count = 0;
    if (supervisionCertificate) count++;
    if (contractAgreement) count++;
    if (approveContractFromUnion) count++;
    if (supplyToUnion) count++;
    if (issueExcavationPermit) count++;
    if (armyPermit) count++;
    if (equipmentPermit) count++;
    return count;
  }

  double get progress => (completedSteps / totalSteps) * 100;
  bool get isComplete => completedSteps == totalSteps;
}
