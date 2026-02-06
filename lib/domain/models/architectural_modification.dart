import 'package:freezed_annotation/freezed_annotation.dart';

part 'architectural_modification.freezed.dart';
part 'architectural_modification.g.dart';

/// Converts String or num to double
class DoubleConverter implements JsonConverter<double?, Object?> {
  const DoubleConverter();

  @override
  double? fromJson(Object? json) {
    if (json == null) return null;
    if (json is double) return json;
    if (json is int) return json.toDouble();
    if (json is String) {
      if (json.isEmpty) return null;
      return double.tryParse(json);
    }
    return null;
  }

  @override
  Object? toJson(double? object) => object;
}

@freezed
abstract class ArchitecturalModification with _$ArchitecturalModification {
  const factory ArchitecturalModification({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    // Step 1: رسم اللوحات
    @Default(false) @JsonKey(name: 'draw_boards') bool drawBoards,
    @JsonKey(name: 'draw_boards_date') DateTime? drawBoardsDate,
    @JsonKey(name: 'draw_boards_notes') String? drawBoardsNotes,

    // Step 2: المعاينة علي الطبيعة
    @Default(false) @JsonKey(name: 'field_inspection') bool fieldInspection,
    @JsonKey(name: 'field_inspection_date') DateTime? fieldInspectionDate,
    @JsonKey(name: 'field_inspection_notes') String? fieldInspectionNotes,

    // Step 3: رسم التعديلات المعمارية
    @Default(false) @JsonKey(name: 'draw_modifications') bool drawModifications,
    @JsonKey(name: 'draw_modifications_date') DateTime? drawModificationsDate,
    @JsonKey(name: 'draw_modifications_notes') String? drawModificationsNotes,

    // Step 4: تقديم الطلب
    @Default(false) @JsonKey(name: 'submit_request') bool submitRequest,
    @JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,
    @JsonKey(name: 'submit_request_notes') String? submitRequestNotes,

    // Step 5: رقم الطلب
    @JsonKey(name: 'request_number') String? requestNumber,
    @JsonKey(name: 'request_number_notes') String? requestNumberNotes,

    // Step 6: ميعاد المعاينة من الجهاز (has money field)
    @JsonKey(name: 'inspection_date') DateTime? inspectionDate,
    @JsonKey(name: 'inspection_notes') String? inspectionNotes,
    @DoubleConverter() @JsonKey(name: 'inspection_amount') double? inspectionAmount,

    // Step 7: المعاينة من الجهاز
    @Default(false) @JsonKey(name: 'inspection_from_agency') bool inspectionFromAgency,
    @JsonKey(name: 'inspection_from_agency_date') DateTime? inspectionFromAgencyDate,
    @JsonKey(name: 'inspection_from_agency_notes') String? inspectionFromAgencyNotes,

    // Step 8: مراجعة مع الجهاز
    @Default(false) @JsonKey(name: 'review_with_agency') bool reviewWithAgency,
    @JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,
    @JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,

    // Step 9: اعتماد اللوحات
    @Default(false) @JsonKey(name: 'approve_boards') bool approveBoards,
    @JsonKey(name: 'approve_boards_date') DateTime? approveBoardsDate,
    @JsonKey(name: 'approve_boards_notes') String? approveBoardsNotes,

    // Step 10: إعطاء النسخة للمالك
    @Default(false) @JsonKey(name: 'give_copy_to_owner') bool giveCopyToOwner,
    @JsonKey(name: 'give_copy_to_owner_date') DateTime? giveCopyToOwnerDate,
    @JsonKey(name: 'give_copy_to_owner_notes') String? giveCopyToOwnerNotes,

    // General stage notes
    @JsonKey(name: 'stage_notes') String? stageNotes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ArchitecturalModification;

  const ArchitecturalModification._();

  factory ArchitecturalModification.fromJson(Map<String, dynamic> json) =>
      _$ArchitecturalModificationFromJson(json);

  static const int totalSteps = 10;

  int get completedSteps {
    int count = 0;
    if (drawBoards) count++;
    if (fieldInspection) count++;
    if (drawModifications) count++;
    if (submitRequest) count++;
    if (requestNumber != null && requestNumber!.isNotEmpty) count++;
    if (inspectionDate != null) count++;
    if (inspectionFromAgency) count++;
    if (reviewWithAgency) count++;
    if (approveBoards) count++;
    if (giveCopyToOwner) count++;
    return count;
  }

  double get progress => (completedSteps / totalSteps) * 100;
  bool get isComplete => completedSteps == totalSteps;
}
