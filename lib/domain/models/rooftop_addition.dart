import 'package:freezed_annotation/freezed_annotation.dart';

part 'rooftop_addition.freezed.dart';
part 'rooftop_addition.g.dart';

@freezed
abstract class RooftopAddition with _$RooftopAddition {
  const factory RooftopAddition({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    // Step 1: التقديم علي الطلب
    @Default(false) @JsonKey(name: 'submit_request') bool submitRequest,
    @JsonKey(name: 'submit_request_date') DateTime? submitRequestDate,
    @JsonKey(name: 'submit_request_notes') String? submitRequestNotes,

    // Step 2: سداد المعاينة (has money field)
    @Default(false) @JsonKey(name: 'pay_inspection') bool payInspection,
    @JsonKey(name: 'pay_inspection_date') DateTime? payInspectionDate,
    @JsonKey(name: 'pay_inspection_notes') String? payInspectionNotes,
    @JsonKey(name: 'inspection_amount') double? inspectionAmount,

    // Step 3: ميعاد المعاينة
    @JsonKey(name: 'inspection_date') DateTime? inspectionDate,
    @JsonKey(name: 'inspection_notes') String? inspectionNotes,

    // Step 4: مراجعة مع الجهاز
    @Default(false) @JsonKey(name: 'review_with_agency') bool reviewWithAgency,
    @JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,
    @JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,

    // Step 5: طباعة الجوابات (NEW)
    @Default(false) @JsonKey(name: 'print_letters') bool printLetters,
    @JsonKey(name: 'print_letters_date') DateTime? printLettersDate,
    @JsonKey(name: 'print_letters_notes') String? printLettersNotes,

    // Step 6: التوريد (has money field)
    @Default(false) @JsonKey(name: 'supply') bool supply,
    @JsonKey(name: 'supply_date') DateTime? supplyDate,
    @JsonKey(name: 'supply_notes') String? supplyNotes,
    @JsonKey(name: 'supply_amount') double? supplyAmount,

    // Step 7: العقد الابتدائي
    @Default(false) @JsonKey(name: 'initial_contract') bool initialContract,
    @JsonKey(name: 'initial_contract_date') DateTime? initialContractDate,
    @JsonKey(name: 'initial_contract_notes') String? initialContractNotes,

    // Step 8: العقد الملحق
    @Default(false) @JsonKey(name: 'supplementary_contract') bool supplementaryContract,
    @JsonKey(name: 'supplementary_contract_date') DateTime? supplementaryContractDate,
    @JsonKey(name: 'supplementary_contract_notes') String? supplementaryContractNotes,

    // Step 9: وتروح بعدها للترخيص
    @Default(false) @JsonKey(name: 'then_to_license') bool thenToLicense,
    @JsonKey(name: 'then_to_license_date') DateTime? thenToLicenseDate,
    @JsonKey(name: 'then_to_license_notes') String? thenToLicenseNotes,

    // General stage notes
    @JsonKey(name: 'stage_notes') String? stageNotes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _RooftopAddition;

  const RooftopAddition._();

  factory RooftopAddition.fromJson(Map<String, dynamic> json) =>
      _$RooftopAdditionFromJson(json);

  static const int totalSteps = 9;

  int get completedSteps {
    int count = 0;
    if (submitRequest) count++;
    if (payInspection) count++;
    if (inspectionDate != null) count++;
    if (reviewWithAgency) count++;
    if (printLetters) count++;
    if (supply) count++;
    if (initialContract) count++;
    if (supplementaryContract) count++;
    if (thenToLicense) count++;
    return count;
  }

  double get progress => (completedSteps / totalSteps) * 100;
  bool get isComplete => completedSteps == totalSteps;
}
