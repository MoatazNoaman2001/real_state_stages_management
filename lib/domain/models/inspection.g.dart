// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Inspection _$InspectionFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Inspection',
  json,
  ($checkedConvert) {
    final val = _Inspection(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
      reason: $checkedConvert('reason', (v) => v as String?),
      inspectionDate: $checkedConvert(
        'inspection_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert('status', (v) => v as String? ?? 'pending'),
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
    'inspectionDate': 'inspection_date',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$InspectionToJson(_Inspection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'reason': ?instance.reason,
      'inspection_date': ?instance.inspectionDate?.toIso8601String(),
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
