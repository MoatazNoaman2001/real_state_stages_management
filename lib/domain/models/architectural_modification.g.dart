// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'architectural_modification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArchitecturalModification _$ArchitecturalModificationFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ArchitecturalModification',
  json,
  ($checkedConvert) {
    final val = _ArchitecturalModification(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
      drawBoards: $checkedConvert('draw_boards', (v) => v as bool? ?? false),
      drawBoardsDate: $checkedConvert(
        'draw_boards_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      drawBoardsNotes: $checkedConvert(
        'draw_boards_notes',
        (v) => v as String?,
      ),
      fieldInspection: $checkedConvert(
        'field_inspection',
        (v) => v as bool? ?? false,
      ),
      fieldInspectionDate: $checkedConvert(
        'field_inspection_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      fieldInspectionNotes: $checkedConvert(
        'field_inspection_notes',
        (v) => v as String?,
      ),
      drawModifications: $checkedConvert(
        'draw_modifications',
        (v) => v as bool? ?? false,
      ),
      drawModificationsDate: $checkedConvert(
        'draw_modifications_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      drawModificationsNotes: $checkedConvert(
        'draw_modifications_notes',
        (v) => v as String?,
      ),
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
      requestNumber: $checkedConvert('request_number', (v) => v as String?),
      requestNumberNotes: $checkedConvert(
        'request_number_notes',
        (v) => v as String?,
      ),
      inspectionDate: $checkedConvert(
        'inspection_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      inspectionNotes: $checkedConvert('inspection_notes', (v) => v as String?),
      inspectionAmount: $checkedConvert(
        'inspection_amount',
        (v) => const DoubleConverter().fromJson(v),
      ),
      inspectionFromAgency: $checkedConvert(
        'inspection_from_agency',
        (v) => v as bool? ?? false,
      ),
      inspectionFromAgencyDate: $checkedConvert(
        'inspection_from_agency_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      inspectionFromAgencyNotes: $checkedConvert(
        'inspection_from_agency_notes',
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
      approveBoards: $checkedConvert(
        'approve_boards',
        (v) => v as bool? ?? false,
      ),
      approveBoardsDate: $checkedConvert(
        'approve_boards_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      approveBoardsNotes: $checkedConvert(
        'approve_boards_notes',
        (v) => v as String?,
      ),
      giveCopyToOwner: $checkedConvert(
        'give_copy_to_owner',
        (v) => v as bool? ?? false,
      ),
      giveCopyToOwnerDate: $checkedConvert(
        'give_copy_to_owner_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      giveCopyToOwnerNotes: $checkedConvert(
        'give_copy_to_owner_notes',
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
    'drawBoards': 'draw_boards',
    'drawBoardsDate': 'draw_boards_date',
    'drawBoardsNotes': 'draw_boards_notes',
    'fieldInspection': 'field_inspection',
    'fieldInspectionDate': 'field_inspection_date',
    'fieldInspectionNotes': 'field_inspection_notes',
    'drawModifications': 'draw_modifications',
    'drawModificationsDate': 'draw_modifications_date',
    'drawModificationsNotes': 'draw_modifications_notes',
    'submitRequest': 'submit_request',
    'submitRequestDate': 'submit_request_date',
    'submitRequestNotes': 'submit_request_notes',
    'requestNumber': 'request_number',
    'requestNumberNotes': 'request_number_notes',
    'inspectionDate': 'inspection_date',
    'inspectionNotes': 'inspection_notes',
    'inspectionAmount': 'inspection_amount',
    'inspectionFromAgency': 'inspection_from_agency',
    'inspectionFromAgencyDate': 'inspection_from_agency_date',
    'inspectionFromAgencyNotes': 'inspection_from_agency_notes',
    'reviewWithAgency': 'review_with_agency',
    'reviewWithAgencyDate': 'review_with_agency_date',
    'reviewWithAgencyNotes': 'review_with_agency_notes',
    'approveBoards': 'approve_boards',
    'approveBoardsDate': 'approve_boards_date',
    'approveBoardsNotes': 'approve_boards_notes',
    'giveCopyToOwner': 'give_copy_to_owner',
    'giveCopyToOwnerDate': 'give_copy_to_owner_date',
    'giveCopyToOwnerNotes': 'give_copy_to_owner_notes',
    'stageNotes': 'stage_notes',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ArchitecturalModificationToJson(
  _ArchitecturalModification instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'draw_boards': instance.drawBoards,
  'draw_boards_date': ?instance.drawBoardsDate?.toIso8601String(),
  'draw_boards_notes': ?instance.drawBoardsNotes,
  'field_inspection': instance.fieldInspection,
  'field_inspection_date': ?instance.fieldInspectionDate?.toIso8601String(),
  'field_inspection_notes': ?instance.fieldInspectionNotes,
  'draw_modifications': instance.drawModifications,
  'draw_modifications_date': ?instance.drawModificationsDate?.toIso8601String(),
  'draw_modifications_notes': ?instance.drawModificationsNotes,
  'submit_request': instance.submitRequest,
  'submit_request_date': ?instance.submitRequestDate?.toIso8601String(),
  'submit_request_notes': ?instance.submitRequestNotes,
  'request_number': ?instance.requestNumber,
  'request_number_notes': ?instance.requestNumberNotes,
  'inspection_date': ?instance.inspectionDate?.toIso8601String(),
  'inspection_notes': ?instance.inspectionNotes,
  'inspection_amount': ?const DoubleConverter().toJson(
    instance.inspectionAmount,
  ),
  'inspection_from_agency': instance.inspectionFromAgency,
  'inspection_from_agency_date': ?instance.inspectionFromAgencyDate
      ?.toIso8601String(),
  'inspection_from_agency_notes': ?instance.inspectionFromAgencyNotes,
  'review_with_agency': instance.reviewWithAgency,
  'review_with_agency_date': ?instance.reviewWithAgencyDate?.toIso8601String(),
  'review_with_agency_notes': ?instance.reviewWithAgencyNotes,
  'approve_boards': instance.approveBoards,
  'approve_boards_date': ?instance.approveBoardsDate?.toIso8601String(),
  'approve_boards_notes': ?instance.approveBoardsNotes,
  'give_copy_to_owner': instance.giveCopyToOwner,
  'give_copy_to_owner_date': ?instance.giveCopyToOwnerDate?.toIso8601String(),
  'give_copy_to_owner_notes': ?instance.giveCopyToOwnerNotes,
  'stage_notes': ?instance.stageNotes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
