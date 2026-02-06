// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility_meter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UtilityMeter _$UtilityMeterFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_UtilityMeter',
      json,
      ($checkedConvert) {
        final val = _UtilityMeter(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
          receiveDocuments: $checkedConvert(
            'receive_documents',
            (v) => v as bool? ?? false,
          ),
          receiveDocumentsDate: $checkedConvert(
            'receive_documents_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          receiveDocumentsNotes: $checkedConvert(
            'receive_documents_notes',
            (v) => v as String?,
          ),
          authorization_var: $checkedConvert(
            'authorization_var',
            (v) => v as bool? ?? false,
          ),
          authorizationDate: $checkedConvert(
            'authorization_var_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          authorizationNotes: $checkedConvert(
            'authorization_var_notes',
            (v) => v as String?,
          ),
          applyForMeter: $checkedConvert(
            'apply_for_meter',
            (v) => v as bool? ?? false,
          ),
          applyForMeterDate: $checkedConvert(
            'apply_for_meter_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          applyForMeterNotes: $checkedConvert(
            'apply_for_meter_notes',
            (v) => v as String?,
          ),
          inspectionDate: $checkedConvert(
            'inspection_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          inspectionAmount: $checkedConvert(
            'inspection_amount',
            (v) => (v as num?)?.toDouble(),
          ),
          inspectionNotes: $checkedConvert(
            'inspection_notes',
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
          supplyToMeter: $checkedConvert(
            'supply_to_meter',
            (v) => v as bool? ?? false,
          ),
          supplyToMeterDate: $checkedConvert(
            'supply_to_meter_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          supplyToMeterNotes: $checkedConvert(
            'supply_to_meter_notes',
            (v) => v as String?,
          ),
          supplyAmount1: $checkedConvert(
            'supply_amount_1',
            (v) => (v as num?)?.toDouble(),
          ),
          supplyAmount2: $checkedConvert(
            'supply_amount_2',
            (v) => (v as num?)?.toDouble(),
          ),
          supplyAmount3: $checkedConvert(
            'supply_amount_3',
            (v) => (v as num?)?.toDouble(),
          ),
          supplyAmount4: $checkedConvert(
            'supply_amount_4',
            (v) => (v as num?)?.toDouble(),
          ),
          contractMeter: $checkedConvert(
            'contract_meter',
            (v) => v as bool? ?? false,
          ),
          contractMeterDate: $checkedConvert(
            'contract_meter_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          contractMeterNotes: $checkedConvert(
            'contract_meter_notes',
            (v) => v as String?,
          ),
          receiveMeter: $checkedConvert(
            'receive_meter',
            (v) => v as bool? ?? false,
          ),
          receiveMeterDate: $checkedConvert(
            'receive_meter_date',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          receiveMeterNotes: $checkedConvert(
            'receive_meter_notes',
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
        'receiveDocuments': 'receive_documents',
        'receiveDocumentsDate': 'receive_documents_date',
        'receiveDocumentsNotes': 'receive_documents_notes',
        'authorizationDate': 'authorization_var_date',
        'authorizationNotes': 'authorization_var_notes',
        'applyForMeter': 'apply_for_meter',
        'applyForMeterDate': 'apply_for_meter_date',
        'applyForMeterNotes': 'apply_for_meter_notes',
        'inspectionDate': 'inspection_date',
        'inspectionAmount': 'inspection_amount',
        'inspectionNotes': 'inspection_notes',
        'printLetters': 'print_letters',
        'printLettersDate': 'print_letters_date',
        'printLettersNotes': 'print_letters_notes',
        'supplyToMeter': 'supply_to_meter',
        'supplyToMeterDate': 'supply_to_meter_date',
        'supplyToMeterNotes': 'supply_to_meter_notes',
        'supplyAmount1': 'supply_amount_1',
        'supplyAmount2': 'supply_amount_2',
        'supplyAmount3': 'supply_amount_3',
        'supplyAmount4': 'supply_amount_4',
        'contractMeter': 'contract_meter',
        'contractMeterDate': 'contract_meter_date',
        'contractMeterNotes': 'contract_meter_notes',
        'receiveMeter': 'receive_meter',
        'receiveMeterDate': 'receive_meter_date',
        'receiveMeterNotes': 'receive_meter_notes',
        'stageNotes': 'stage_notes',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$UtilityMeterToJson(
  _UtilityMeter instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'receive_documents': instance.receiveDocuments,
  'receive_documents_date': ?instance.receiveDocumentsDate?.toIso8601String(),
  'receive_documents_notes': ?instance.receiveDocumentsNotes,
  'authorization_var': instance.authorization_var,
  'authorization_var_date': ?instance.authorizationDate?.toIso8601String(),
  'authorization_var_notes': ?instance.authorizationNotes,
  'apply_for_meter': instance.applyForMeter,
  'apply_for_meter_date': ?instance.applyForMeterDate?.toIso8601String(),
  'apply_for_meter_notes': ?instance.applyForMeterNotes,
  'inspection_date': ?instance.inspectionDate?.toIso8601String(),
  'inspection_amount': ?instance.inspectionAmount,
  'inspection_notes': ?instance.inspectionNotes,
  'print_letters': instance.printLetters,
  'print_letters_date': ?instance.printLettersDate?.toIso8601String(),
  'print_letters_notes': ?instance.printLettersNotes,
  'supply_to_meter': instance.supplyToMeter,
  'supply_to_meter_date': ?instance.supplyToMeterDate?.toIso8601String(),
  'supply_to_meter_notes': ?instance.supplyToMeterNotes,
  'supply_amount_1': ?instance.supplyAmount1,
  'supply_amount_2': ?instance.supplyAmount2,
  'supply_amount_3': ?instance.supplyAmount3,
  'supply_amount_4': ?instance.supplyAmount4,
  'contract_meter': instance.contractMeter,
  'contract_meter_date': ?instance.contractMeterDate?.toIso8601String(),
  'contract_meter_notes': ?instance.contractMeterNotes,
  'receive_meter': instance.receiveMeter,
  'receive_meter_date': ?instance.receiveMeterDate?.toIso8601String(),
  'receive_meter_notes': ?instance.receiveMeterNotes,
  'stage_notes': ?instance.stageNotes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
