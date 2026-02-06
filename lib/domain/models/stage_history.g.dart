// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StageHistory _$StageHistoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_StageHistory',
      json,
      ($checkedConvert) {
        final val = _StageHistory(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
          stageName: $checkedConvert('stage_name', (v) => v as String?),
          startedAt: $checkedConvert(
            'started_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          completedAt: $checkedConvert(
            'completed_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          durationDays: $checkedConvert(
            'duration_days',
            (v) => (v as num?)?.toInt(),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'customerId': 'customer_id',
        'stageName': 'stage_name',
        'startedAt': 'started_at',
        'completedAt': 'completed_at',
        'durationDays': 'duration_days',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$StageHistoryToJson(_StageHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'stage_name': ?instance.stageName,
      'started_at': ?instance.startedAt?.toIso8601String(),
      'completed_at': ?instance.completedAt?.toIso8601String(),
      'duration_days': ?instance.durationDays,
      'created_at': instance.createdAt.toIso8601String(),
    };
