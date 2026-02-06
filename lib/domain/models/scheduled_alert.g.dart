// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduledAlert _$ScheduledAlertFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ScheduledAlert',
  json,
  ($checkedConvert) {
    final val = _ScheduledAlert(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerId: $checkedConvert('customer_id', (v) => (v as num?)?.toInt()),
      title: $checkedConvert('title', (v) => v as String),
      message: $checkedConvert('message', (v) => v as String?),
      alertDate: $checkedConvert(
        'alert_date',
        (v) => DateTime.parse(v as String),
      ),
      alertTime: $checkedConvert('alert_time', (v) => v as String?),
      repeatType: $checkedConvert(
        'repeat_type',
        (v) => $enumDecodeNullable(_$RepeatTypeEnumMap, v) ?? RepeatType.once,
      ),
      isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
      isTriggered: $checkedConvert('is_triggered', (v) => v as bool? ?? false),
      relatedTable: $checkedConvert('related_table', (v) => v as String?),
      relatedId: $checkedConvert('related_id', (v) => (v as num?)?.toInt()),
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
    'alertDate': 'alert_date',
    'alertTime': 'alert_time',
    'repeatType': 'repeat_type',
    'isActive': 'is_active',
    'isTriggered': 'is_triggered',
    'relatedTable': 'related_table',
    'relatedId': 'related_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ScheduledAlertToJson(_ScheduledAlert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': ?instance.customerId,
      'title': instance.title,
      'message': ?instance.message,
      'alert_date': instance.alertDate.toIso8601String(),
      'alert_time': ?instance.alertTime,
      'repeat_type': _$RepeatTypeEnumMap[instance.repeatType]!,
      'is_active': instance.isActive,
      'is_triggered': instance.isTriggered,
      'related_table': ?instance.relatedTable,
      'related_id': ?instance.relatedId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$RepeatTypeEnumMap = {
  RepeatType.once: 'once',
  RepeatType.daily: 'daily',
  RepeatType.weekly: 'weekly',
  RepeatType.monthly: 'monthly',
};
