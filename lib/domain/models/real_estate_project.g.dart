// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RealEstateProject _$RealEstateProjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_RealEstateProject',
      json,
      ($checkedConvert) {
        final val = _RealEstateProject(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          projectName: $checkedConvert('project_name', (v) => v as String),
          currentStatus: $checkedConvert('current_status', (v) => v as String?),
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
        'projectName': 'project_name',
        'currentStatus': 'current_status',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$RealEstateProjectToJson(_RealEstateProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_name': instance.projectName,
      'current_status': ?instance.currentStatus,
      'notes': ?instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
