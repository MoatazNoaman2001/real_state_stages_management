// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Customer _$CustomerFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Customer',
  json,
  ($checkedConvert) {
    final val = _Customer(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerName: $checkedConvert('customer_name', (v) => v as String),
      ownerName: $checkedConvert('owner_name', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      plotNumber: $checkedConvert('plot_number', (v) => v as String?),
      projectNumber: $checkedConvert('project_number', (v) => v as String?),
      username: $checkedConvert('username', (v) => v as String?),
      password: $checkedConvert('password', (v) => v as String?),
      currentStage: $checkedConvert('current_stage', (v) => v as String?),
      notes: $checkedConvert('notes', (v) => v as String?),
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
    'customerName': 'customer_name',
    'ownerName': 'owner_name',
    'plotNumber': 'plot_number',
    'projectNumber': 'project_number',
    'currentStage': 'current_stage',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'id': instance.id,
  'customer_name': instance.customerName,
  'owner_name': ?instance.ownerName,
  'phone': ?instance.phone,
  'plot_number': ?instance.plotNumber,
  'project_number': ?instance.projectNumber,
  'username': ?instance.username,
  'password': ?instance.password,
  'current_stage': ?instance.currentStage,
  'notes': ?instance.notes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
