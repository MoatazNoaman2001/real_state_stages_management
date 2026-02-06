// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooftop_addition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RooftopAddition _$RooftopAdditionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_RooftopAddition',
      json,
      ($checkedConvert) {
        final val = _RooftopAddition(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
          submitRequest: $checkedConvert(
            'submit_request',
            (v) => v as bool? ?? false,
          ),
          submitRequestDate: $checkedConvert(
            'submit_request_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          submitRequestNotes: $checkedConvert(
            'submit_request_notes',
            (v) => v as String?,
          ),
          payInspection: $checkedConvert(
            'pay_inspection',
            (v) => v as bool? ?? false,
          ),
          payInspectionDate: $checkedConvert(
            'pay_inspection_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          payInspectionNotes: $checkedConvert(
            'pay_inspection_notes',
            (v) => v as String?,
          ),
          inspectionAmount: $checkedConvert(
            'inspection_amount',
            (v) => (v as num?)?.toDouble(),
          ),
          inspectionDate: $checkedConvert(
            'inspection_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          inspectionNotes: $checkedConvert(
            'inspection_notes',
            (v) => v as String?,
          ),
          reviewWithAgency: $checkedConvert(
            'review_with_agency',
            (v) => v as bool? ?? false,
          ),
          reviewWithAgencyDate: $checkedConvert(
            'review_with_agency_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          reviewWithAgencyNotes: $checkedConvert(
            'review_with_agency_notes',
            (v) => v as String?,
          ),
          printLetters: $checkedConvert(
            'print_letters',
            (v) => v as bool? ?? false,
          ),
          printLettersDate: $checkedConvert(
            'print_letters_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          printLettersNotes: $checkedConvert(
            'print_letters_notes',
            (v) => v as String?,
          ),
          supply: $checkedConvert('supply', (v) => v as bool? ?? false),
          supplyDate: $checkedConvert(
            'supply_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          supplyNotes: $checkedConvert('supply_notes', (v) => v as String?),
          supplyAmount: $checkedConvert(
            'supply_amount',
            (v) => (v as num?)?.toDouble(),
          ),
          initialContract: $checkedConvert(
            'initial_contract',
            (v) => v as bool? ?? false,
          ),
          initialContractDate: $checkedConvert(
            'initial_contract_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          initialContractNotes: $checkedConvert(
            'initial_contract_notes',
            (v) => v as String?,
          ),
          supplementaryContract: $checkedConvert(
            'supplementary_contract',
            (v) => v as bool? ?? false,
          ),
          supplementaryContractDate: $checkedConvert(
            'supplementary_contract_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          supplementaryContractNotes: $checkedConvert(
            'supplementary_contract_notes',
            (v) => v as String?,
          ),
          thenToLicense: $checkedConvert(
            'then_to_license',
            (v) => v as bool? ?? false,
          ),
          thenToLicenseDate: $checkedConvert(
            'then_to_license_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          thenToLicenseNotes: $checkedConvert(
            'then_to_license_notes',
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
        'submitRequest': 'submit_request',
        'submitRequestDate': 'submit_request_date',
        'submitRequestNotes': 'submit_request_notes',
        'payInspection': 'pay_inspection',
        'payInspectionDate': 'pay_inspection_date',
        'payInspectionNotes': 'pay_inspection_notes',
        'inspectionAmount': 'inspection_amount',
        'inspectionDate': 'inspection_date',
        'inspectionNotes': 'inspection_notes',
        'reviewWithAgency': 'review_with_agency',
        'reviewWithAgencyDate': 'review_with_agency_date',
        'reviewWithAgencyNotes': 'review_with_agency_notes',
        'printLetters': 'print_letters',
        'printLettersDate': 'print_letters_date',
        'printLettersNotes': 'print_letters_notes',
        'supplyDate': 'supply_date',
        'supplyNotes': 'supply_notes',
        'supplyAmount': 'supply_amount',
        'initialContract': 'initial_contract',
        'initialContractDate': 'initial_contract_date',
        'initialContractNotes': 'initial_contract_notes',
        'supplementaryContract': 'supplementary_contract',
        'supplementaryContractDate': 'supplementary_contract_date',
        'supplementaryContractNotes': 'supplementary_contract_notes',
        'thenToLicense': 'then_to_license',
        'thenToLicenseDate': 'then_to_license_date',
        'thenToLicenseNotes': 'then_to_license_notes',
        'stageNotes': 'stage_notes',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$RooftopAdditionToJson(
  _RooftopAddition instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'submit_request': instance.submitRequest,
  'submit_request_date': ?instance.submitRequestDate?.toIso8601String(),
  'submit_request_notes': ?instance.submitRequestNotes,
  'pay_inspection': instance.payInspection,
  'pay_inspection_date': ?instance.payInspectionDate?.toIso8601String(),
  'pay_inspection_notes': ?instance.payInspectionNotes,
  'inspection_amount': ?instance.inspectionAmount,
  'inspection_date': ?instance.inspectionDate?.toIso8601String(),
  'inspection_notes': ?instance.inspectionNotes,
  'review_with_agency': instance.reviewWithAgency,
  'review_with_agency_date': ?instance.reviewWithAgencyDate?.toIso8601String(),
  'review_with_agency_notes': ?instance.reviewWithAgencyNotes,
  'print_letters': instance.printLetters,
  'print_letters_date': ?instance.printLettersDate?.toIso8601String(),
  'print_letters_notes': ?instance.printLettersNotes,
  'supply': instance.supply,
  'supply_date': ?instance.supplyDate?.toIso8601String(),
  'supply_notes': ?instance.supplyNotes,
  'supply_amount': ?instance.supplyAmount,
  'initial_contract': instance.initialContract,
  'initial_contract_date': ?instance.initialContractDate?.toIso8601String(),
  'initial_contract_notes': ?instance.initialContractNotes,
  'supplementary_contract': instance.supplementaryContract,
  'supplementary_contract_date': ?instance.supplementaryContractDate
      ?.toIso8601String(),
  'supplementary_contract_notes': ?instance.supplementaryContractNotes,
  'then_to_license': instance.thenToLicense,
  'then_to_license_date': ?instance.thenToLicenseDate?.toIso8601String(),
  'then_to_license_notes': ?instance.thenToLicenseNotes,
  'stage_notes': ?instance.stageNotes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
