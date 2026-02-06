import 'package:freezed_annotation/freezed_annotation.dart';

part 'license.freezed.dart';
part 'license.g.dart';

@freezed
abstract class License with _$License {
  const factory License({
    required int id,
    @JsonKey(name: 'customer_id') required int customerId,

    // Step 1: استلام الأوراق
    @Default(false) @JsonKey(name: 'receive_documents') bool receiveDocuments,
    @JsonKey(name: 'receive_documents_date') DateTime? receiveDocumentsDate,
    @JsonKey(name: 'receive_documents_notes') String? receiveDocumentsNotes,

    // Step 2: استلام التوكيل
    @Default(false) @JsonKey(name: 'receive_authorization') bool receiveAuthorization,
    @JsonKey(name: 'receive_authorization_date') DateTime? receiveAuthorizationDate,
    @JsonKey(name: 'receive_authorization_notes') String? receiveAuthorizationNotes,

    // Step 3: صلاحية موقع
    @Default(false) @JsonKey(name: 'site_validity') bool siteValidity,
    @JsonKey(name: 'site_validity_date') DateTime? siteValidityDate,
    @JsonKey(name: 'site_validity_notes') String? siteValidityNotes,

    // Step 4: موقف تنفيذي
    @Default(false) @JsonKey(name: 'executive_status') bool executiveStatus,
    @JsonKey(name: 'executive_status_date') DateTime? executiveStatusDate,
    @JsonKey(name: 'executive_status_notes') String? executiveStatusNotes,

    // Step 5: عرض على المالك (NEW)
    @Default(false) @JsonKey(name: 'show_to_owner') bool showToOwner,
    @JsonKey(name: 'show_to_owner_date') DateTime? showToOwnerDate,
    @JsonKey(name: 'show_to_owner_notes') String? showToOwnerNotes,

    // Step 6: مراجعة مع الجهاز
    @Default(false) @JsonKey(name: 'review_with_agency') bool reviewWithAgency,
    @JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,
    @JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,

    // Step 7: دفاع مدني
    @Default(false) @JsonKey(name: 'civil_defense') bool civilDefense,
    @JsonKey(name: 'civil_defense_date') DateTime? civilDefenseDate,
    @JsonKey(name: 'civil_defense_notes') String? civilDefenseNotes,

    // Step 8: تجهيز الانشائي
    @Default(false) @JsonKey(name: 'prepare_structural') bool prepareStructural,
    @JsonKey(name: 'prepare_structural_date') DateTime? prepareStructuralDate,
    @JsonKey(name: 'prepare_structural_notes') String? prepareStructuralNotes,

    // Step 9: تجهيز تقارير الانشائي
    @Default(false) @JsonKey(name: 'prepare_structural_reports') bool prepareStructuralReports,
    @JsonKey(name: 'prepare_structural_reports_date') DateTime? prepareStructuralReportsDate,
    @JsonKey(name: 'prepare_structural_reports_notes') String? prepareStructuralReportsNotes,

    // Step 10: تقديم المجمعة
    @Default(false) @JsonKey(name: 'submit_to_complex') bool submitToComplex,
    @JsonKey(name: 'submit_to_complex_date') DateTime? submitToComplexDate,
    @JsonKey(name: 'submit_to_complex_notes') String? submitToComplexNotes,

    // Step 11: توريد المجمعة (has money field)
    @Default(false) @JsonKey(name: 'supply_to_complex') bool supplyToComplex,
    @JsonKey(name: 'supply_to_complex_date') DateTime? supplyToComplexDate,
    @JsonKey(name: 'supply_to_complex_notes') String? supplyToComplexNotes,
    @JsonKey(name: 'complex_supply_amount') double? complexSupplyAmount,

    // Step 12: عمل ملاحظات المجمعة
    @Default(false) @JsonKey(name: 'do_complex_notes') bool doComplexNotes,
    @JsonKey(name: 'do_complex_notes_date') DateTime? doComplexNotesDate,
    @JsonKey(name: 'do_complex_notes_notes') String? doComplexNotesNotes,

    // Step 13: اصدار الوثيقة
    @Default(false) @JsonKey(name: 'issue_document') bool issueDocument,
    @JsonKey(name: 'issue_document_date') DateTime? issueDocumentDate,
    @JsonKey(name: 'issue_document_notes') String? issueDocumentNotes,

    // Step 14: تجهيز لوحات الواجهات والصحى والكهرباء (NEW)
    @Default(false) @JsonKey(name: 'prepare_facade_boards') bool prepareFacadeBoards,
    @JsonKey(name: 'prepare_facade_boards_date') DateTime? prepareFacadeBoardsDate,
    @JsonKey(name: 'prepare_facade_boards_notes') String? prepareFacadeBoardsNotes,

    // Step 15: التقديم علي الموقع لاصدار الترخيص
    @Default(false) @JsonKey(name: 'apply_online_for_license') bool applyOnlineForLicense,
    @JsonKey(name: 'apply_online_for_license_date') DateTime? applyOnlineForLicenseDate,
    @JsonKey(name: 'apply_online_for_license_notes') String? applyOnlineForLicenseNotes,

    // Step 16: رقم الطلب
    @JsonKey(name: 'request_number') String? requestNumber,
    @JsonKey(name: 'request_number_notes') String? requestNumberNotes,

    // Step 17: مراجعة الجهاز (NEW)
    @Default(false) @JsonKey(name: 'agency_review') bool agencyReview,
    @JsonKey(name: 'agency_review_date') DateTime? agencyReviewDate,
    @JsonKey(name: 'agency_review_notes') String? agencyReviewNotes,

    // Step 18: تحديد الرسوم
    @Default(false) @JsonKey(name: 'determine_fees') bool determineFees,
    @JsonKey(name: 'determine_fees_date') DateTime? determineFeesDate,
    @JsonKey(name: 'determine_fees_notes') String? determineFeesNotes,

    // Step 19: سداد الرسوم (has money field)
    @Default(false) @JsonKey(name: 'pay_fees') bool payFees,
    @JsonKey(name: 'pay_fees_date') DateTime? payFeesDate,
    @JsonKey(name: 'pay_fees_notes') String? payFeesNotes,
    @JsonKey(name: 'fees_amount') double? feesAmount,

    // Step 20: اصدار الرخصة
    @Default(false) @JsonKey(name: 'issue_license') bool issueLicense,
    @JsonKey(name: 'issue_license_date') DateTime? issueLicenseDate,
    @JsonKey(name: 'issue_license_notes') String? issueLicenseNotes,

    // Step 21: تقديم علي عداد انشائي
    @Default(false) @JsonKey(name: 'apply_for_structural_meter') bool applyForStructuralMeter,
    @JsonKey(name: 'apply_for_structural_meter_date') DateTime? applyForStructuralMeterDate,
    @JsonKey(name: 'apply_for_structural_meter_notes') String? applyForStructuralMeterNotes,

    // Step 22: إعطاء نسخة اللوحات للمالك
    @Default(false) @JsonKey(name: 'give_board_copy_to_owner') bool giveBoardCopyToOwner,
    @JsonKey(name: 'give_board_copy_to_owner_date') DateTime? giveBoardCopyToOwnerDate,
    @JsonKey(name: 'give_board_copy_to_owner_notes') String? giveBoardCopyToOwnerNotes,

    // General stage notes
    @JsonKey(name: 'stage_notes') String? stageNotes,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _License;

  const License._();

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  static const int totalSteps = 22;

  int get completedSteps {
    int count = 0;
    if (receiveDocuments) count++;
    if (receiveAuthorization) count++;
    if (siteValidity) count++;
    if (executiveStatus) count++;
    if (showToOwner) count++;
    if (reviewWithAgency) count++;
    if (civilDefense) count++;
    if (prepareStructural) count++;
    if (prepareStructuralReports) count++;
    if (submitToComplex) count++;
    if (supplyToComplex) count++;
    if (doComplexNotes) count++;
    if (issueDocument) count++;
    if (prepareFacadeBoards) count++;
    if (applyOnlineForLicense) count++;
    if (requestNumber != null && requestNumber!.isNotEmpty) count++;
    if (agencyReview) count++;
    if (determineFees) count++;
    if (payFees) count++;
    if (issueLicense) count++;
    if (applyForStructuralMeter) count++;
    if (giveBoardCopyToOwner) count++;
    return count;
  }

  double get progress => (completedSteps / totalSteps) * 100;
  bool get isComplete => completedSteps == totalSteps;
}
