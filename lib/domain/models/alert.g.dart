// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Alert _$AlertFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Alert',
  json,
  ($checkedConvert) {
    final val = _Alert(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
      alertType: $checkedConvert('alert_type', (v) => v as String?),
      message: $checkedConvert('message', (v) => v as String?),
      alertDate: $checkedConvert(
        'alert_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
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
    'alertType': 'alert_type',
    'alertDate': 'alert_date',
    'isActive': 'is_active',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$AlertToJson(_Alert instance) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'alert_type': ?instance.alertType,
  'message': ?instance.message,
  'alert_date': ?instance.alertDate?.toIso8601String(),
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
