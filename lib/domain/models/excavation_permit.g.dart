// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excavation_permit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExcavationPermit _$ExcavationPermitFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ExcavationPermit',
      json,
      ($checkedConvert) {
        final val = _ExcavationPermit(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
          supervisionCertificate: $checkedConvert(
            'supervision_certificate',
            (v) => v as bool? ?? false,
          ),
          supervisionCertificateDate: $checkedConvert(
            'supervision_certificate_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          supervisionCertificateNotes: $checkedConvert(
            'supervision_certificate_notes',
            (v) => v as String?,
          ),
          contractAgreement: $checkedConvert(
            'contract_agreement',
            (v) => v as bool? ?? false,
          ),
          contractAgreementDate: $checkedConvert(
            'contract_agreement_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          contractAgreementNotes: $checkedConvert(
            'contract_agreement_notes',
            (v) => v as String?,
          ),
          approveContractFromUnion: $checkedConvert(
            'approve_contract_from_union',
            (v) => v as bool? ?? false,
          ),
          approveContractFromUnionDate: $checkedConvert(
            'approve_contract_from_union_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          approveContractFromUnionNotes: $checkedConvert(
            'approve_contract_from_union_notes',
            (v) => v as String?,
          ),
          supplyToUnion: $checkedConvert(
            'supply_to_union',
            (v) => v as bool? ?? false,
          ),
          supplyToUnionDate: $checkedConvert(
            'supply_to_union_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          supplyToUnionNotes: $checkedConvert(
            'supply_to_union_notes',
            (v) => v as String?,
          ),
          unionSupplyAmount: $checkedConvert(
            'union_supply_amount',
            (v) => (v as num?)?.toDouble(),
          ),
          issueExcavationPermit: $checkedConvert(
            'issue_excavation_permit',
            (v) => v as bool? ?? false,
          ),
          issueExcavationPermitDate: $checkedConvert(
            'issue_excavation_permit_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          issueExcavationPermitNotes: $checkedConvert(
            'issue_excavation_permit_notes',
            (v) => v as String?,
          ),
          armyPermit: $checkedConvert(
            'army_permit',
            (v) => v as bool? ?? false,
          ),
          armyPermitDate: $checkedConvert(
            'army_permit_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          armyPermitNotes: $checkedConvert(
            'army_permit_notes',
            (v) => v as String?,
          ),
          equipmentPermit: $checkedConvert(
            'equipment_permit',
            (v) => v as bool? ?? false,
          ),
          equipmentPermitDate: $checkedConvert(
            'equipment_permit_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          equipmentPermitNotes: $checkedConvert(
            'equipment_permit_notes',
            (v) => v as String?,
          ),
          stageNotes: $checkedConvert('stage_notes', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'customerId': 'customer_id',
        'supervisionCertificate': 'supervision_certificate',
        'supervisionCertificateDate': 'supervision_certificate_date',
        'supervisionCertificateNotes': 'supervision_certificate_notes',
        'contractAgreement': 'contract_agreement',
        'contractAgreementDate': 'contract_agreement_date',
        'contractAgreementNotes': 'contract_agreement_notes',
        'approveContractFromUnion': 'approve_contract_from_union',
        'approveContractFromUnionDate': 'approve_contract_from_union_date',
        'approveContractFromUnionNotes': 'approve_contract_from_union_notes',
        'supplyToUnion': 'supply_to_union',
        'supplyToUnionDate': 'supply_to_union_date',
        'supplyToUnionNotes': 'supply_to_union_notes',
        'unionSupplyAmount': 'union_supply_amount',
        'issueExcavationPermit': 'issue_excavation_permit',
        'issueExcavationPermitDate': 'issue_excavation_permit_date',
        'issueExcavationPermitNotes': 'issue_excavation_permit_notes',
        'armyPermit': 'army_permit',
        'armyPermitDate': 'army_permit_date',
        'armyPermitNotes': 'army_permit_notes',
        'equipmentPermit': 'equipment_permit',
        'equipmentPermitDate': 'equipment_permit_date',
        'equipmentPermitNotes': 'equipment_permit_notes',
        'stageNotes': 'stage_notes',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$ExcavationPermitToJson(
  _ExcavationPermit instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'supervision_certificate': instance.supervisionCertificate,
  'supervision_certificate_date': ?instance.supervisionCertificateDate
      ?.toIso8601String(),
  'supervision_certificate_notes': ?instance.supervisionCertificateNotes,
  'contract_agreement': instance.contractAgreement,
  'contract_agreement_date': ?instance.contractAgreementDate?.toIso8601String(),
  'contract_agreement_notes': ?instance.contractAgreementNotes,
  'approve_contract_from_union': instance.approveContractFromUnion,
  'approve_contract_from_union_date': ?instance.approveContractFromUnionDate
      ?.toIso8601String(),
  'approve_contract_from_union_notes': ?instance.approveContractFromUnionNotes,
  'supply_to_union': instance.supplyToUnion,
  'supply_to_union_date': ?instance.supplyToUnionDate?.toIso8601String(),
  'supply_to_union_notes': ?instance.supplyToUnionNotes,
  'union_supply_amount': ?instance.unionSupplyAmount,
  'issue_excavation_permit': instance.issueExcavationPermit,
  'issue_excavation_permit_date': ?instance.issueExcavationPermitDate
      ?.toIso8601String(),
  'issue_excavation_permit_notes': ?instance.issueExcavationPermitNotes,
  'army_permit': instance.armyPermit,
  'army_permit_date': ?instance.armyPermitDate?.toIso8601String(),
  'army_permit_notes': ?instance.armyPermitNotes,
  'equipment_permit': instance.equipmentPermit,
  'equipment_permit_date': ?instance.equipmentPermitDate?.toIso8601String(),
  'equipment_permit_notes': ?instance.equipmentPermitNotes,
  'stage_notes': ?instance.stageNotes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
