// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoadWork _$RoadWorkFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_RoadWork',
  json,
  ($checkedConvert) {
    final val = _RoadWork(
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
      renewalDate: $checkedConvert(
        'renewal_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      renewalAlertEnabled: $checkedConvert(
        'renewal_alert_enabled',
        (v) => v as bool? ?? false,
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
    'supplyDate': 'supply_date',
    'supplyNotes': 'supply_notes',
    'supplyAmount': 'supply_amount',
    'renewalDate': 'renewal_date',
    'renewalAlertEnabled': 'renewal_alert_enabled',
    'stageNotes': 'stage_notes',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$RoadWorkToJson(_RoadWork instance) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'submit_request': instance.submitRequest,
  'submit_request_date': ?instance.submitRequestDate?.toIso8601String(),
  'submit_request_notes': ?instance.submitRequestNotes,
  'supply': instance.supply,
  'supply_date': ?instance.supplyDate?.toIso8601String(),
  'supply_notes': ?instance.supplyNotes,
  'supply_amount': ?instance.supplyAmount,
  'renewal_date': ?instance.renewalDate?.toIso8601String(),
  'renewal_alert_enabled': instance.renewalAlertEnabled,
  'stage_notes': ?instance.stageNotes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
