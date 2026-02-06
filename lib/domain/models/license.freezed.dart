// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$License {

 int get id;@JsonKey(name: 'customer_id') int get customerId;// Step 1: استلام الأوراق
@JsonKey(name: 'receive_documents') bool get receiveDocuments;@JsonKey(name: 'receive_documents_date') DateTime? get receiveDocumentsDate;@JsonKey(name: 'receive_documents_notes') String? get receiveDocumentsNotes;// Step 2: استلام التوكيل
@JsonKey(name: 'receive_authorization') bool get receiveAuthorization;@JsonKey(name: 'receive_authorization_date') DateTime? get receiveAuthorizationDate;@JsonKey(name: 'receive_authorization_notes') String? get receiveAuthorizationNotes;// Step 3: صلاحية موقع
@JsonKey(name: 'site_validity') bool get siteValidity;@JsonKey(name: 'site_validity_date') DateTime? get siteValidityDate;@JsonKey(name: 'site_validity_notes') String? get siteValidityNotes;// Step 4: موقف تنفيذي
@JsonKey(name: 'executive_status') bool get executiveStatus;@JsonKey(name: 'executive_status_date') DateTime? get executiveStatusDate;@JsonKey(name: 'executive_status_notes') String? get executiveStatusNotes;// Step 5: عرض على المالك (NEW)
@JsonKey(name: 'show_to_owner') bool get showToOwner;@JsonKey(name: 'show_to_owner_date') DateTime? get showToOwnerDate;@JsonKey(name: 'show_to_owner_notes') String? get showToOwnerNotes;// Step 6: مراجعة مع الجهاز
@JsonKey(name: 'review_with_agency') bool get reviewWithAgency;@JsonKey(name: 'review_with_agency_date') DateTime? get reviewWithAgencyDate;@JsonKey(name: 'review_with_agency_notes') String? get reviewWithAgencyNotes;// Step 7: دفاع مدني
@JsonKey(name: 'civil_defense') bool get civilDefense;@JsonKey(name: 'civil_defense_date') DateTime? get civilDefenseDate;@JsonKey(name: 'civil_defense_notes') String? get civilDefenseNotes;// Step 8: تجهيز الانشائي
@JsonKey(name: 'prepare_structural') bool get prepareStructural;@JsonKey(name: 'prepare_structural_date') DateTime? get prepareStructuralDate;@JsonKey(name: 'prepare_structural_notes') String? get prepareStructuralNotes;// Step 9: تجهيز تقارير الانشائي
@JsonKey(name: 'prepare_structural_reports') bool get prepareStructuralReports;@JsonKey(name: 'prepare_structural_reports_date') DateTime? get prepareStructuralReportsDate;@JsonKey(name: 'prepare_structural_reports_notes') String? get prepareStructuralReportsNotes;// Step 10: تقديم المجمعة
@JsonKey(name: 'submit_to_complex') bool get submitToComplex;@JsonKey(name: 'submit_to_complex_date') DateTime? get submitToComplexDate;@JsonKey(name: 'submit_to_complex_notes') String? get submitToComplexNotes;// Step 11: توريد المجمعة (has money field)
@JsonKey(name: 'supply_to_complex') bool get supplyToComplex;@JsonKey(name: 'supply_to_complex_date') DateTime? get supplyToComplexDate;@JsonKey(name: 'supply_to_complex_notes') String? get supplyToComplexNotes;@JsonKey(name: 'complex_supply_amount') double? get complexSupplyAmount;// Step 12: عمل ملاحظات المجمعة
@JsonKey(name: 'do_complex_notes') bool get doComplexNotes;@JsonKey(name: 'do_complex_notes_date') DateTime? get doComplexNotesDate;@JsonKey(name: 'do_complex_notes_notes') String? get doComplexNotesNotes;// Step 13: اصدار الوثيقة
@JsonKey(name: 'issue_document') bool get issueDocument;@JsonKey(name: 'issue_document_date') DateTime? get issueDocumentDate;@JsonKey(name: 'issue_document_notes') String? get issueDocumentNotes;// Step 14: تجهيز لوحات الواجهات والصحى والكهرباء (NEW)
@JsonKey(name: 'prepare_facade_boards') bool get prepareFacadeBoards;@JsonKey(name: 'prepare_facade_boards_date') DateTime? get prepareFacadeBoardsDate;@JsonKey(name: 'prepare_facade_boards_notes') String? get prepareFacadeBoardsNotes;// Step 15: التقديم علي الموقع لاصدار الترخيص
@JsonKey(name: 'apply_online_for_license') bool get applyOnlineForLicense;@JsonKey(name: 'apply_online_for_license_date') DateTime? get applyOnlineForLicenseDate;@JsonKey(name: 'apply_online_for_license_notes') String? get applyOnlineForLicenseNotes;// Step 16: رقم الطلب
@JsonKey(name: 'request_number') String? get requestNumber;@JsonKey(name: 'request_number_notes') String? get requestNumberNotes;// Step 17: مراجعة الجهاز (NEW)
@JsonKey(name: 'agency_review') bool get agencyReview;@JsonKey(name: 'agency_review_date') DateTime? get agencyReviewDate;@JsonKey(name: 'agency_review_notes') String? get agencyReviewNotes;// Step 18: تحديد الرسوم
@JsonKey(name: 'determine_fees') bool get determineFees;@JsonKey(name: 'determine_fees_date') DateTime? get determineFeesDate;@JsonKey(name: 'determine_fees_notes') String? get determineFeesNotes;// Step 19: سداد الرسوم (has money field)
@JsonKey(name: 'pay_fees') bool get payFees;@JsonKey(name: 'pay_fees_date') DateTime? get payFeesDate;@JsonKey(name: 'pay_fees_notes') String? get payFeesNotes;@JsonKey(name: 'fees_amount') double? get feesAmount;// Step 20: اصدار الرخصة
@JsonKey(name: 'issue_license') bool get issueLicense;@JsonKey(name: 'issue_license_date') DateTime? get issueLicenseDate;@JsonKey(name: 'issue_license_notes') String? get issueLicenseNotes;// Step 21: تقديم علي عداد انشائي
@JsonKey(name: 'apply_for_structural_meter') bool get applyForStructuralMeter;@JsonKey(name: 'apply_for_structural_meter_date') DateTime? get applyForStructuralMeterDate;@JsonKey(name: 'apply_for_structural_meter_notes') String? get applyForStructuralMeterNotes;// Step 22: إعطاء نسخة اللوحات للمالك
@JsonKey(name: 'give_board_copy_to_owner') bool get giveBoardCopyToOwner;@JsonKey(name: 'give_board_copy_to_owner_date') DateTime? get giveBoardCopyToOwnerDate;@JsonKey(name: 'give_board_copy_to_owner_notes') String? get giveBoardCopyToOwnerNotes;// General stage notes
@JsonKey(name: 'stage_notes') String? get stageNotes;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of License
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenseCopyWith<License> get copyWith => _$LicenseCopyWithImpl<License>(this as License, _$identity);

  /// Serializes this License to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is License&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.receiveDocuments, receiveDocuments) || other.receiveDocuments == receiveDocuments)&&(identical(other.receiveDocumentsDate, receiveDocumentsDate) || other.receiveDocumentsDate == receiveDocumentsDate)&&(identical(other.receiveDocumentsNotes, receiveDocumentsNotes) || other.receiveDocumentsNotes == receiveDocumentsNotes)&&(identical(other.receiveAuthorization, receiveAuthorization) || other.receiveAuthorization == receiveAuthorization)&&(identical(other.receiveAuthorizationDate, receiveAuthorizationDate) || other.receiveAuthorizationDate == receiveAuthorizationDate)&&(identical(other.receiveAuthorizationNotes, receiveAuthorizationNotes) || other.receiveAuthorizationNotes == receiveAuthorizationNotes)&&(identical(other.siteValidity, siteValidity) || other.siteValidity == siteValidity)&&(identical(other.siteValidityDate, siteValidityDate) || other.siteValidityDate == siteValidityDate)&&(identical(other.siteValidityNotes, siteValidityNotes) || other.siteValidityNotes == siteValidityNotes)&&(identical(other.executiveStatus, executiveStatus) || other.executiveStatus == executiveStatus)&&(identical(other.executiveStatusDate, executiveStatusDate) || other.executiveStatusDate == executiveStatusDate)&&(identical(other.executiveStatusNotes, executiveStatusNotes) || other.executiveStatusNotes == executiveStatusNotes)&&(identical(other.showToOwner, showToOwner) || other.showToOwner == showToOwner)&&(identical(other.showToOwnerDate, showToOwnerDate) || other.showToOwnerDate == showToOwnerDate)&&(identical(other.showToOwnerNotes, showToOwnerNotes) || other.showToOwnerNotes == showToOwnerNotes)&&(identical(other.reviewWithAgency, reviewWithAgency) || other.reviewWithAgency == reviewWithAgency)&&(identical(other.reviewWithAgencyDate, reviewWithAgencyDate) || other.reviewWithAgencyDate == reviewWithAgencyDate)&&(identical(other.reviewWithAgencyNotes, reviewWithAgencyNotes) || other.reviewWithAgencyNotes == reviewWithAgencyNotes)&&(identical(other.civilDefense, civilDefense) || other.civilDefense == civilDefense)&&(identical(other.civilDefenseDate, civilDefenseDate) || other.civilDefenseDate == civilDefenseDate)&&(identical(other.civilDefenseNotes, civilDefenseNotes) || other.civilDefenseNotes == civilDefenseNotes)&&(identical(other.prepareStructural, prepareStructural) || other.prepareStructural == prepareStructural)&&(identical(other.prepareStructuralDate, prepareStructuralDate) || other.prepareStructuralDate == prepareStructuralDate)&&(identical(other.prepareStructuralNotes, prepareStructuralNotes) || other.prepareStructuralNotes == prepareStructuralNotes)&&(identical(other.prepareStructuralReports, prepareStructuralReports) || other.prepareStructuralReports == prepareStructuralReports)&&(identical(other.prepareStructuralReportsDate, prepareStructuralReportsDate) || other.prepareStructuralReportsDate == prepareStructuralReportsDate)&&(identical(other.prepareStructuralReportsNotes, prepareStructuralReportsNotes) || other.prepareStructuralReportsNotes == prepareStructuralReportsNotes)&&(identical(other.submitToComplex, submitToComplex) || other.submitToComplex == submitToComplex)&&(identical(other.submitToComplexDate, submitToComplexDate) || other.submitToComplexDate == submitToComplexDate)&&(identical(other.submitToComplexNotes, submitToComplexNotes) || other.submitToComplexNotes == submitToComplexNotes)&&(identical(other.supplyToComplex, supplyToComplex) || other.supplyToComplex == supplyToComplex)&&(identical(other.supplyToComplexDate, supplyToComplexDate) || other.supplyToComplexDate == supplyToComplexDate)&&(identical(other.supplyToComplexNotes, supplyToComplexNotes) || other.supplyToComplexNotes == supplyToComplexNotes)&&(identical(other.complexSupplyAmount, complexSupplyAmount) || other.complexSupplyAmount == complexSupplyAmount)&&(identical(other.doComplexNotes, doComplexNotes) || other.doComplexNotes == doComplexNotes)&&(identical(other.doComplexNotesDate, doComplexNotesDate) || other.doComplexNotesDate == doComplexNotesDate)&&(identical(other.doComplexNotesNotes, doComplexNotesNotes) || other.doComplexNotesNotes == doComplexNotesNotes)&&(identical(other.issueDocument, issueDocument) || other.issueDocument == issueDocument)&&(identical(other.issueDocumentDate, issueDocumentDate) || other.issueDocumentDate == issueDocumentDate)&&(identical(other.issueDocumentNotes, issueDocumentNotes) || other.issueDocumentNotes == issueDocumentNotes)&&(identical(other.prepareFacadeBoards, prepareFacadeBoards) || other.prepareFacadeBoards == prepareFacadeBoards)&&(identical(other.prepareFacadeBoardsDate, prepareFacadeBoardsDate) || other.prepareFacadeBoardsDate == prepareFacadeBoardsDate)&&(identical(other.prepareFacadeBoardsNotes, prepareFacadeBoardsNotes) || other.prepareFacadeBoardsNotes == prepareFacadeBoardsNotes)&&(identical(other.applyOnlineForLicense, applyOnlineForLicense) || other.applyOnlineForLicense == applyOnlineForLicense)&&(identical(other.applyOnlineForLicenseDate, applyOnlineForLicenseDate) || other.applyOnlineForLicenseDate == applyOnlineForLicenseDate)&&(identical(other.applyOnlineForLicenseNotes, applyOnlineForLicenseNotes) || other.applyOnlineForLicenseNotes == applyOnlineForLicenseNotes)&&(identical(other.requestNumber, requestNumber) || other.requestNumber == requestNumber)&&(identical(other.requestNumberNotes, requestNumberNotes) || other.requestNumberNotes == requestNumberNotes)&&(identical(other.agencyReview, agencyReview) || other.agencyReview == agencyReview)&&(identical(other.agencyReviewDate, agencyReviewDate) || other.agencyReviewDate == agencyReviewDate)&&(identical(other.agencyReviewNotes, agencyReviewNotes) || other.agencyReviewNotes == agencyReviewNotes)&&(identical(other.determineFees, determineFees) || other.determineFees == determineFees)&&(identical(other.determineFeesDate, determineFeesDate) || other.determineFeesDate == determineFeesDate)&&(identical(other.determineFeesNotes, determineFeesNotes) || other.determineFeesNotes == determineFeesNotes)&&(identical(other.payFees, payFees) || other.payFees == payFees)&&(identical(other.payFeesDate, payFeesDate) || other.payFeesDate == payFeesDate)&&(identical(other.payFeesNotes, payFeesNotes) || other.payFeesNotes == payFeesNotes)&&(identical(other.feesAmount, feesAmount) || other.feesAmount == feesAmount)&&(identical(other.issueLicense, issueLicense) || other.issueLicense == issueLicense)&&(identical(other.issueLicenseDate, issueLicenseDate) || other.issueLicenseDate == issueLicenseDate)&&(identical(other.issueLicenseNotes, issueLicenseNotes) || other.issueLicenseNotes == issueLicenseNotes)&&(identical(other.applyForStructuralMeter, applyForStructuralMeter) || other.applyForStructuralMeter == applyForStructuralMeter)&&(identical(other.applyForStructuralMeterDate, applyForStructuralMeterDate) || other.applyForStructuralMeterDate == applyForStructuralMeterDate)&&(identical(other.applyForStructuralMeterNotes, applyForStructuralMeterNotes) || other.applyForStructuralMeterNotes == applyForStructuralMeterNotes)&&(identical(other.giveBoardCopyToOwner, giveBoardCopyToOwner) || other.giveBoardCopyToOwner == giveBoardCopyToOwner)&&(identical(other.giveBoardCopyToOwnerDate, giveBoardCopyToOwnerDate) || other.giveBoardCopyToOwnerDate == giveBoardCopyToOwnerDate)&&(identical(other.giveBoardCopyToOwnerNotes, giveBoardCopyToOwnerNotes) || other.giveBoardCopyToOwnerNotes == giveBoardCopyToOwnerNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,receiveDocuments,receiveDocumentsDate,receiveDocumentsNotes,receiveAuthorization,receiveAuthorizationDate,receiveAuthorizationNotes,siteValidity,siteValidityDate,siteValidityNotes,executiveStatus,executiveStatusDate,executiveStatusNotes,showToOwner,showToOwnerDate,showToOwnerNotes,reviewWithAgency,reviewWithAgencyDate,reviewWithAgencyNotes,civilDefense,civilDefenseDate,civilDefenseNotes,prepareStructural,prepareStructuralDate,prepareStructuralNotes,prepareStructuralReports,prepareStructuralReportsDate,prepareStructuralReportsNotes,submitToComplex,submitToComplexDate,submitToComplexNotes,supplyToComplex,supplyToComplexDate,supplyToComplexNotes,complexSupplyAmount,doComplexNotes,doComplexNotesDate,doComplexNotesNotes,issueDocument,issueDocumentDate,issueDocumentNotes,prepareFacadeBoards,prepareFacadeBoardsDate,prepareFacadeBoardsNotes,applyOnlineForLicense,applyOnlineForLicenseDate,applyOnlineForLicenseNotes,requestNumber,requestNumberNotes,agencyReview,agencyReviewDate,agencyReviewNotes,determineFees,determineFeesDate,determineFeesNotes,payFees,payFeesDate,payFeesNotes,feesAmount,issueLicense,issueLicenseDate,issueLicenseNotes,applyForStructuralMeter,applyForStructuralMeterDate,applyForStructuralMeterNotes,giveBoardCopyToOwner,giveBoardCopyToOwnerDate,giveBoardCopyToOwnerNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'License(id: $id, customerId: $customerId, receiveDocuments: $receiveDocuments, receiveDocumentsDate: $receiveDocumentsDate, receiveDocumentsNotes: $receiveDocumentsNotes, receiveAuthorization: $receiveAuthorization, receiveAuthorizationDate: $receiveAuthorizationDate, receiveAuthorizationNotes: $receiveAuthorizationNotes, siteValidity: $siteValidity, siteValidityDate: $siteValidityDate, siteValidityNotes: $siteValidityNotes, executiveStatus: $executiveStatus, executiveStatusDate: $executiveStatusDate, executiveStatusNotes: $executiveStatusNotes, showToOwner: $showToOwner, showToOwnerDate: $showToOwnerDate, showToOwnerNotes: $showToOwnerNotes, reviewWithAgency: $reviewWithAgency, reviewWithAgencyDate: $reviewWithAgencyDate, reviewWithAgencyNotes: $reviewWithAgencyNotes, civilDefense: $civilDefense, civilDefenseDate: $civilDefenseDate, civilDefenseNotes: $civilDefenseNotes, prepareStructural: $prepareStructural, prepareStructuralDate: $prepareStructuralDate, prepareStructuralNotes: $prepareStructuralNotes, prepareStructuralReports: $prepareStructuralReports, prepareStructuralReportsDate: $prepareStructuralReportsDate, prepareStructuralReportsNotes: $prepareStructuralReportsNotes, submitToComplex: $submitToComplex, submitToComplexDate: $submitToComplexDate, submitToComplexNotes: $submitToComplexNotes, supplyToComplex: $supplyToComplex, supplyToComplexDate: $supplyToComplexDate, supplyToComplexNotes: $supplyToComplexNotes, complexSupplyAmount: $complexSupplyAmount, doComplexNotes: $doComplexNotes, doComplexNotesDate: $doComplexNotesDate, doComplexNotesNotes: $doComplexNotesNotes, issueDocument: $issueDocument, issueDocumentDate: $issueDocumentDate, issueDocumentNotes: $issueDocumentNotes, prepareFacadeBoards: $prepareFacadeBoards, prepareFacadeBoardsDate: $prepareFacadeBoardsDate, prepareFacadeBoardsNotes: $prepareFacadeBoardsNotes, applyOnlineForLicense: $applyOnlineForLicense, applyOnlineForLicenseDate: $applyOnlineForLicenseDate, applyOnlineForLicenseNotes: $applyOnlineForLicenseNotes, requestNumber: $requestNumber, requestNumberNotes: $requestNumberNotes, agencyReview: $agencyReview, agencyReviewDate: $agencyReviewDate, agencyReviewNotes: $agencyReviewNotes, determineFees: $determineFees, determineFeesDate: $determineFeesDate, determineFeesNotes: $determineFeesNotes, payFees: $payFees, payFeesDate: $payFeesDate, payFeesNotes: $payFeesNotes, feesAmount: $feesAmount, issueLicense: $issueLicense, issueLicenseDate: $issueLicenseDate, issueLicenseNotes: $issueLicenseNotes, applyForStructuralMeter: $applyForStructuralMeter, applyForStructuralMeterDate: $applyForStructuralMeterDate, applyForStructuralMeterNotes: $applyForStructuralMeterNotes, giveBoardCopyToOwner: $giveBoardCopyToOwner, giveBoardCopyToOwnerDate: $giveBoardCopyToOwnerDate, giveBoardCopyToOwnerNotes: $giveBoardCopyToOwnerNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LicenseCopyWith<$Res>  {
  factory $LicenseCopyWith(License value, $Res Function(License) _then) = _$LicenseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'receive_documents') bool receiveDocuments,@JsonKey(name: 'receive_documents_date') DateTime? receiveDocumentsDate,@JsonKey(name: 'receive_documents_notes') String? receiveDocumentsNotes,@JsonKey(name: 'receive_authorization') bool receiveAuthorization,@JsonKey(name: 'receive_authorization_date') DateTime? receiveAuthorizationDate,@JsonKey(name: 'receive_authorization_notes') String? receiveAuthorizationNotes,@JsonKey(name: 'site_validity') bool siteValidity,@JsonKey(name: 'site_validity_date') DateTime? siteValidityDate,@JsonKey(name: 'site_validity_notes') String? siteValidityNotes,@JsonKey(name: 'executive_status') bool executiveStatus,@JsonKey(name: 'executive_status_date') DateTime? executiveStatusDate,@JsonKey(name: 'executive_status_notes') String? executiveStatusNotes,@JsonKey(name: 'show_to_owner') bool showToOwner,@JsonKey(name: 'show_to_owner_date') DateTime? showToOwnerDate,@JsonKey(name: 'show_to_owner_notes') String? showToOwnerNotes,@JsonKey(name: 'review_with_agency') bool reviewWithAgency,@JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,@JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,@JsonKey(name: 'civil_defense') bool civilDefense,@JsonKey(name: 'civil_defense_date') DateTime? civilDefenseDate,@JsonKey(name: 'civil_defense_notes') String? civilDefenseNotes,@JsonKey(name: 'prepare_structural') bool prepareStructural,@JsonKey(name: 'prepare_structural_date') DateTime? prepareStructuralDate,@JsonKey(name: 'prepare_structural_notes') String? prepareStructuralNotes,@JsonKey(name: 'prepare_structural_reports') bool prepareStructuralReports,@JsonKey(name: 'prepare_structural_reports_date') DateTime? prepareStructuralReportsDate,@JsonKey(name: 'prepare_structural_reports_notes') String? prepareStructuralReportsNotes,@JsonKey(name: 'submit_to_complex') bool submitToComplex,@JsonKey(name: 'submit_to_complex_date') DateTime? submitToComplexDate,@JsonKey(name: 'submit_to_complex_notes') String? submitToComplexNotes,@JsonKey(name: 'supply_to_complex') bool supplyToComplex,@JsonKey(name: 'supply_to_complex_date') DateTime? supplyToComplexDate,@JsonKey(name: 'supply_to_complex_notes') String? supplyToComplexNotes,@JsonKey(name: 'complex_supply_amount') double? complexSupplyAmount,@JsonKey(name: 'do_complex_notes') bool doComplexNotes,@JsonKey(name: 'do_complex_notes_date') DateTime? doComplexNotesDate,@JsonKey(name: 'do_complex_notes_notes') String? doComplexNotesNotes,@JsonKey(name: 'issue_document') bool issueDocument,@JsonKey(name: 'issue_document_date') DateTime? issueDocumentDate,@JsonKey(name: 'issue_document_notes') String? issueDocumentNotes,@JsonKey(name: 'prepare_facade_boards') bool prepareFacadeBoards,@JsonKey(name: 'prepare_facade_boards_date') DateTime? prepareFacadeBoardsDate,@JsonKey(name: 'prepare_facade_boards_notes') String? prepareFacadeBoardsNotes,@JsonKey(name: 'apply_online_for_license') bool applyOnlineForLicense,@JsonKey(name: 'apply_online_for_license_date') DateTime? applyOnlineForLicenseDate,@JsonKey(name: 'apply_online_for_license_notes') String? applyOnlineForLicenseNotes,@JsonKey(name: 'request_number') String? requestNumber,@JsonKey(name: 'request_number_notes') String? requestNumberNotes,@JsonKey(name: 'agency_review') bool agencyReview,@JsonKey(name: 'agency_review_date') DateTime? agencyReviewDate,@JsonKey(name: 'agency_review_notes') String? agencyReviewNotes,@JsonKey(name: 'determine_fees') bool determineFees,@JsonKey(name: 'determine_fees_date') DateTime? determineFeesDate,@JsonKey(name: 'determine_fees_notes') String? determineFeesNotes,@JsonKey(name: 'pay_fees') bool payFees,@JsonKey(name: 'pay_fees_date') DateTime? payFeesDate,@JsonKey(name: 'pay_fees_notes') String? payFeesNotes,@JsonKey(name: 'fees_amount') double? feesAmount,@JsonKey(name: 'issue_license') bool issueLicense,@JsonKey(name: 'issue_license_date') DateTime? issueLicenseDate,@JsonKey(name: 'issue_license_notes') String? issueLicenseNotes,@JsonKey(name: 'apply_for_structural_meter') bool applyForStructuralMeter,@JsonKey(name: 'apply_for_structural_meter_date') DateTime? applyForStructuralMeterDate,@JsonKey(name: 'apply_for_structural_meter_notes') String? applyForStructuralMeterNotes,@JsonKey(name: 'give_board_copy_to_owner') bool giveBoardCopyToOwner,@JsonKey(name: 'give_board_copy_to_owner_date') DateTime? giveBoardCopyToOwnerDate,@JsonKey(name: 'give_board_copy_to_owner_notes') String? giveBoardCopyToOwnerNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$LicenseCopyWithImpl<$Res>
    implements $LicenseCopyWith<$Res> {
  _$LicenseCopyWithImpl(this._self, this._then);

  final License _self;
  final $Res Function(License) _then;

/// Create a copy of License
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? receiveDocuments = null,Object? receiveDocumentsDate = freezed,Object? receiveDocumentsNotes = freezed,Object? receiveAuthorization = null,Object? receiveAuthorizationDate = freezed,Object? receiveAuthorizationNotes = freezed,Object? siteValidity = null,Object? siteValidityDate = freezed,Object? siteValidityNotes = freezed,Object? executiveStatus = null,Object? executiveStatusDate = freezed,Object? executiveStatusNotes = freezed,Object? showToOwner = null,Object? showToOwnerDate = freezed,Object? showToOwnerNotes = freezed,Object? reviewWithAgency = null,Object? reviewWithAgencyDate = freezed,Object? reviewWithAgencyNotes = freezed,Object? civilDefense = null,Object? civilDefenseDate = freezed,Object? civilDefenseNotes = freezed,Object? prepareStructural = null,Object? prepareStructuralDate = freezed,Object? prepareStructuralNotes = freezed,Object? prepareStructuralReports = null,Object? prepareStructuralReportsDate = freezed,Object? prepareStructuralReportsNotes = freezed,Object? submitToComplex = null,Object? submitToComplexDate = freezed,Object? submitToComplexNotes = freezed,Object? supplyToComplex = null,Object? supplyToComplexDate = freezed,Object? supplyToComplexNotes = freezed,Object? complexSupplyAmount = freezed,Object? doComplexNotes = null,Object? doComplexNotesDate = freezed,Object? doComplexNotesNotes = freezed,Object? issueDocument = null,Object? issueDocumentDate = freezed,Object? issueDocumentNotes = freezed,Object? prepareFacadeBoards = null,Object? prepareFacadeBoardsDate = freezed,Object? prepareFacadeBoardsNotes = freezed,Object? applyOnlineForLicense = null,Object? applyOnlineForLicenseDate = freezed,Object? applyOnlineForLicenseNotes = freezed,Object? requestNumber = freezed,Object? requestNumberNotes = freezed,Object? agencyReview = null,Object? agencyReviewDate = freezed,Object? agencyReviewNotes = freezed,Object? determineFees = null,Object? determineFeesDate = freezed,Object? determineFeesNotes = freezed,Object? payFees = null,Object? payFeesDate = freezed,Object? payFeesNotes = freezed,Object? feesAmount = freezed,Object? issueLicense = null,Object? issueLicenseDate = freezed,Object? issueLicenseNotes = freezed,Object? applyForStructuralMeter = null,Object? applyForStructuralMeterDate = freezed,Object? applyForStructuralMeterNotes = freezed,Object? giveBoardCopyToOwner = null,Object? giveBoardCopyToOwnerDate = freezed,Object? giveBoardCopyToOwnerNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,receiveDocuments: null == receiveDocuments ? _self.receiveDocuments : receiveDocuments // ignore: cast_nullable_to_non_nullable
as bool,receiveDocumentsDate: freezed == receiveDocumentsDate ? _self.receiveDocumentsDate : receiveDocumentsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveDocumentsNotes: freezed == receiveDocumentsNotes ? _self.receiveDocumentsNotes : receiveDocumentsNotes // ignore: cast_nullable_to_non_nullable
as String?,receiveAuthorization: null == receiveAuthorization ? _self.receiveAuthorization : receiveAuthorization // ignore: cast_nullable_to_non_nullable
as bool,receiveAuthorizationDate: freezed == receiveAuthorizationDate ? _self.receiveAuthorizationDate : receiveAuthorizationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveAuthorizationNotes: freezed == receiveAuthorizationNotes ? _self.receiveAuthorizationNotes : receiveAuthorizationNotes // ignore: cast_nullable_to_non_nullable
as String?,siteValidity: null == siteValidity ? _self.siteValidity : siteValidity // ignore: cast_nullable_to_non_nullable
as bool,siteValidityDate: freezed == siteValidityDate ? _self.siteValidityDate : siteValidityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,siteValidityNotes: freezed == siteValidityNotes ? _self.siteValidityNotes : siteValidityNotes // ignore: cast_nullable_to_non_nullable
as String?,executiveStatus: null == executiveStatus ? _self.executiveStatus : executiveStatus // ignore: cast_nullable_to_non_nullable
as bool,executiveStatusDate: freezed == executiveStatusDate ? _self.executiveStatusDate : executiveStatusDate // ignore: cast_nullable_to_non_nullable
as DateTime?,executiveStatusNotes: freezed == executiveStatusNotes ? _self.executiveStatusNotes : executiveStatusNotes // ignore: cast_nullable_to_non_nullable
as String?,showToOwner: null == showToOwner ? _self.showToOwner : showToOwner // ignore: cast_nullable_to_non_nullable
as bool,showToOwnerDate: freezed == showToOwnerDate ? _self.showToOwnerDate : showToOwnerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,showToOwnerNotes: freezed == showToOwnerNotes ? _self.showToOwnerNotes : showToOwnerNotes // ignore: cast_nullable_to_non_nullable
as String?,reviewWithAgency: null == reviewWithAgency ? _self.reviewWithAgency : reviewWithAgency // ignore: cast_nullable_to_non_nullable
as bool,reviewWithAgencyDate: freezed == reviewWithAgencyDate ? _self.reviewWithAgencyDate : reviewWithAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewWithAgencyNotes: freezed == reviewWithAgencyNotes ? _self.reviewWithAgencyNotes : reviewWithAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,civilDefense: null == civilDefense ? _self.civilDefense : civilDefense // ignore: cast_nullable_to_non_nullable
as bool,civilDefenseDate: freezed == civilDefenseDate ? _self.civilDefenseDate : civilDefenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,civilDefenseNotes: freezed == civilDefenseNotes ? _self.civilDefenseNotes : civilDefenseNotes // ignore: cast_nullable_to_non_nullable
as String?,prepareStructural: null == prepareStructural ? _self.prepareStructural : prepareStructural // ignore: cast_nullable_to_non_nullable
as bool,prepareStructuralDate: freezed == prepareStructuralDate ? _self.prepareStructuralDate : prepareStructuralDate // ignore: cast_nullable_to_non_nullable
as DateTime?,prepareStructuralNotes: freezed == prepareStructuralNotes ? _self.prepareStructuralNotes : prepareStructuralNotes // ignore: cast_nullable_to_non_nullable
as String?,prepareStructuralReports: null == prepareStructuralReports ? _self.prepareStructuralReports : prepareStructuralReports // ignore: cast_nullable_to_non_nullable
as bool,prepareStructuralReportsDate: freezed == prepareStructuralReportsDate ? _self.prepareStructuralReportsDate : prepareStructuralReportsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,prepareStructuralReportsNotes: freezed == prepareStructuralReportsNotes ? _self.prepareStructuralReportsNotes : prepareStructuralReportsNotes // ignore: cast_nullable_to_non_nullable
as String?,submitToComplex: null == submitToComplex ? _self.submitToComplex : submitToComplex // ignore: cast_nullable_to_non_nullable
as bool,submitToComplexDate: freezed == submitToComplexDate ? _self.submitToComplexDate : submitToComplexDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitToComplexNotes: freezed == submitToComplexNotes ? _self.submitToComplexNotes : submitToComplexNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyToComplex: null == supplyToComplex ? _self.supplyToComplex : supplyToComplex // ignore: cast_nullable_to_non_nullable
as bool,supplyToComplexDate: freezed == supplyToComplexDate ? _self.supplyToComplexDate : supplyToComplexDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyToComplexNotes: freezed == supplyToComplexNotes ? _self.supplyToComplexNotes : supplyToComplexNotes // ignore: cast_nullable_to_non_nullable
as String?,complexSupplyAmount: freezed == complexSupplyAmount ? _self.complexSupplyAmount : complexSupplyAmount // ignore: cast_nullable_to_non_nullable
as double?,doComplexNotes: null == doComplexNotes ? _self.doComplexNotes : doComplexNotes // ignore: cast_nullable_to_non_nullable
as bool,doComplexNotesDate: freezed == doComplexNotesDate ? _self.doComplexNotesDate : doComplexNotesDate // ignore: cast_nullable_to_non_nullable
as DateTime?,doComplexNotesNotes: freezed == doComplexNotesNotes ? _self.doComplexNotesNotes : doComplexNotesNotes // ignore: cast_nullable_to_non_nullable
as String?,issueDocument: null == issueDocument ? _self.issueDocument : issueDocument // ignore: cast_nullable_to_non_nullable
as bool,issueDocumentDate: freezed == issueDocumentDate ? _self.issueDocumentDate : issueDocumentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,issueDocumentNotes: freezed == issueDocumentNotes ? _self.issueDocumentNotes : issueDocumentNotes // ignore: cast_nullable_to_non_nullable
as String?,prepareFacadeBoards: null == prepareFacadeBoards ? _self.prepareFacadeBoards : prepareFacadeBoards // ignore: cast_nullable_to_non_nullable
as bool,prepareFacadeBoardsDate: freezed == prepareFacadeBoardsDate ? _self.prepareFacadeBoardsDate : prepareFacadeBoardsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,prepareFacadeBoardsNotes: freezed == prepareFacadeBoardsNotes ? _self.prepareFacadeBoardsNotes : prepareFacadeBoardsNotes // ignore: cast_nullable_to_non_nullable
as String?,applyOnlineForLicense: null == applyOnlineForLicense ? _self.applyOnlineForLicense : applyOnlineForLicense // ignore: cast_nullable_to_non_nullable
as bool,applyOnlineForLicenseDate: freezed == applyOnlineForLicenseDate ? _self.applyOnlineForLicenseDate : applyOnlineForLicenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applyOnlineForLicenseNotes: freezed == applyOnlineForLicenseNotes ? _self.applyOnlineForLicenseNotes : applyOnlineForLicenseNotes // ignore: cast_nullable_to_non_nullable
as String?,requestNumber: freezed == requestNumber ? _self.requestNumber : requestNumber // ignore: cast_nullable_to_non_nullable
as String?,requestNumberNotes: freezed == requestNumberNotes ? _self.requestNumberNotes : requestNumberNotes // ignore: cast_nullable_to_non_nullable
as String?,agencyReview: null == agencyReview ? _self.agencyReview : agencyReview // ignore: cast_nullable_to_non_nullable
as bool,agencyReviewDate: freezed == agencyReviewDate ? _self.agencyReviewDate : agencyReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime?,agencyReviewNotes: freezed == agencyReviewNotes ? _self.agencyReviewNotes : agencyReviewNotes // ignore: cast_nullable_to_non_nullable
as String?,determineFees: null == determineFees ? _self.determineFees : determineFees // ignore: cast_nullable_to_non_nullable
as bool,determineFeesDate: freezed == determineFeesDate ? _self.determineFeesDate : determineFeesDate // ignore: cast_nullable_to_non_nullable
as DateTime?,determineFeesNotes: freezed == determineFeesNotes ? _self.determineFeesNotes : determineFeesNotes // ignore: cast_nullable_to_non_nullable
as String?,payFees: null == payFees ? _self.payFees : payFees // ignore: cast_nullable_to_non_nullable
as bool,payFeesDate: freezed == payFeesDate ? _self.payFeesDate : payFeesDate // ignore: cast_nullable_to_non_nullable
as DateTime?,payFeesNotes: freezed == payFeesNotes ? _self.payFeesNotes : payFeesNotes // ignore: cast_nullable_to_non_nullable
as String?,feesAmount: freezed == feesAmount ? _self.feesAmount : feesAmount // ignore: cast_nullable_to_non_nullable
as double?,issueLicense: null == issueLicense ? _self.issueLicense : issueLicense // ignore: cast_nullable_to_non_nullable
as bool,issueLicenseDate: freezed == issueLicenseDate ? _self.issueLicenseDate : issueLicenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,issueLicenseNotes: freezed == issueLicenseNotes ? _self.issueLicenseNotes : issueLicenseNotes // ignore: cast_nullable_to_non_nullable
as String?,applyForStructuralMeter: null == applyForStructuralMeter ? _self.applyForStructuralMeter : applyForStructuralMeter // ignore: cast_nullable_to_non_nullable
as bool,applyForStructuralMeterDate: freezed == applyForStructuralMeterDate ? _self.applyForStructuralMeterDate : applyForStructuralMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applyForStructuralMeterNotes: freezed == applyForStructuralMeterNotes ? _self.applyForStructuralMeterNotes : applyForStructuralMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,giveBoardCopyToOwner: null == giveBoardCopyToOwner ? _self.giveBoardCopyToOwner : giveBoardCopyToOwner // ignore: cast_nullable_to_non_nullable
as bool,giveBoardCopyToOwnerDate: freezed == giveBoardCopyToOwnerDate ? _self.giveBoardCopyToOwnerDate : giveBoardCopyToOwnerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,giveBoardCopyToOwnerNotes: freezed == giveBoardCopyToOwnerNotes ? _self.giveBoardCopyToOwnerNotes : giveBoardCopyToOwnerNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [License].
extension LicensePatterns on License {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _License value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _License() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _License value)  $default,){
final _that = this;
switch (_that) {
case _License():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _License value)?  $default,){
final _that = this;
switch (_that) {
case _License() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'receive_documents')  bool receiveDocuments, @JsonKey(name: 'receive_documents_date')  DateTime? receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes')  String? receiveDocumentsNotes, @JsonKey(name: 'receive_authorization')  bool receiveAuthorization, @JsonKey(name: 'receive_authorization_date')  DateTime? receiveAuthorizationDate, @JsonKey(name: 'receive_authorization_notes')  String? receiveAuthorizationNotes, @JsonKey(name: 'site_validity')  bool siteValidity, @JsonKey(name: 'site_validity_date')  DateTime? siteValidityDate, @JsonKey(name: 'site_validity_notes')  String? siteValidityNotes, @JsonKey(name: 'executive_status')  bool executiveStatus, @JsonKey(name: 'executive_status_date')  DateTime? executiveStatusDate, @JsonKey(name: 'executive_status_notes')  String? executiveStatusNotes, @JsonKey(name: 'show_to_owner')  bool showToOwner, @JsonKey(name: 'show_to_owner_date')  DateTime? showToOwnerDate, @JsonKey(name: 'show_to_owner_notes')  String? showToOwnerNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'civil_defense')  bool civilDefense, @JsonKey(name: 'civil_defense_date')  DateTime? civilDefenseDate, @JsonKey(name: 'civil_defense_notes')  String? civilDefenseNotes, @JsonKey(name: 'prepare_structural')  bool prepareStructural, @JsonKey(name: 'prepare_structural_date')  DateTime? prepareStructuralDate, @JsonKey(name: 'prepare_structural_notes')  String? prepareStructuralNotes, @JsonKey(name: 'prepare_structural_reports')  bool prepareStructuralReports, @JsonKey(name: 'prepare_structural_reports_date')  DateTime? prepareStructuralReportsDate, @JsonKey(name: 'prepare_structural_reports_notes')  String? prepareStructuralReportsNotes, @JsonKey(name: 'submit_to_complex')  bool submitToComplex, @JsonKey(name: 'submit_to_complex_date')  DateTime? submitToComplexDate, @JsonKey(name: 'submit_to_complex_notes')  String? submitToComplexNotes, @JsonKey(name: 'supply_to_complex')  bool supplyToComplex, @JsonKey(name: 'supply_to_complex_date')  DateTime? supplyToComplexDate, @JsonKey(name: 'supply_to_complex_notes')  String? supplyToComplexNotes, @JsonKey(name: 'complex_supply_amount')  double? complexSupplyAmount, @JsonKey(name: 'do_complex_notes')  bool doComplexNotes, @JsonKey(name: 'do_complex_notes_date')  DateTime? doComplexNotesDate, @JsonKey(name: 'do_complex_notes_notes')  String? doComplexNotesNotes, @JsonKey(name: 'issue_document')  bool issueDocument, @JsonKey(name: 'issue_document_date')  DateTime? issueDocumentDate, @JsonKey(name: 'issue_document_notes')  String? issueDocumentNotes, @JsonKey(name: 'prepare_facade_boards')  bool prepareFacadeBoards, @JsonKey(name: 'prepare_facade_boards_date')  DateTime? prepareFacadeBoardsDate, @JsonKey(name: 'prepare_facade_boards_notes')  String? prepareFacadeBoardsNotes, @JsonKey(name: 'apply_online_for_license')  bool applyOnlineForLicense, @JsonKey(name: 'apply_online_for_license_date')  DateTime? applyOnlineForLicenseDate, @JsonKey(name: 'apply_online_for_license_notes')  String? applyOnlineForLicenseNotes, @JsonKey(name: 'request_number')  String? requestNumber, @JsonKey(name: 'request_number_notes')  String? requestNumberNotes, @JsonKey(name: 'agency_review')  bool agencyReview, @JsonKey(name: 'agency_review_date')  DateTime? agencyReviewDate, @JsonKey(name: 'agency_review_notes')  String? agencyReviewNotes, @JsonKey(name: 'determine_fees')  bool determineFees, @JsonKey(name: 'determine_fees_date')  DateTime? determineFeesDate, @JsonKey(name: 'determine_fees_notes')  String? determineFeesNotes, @JsonKey(name: 'pay_fees')  bool payFees, @JsonKey(name: 'pay_fees_date')  DateTime? payFeesDate, @JsonKey(name: 'pay_fees_notes')  String? payFeesNotes, @JsonKey(name: 'fees_amount')  double? feesAmount, @JsonKey(name: 'issue_license')  bool issueLicense, @JsonKey(name: 'issue_license_date')  DateTime? issueLicenseDate, @JsonKey(name: 'issue_license_notes')  String? issueLicenseNotes, @JsonKey(name: 'apply_for_structural_meter')  bool applyForStructuralMeter, @JsonKey(name: 'apply_for_structural_meter_date')  DateTime? applyForStructuralMeterDate, @JsonKey(name: 'apply_for_structural_meter_notes')  String? applyForStructuralMeterNotes, @JsonKey(name: 'give_board_copy_to_owner')  bool giveBoardCopyToOwner, @JsonKey(name: 'give_board_copy_to_owner_date')  DateTime? giveBoardCopyToOwnerDate, @JsonKey(name: 'give_board_copy_to_owner_notes')  String? giveBoardCopyToOwnerNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _License() when $default != null:
return $default(_that.id,_that.customerId,_that.receiveDocuments,_that.receiveDocumentsDate,_that.receiveDocumentsNotes,_that.receiveAuthorization,_that.receiveAuthorizationDate,_that.receiveAuthorizationNotes,_that.siteValidity,_that.siteValidityDate,_that.siteValidityNotes,_that.executiveStatus,_that.executiveStatusDate,_that.executiveStatusNotes,_that.showToOwner,_that.showToOwnerDate,_that.showToOwnerNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.civilDefense,_that.civilDefenseDate,_that.civilDefenseNotes,_that.prepareStructural,_that.prepareStructuralDate,_that.prepareStructuralNotes,_that.prepareStructuralReports,_that.prepareStructuralReportsDate,_that.prepareStructuralReportsNotes,_that.submitToComplex,_that.submitToComplexDate,_that.submitToComplexNotes,_that.supplyToComplex,_that.supplyToComplexDate,_that.supplyToComplexNotes,_that.complexSupplyAmount,_that.doComplexNotes,_that.doComplexNotesDate,_that.doComplexNotesNotes,_that.issueDocument,_that.issueDocumentDate,_that.issueDocumentNotes,_that.prepareFacadeBoards,_that.prepareFacadeBoardsDate,_that.prepareFacadeBoardsNotes,_that.applyOnlineForLicense,_that.applyOnlineForLicenseDate,_that.applyOnlineForLicenseNotes,_that.requestNumber,_that.requestNumberNotes,_that.agencyReview,_that.agencyReviewDate,_that.agencyReviewNotes,_that.determineFees,_that.determineFeesDate,_that.determineFeesNotes,_that.payFees,_that.payFeesDate,_that.payFeesNotes,_that.feesAmount,_that.issueLicense,_that.issueLicenseDate,_that.issueLicenseNotes,_that.applyForStructuralMeter,_that.applyForStructuralMeterDate,_that.applyForStructuralMeterNotes,_that.giveBoardCopyToOwner,_that.giveBoardCopyToOwnerDate,_that.giveBoardCopyToOwnerNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'receive_documents')  bool receiveDocuments, @JsonKey(name: 'receive_documents_date')  DateTime? receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes')  String? receiveDocumentsNotes, @JsonKey(name: 'receive_authorization')  bool receiveAuthorization, @JsonKey(name: 'receive_authorization_date')  DateTime? receiveAuthorizationDate, @JsonKey(name: 'receive_authorization_notes')  String? receiveAuthorizationNotes, @JsonKey(name: 'site_validity')  bool siteValidity, @JsonKey(name: 'site_validity_date')  DateTime? siteValidityDate, @JsonKey(name: 'site_validity_notes')  String? siteValidityNotes, @JsonKey(name: 'executive_status')  bool executiveStatus, @JsonKey(name: 'executive_status_date')  DateTime? executiveStatusDate, @JsonKey(name: 'executive_status_notes')  String? executiveStatusNotes, @JsonKey(name: 'show_to_owner')  bool showToOwner, @JsonKey(name: 'show_to_owner_date')  DateTime? showToOwnerDate, @JsonKey(name: 'show_to_owner_notes')  String? showToOwnerNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'civil_defense')  bool civilDefense, @JsonKey(name: 'civil_defense_date')  DateTime? civilDefenseDate, @JsonKey(name: 'civil_defense_notes')  String? civilDefenseNotes, @JsonKey(name: 'prepare_structural')  bool prepareStructural, @JsonKey(name: 'prepare_structural_date')  DateTime? prepareStructuralDate, @JsonKey(name: 'prepare_structural_notes')  String? prepareStructuralNotes, @JsonKey(name: 'prepare_structural_reports')  bool prepareStructuralReports, @JsonKey(name: 'prepare_structural_reports_date')  DateTime? prepareStructuralReportsDate, @JsonKey(name: 'prepare_structural_reports_notes')  String? prepareStructuralReportsNotes, @JsonKey(name: 'submit_to_complex')  bool submitToComplex, @JsonKey(name: 'submit_to_complex_date')  DateTime? submitToComplexDate, @JsonKey(name: 'submit_to_complex_notes')  String? submitToComplexNotes, @JsonKey(name: 'supply_to_complex')  bool supplyToComplex, @JsonKey(name: 'supply_to_complex_date')  DateTime? supplyToComplexDate, @JsonKey(name: 'supply_to_complex_notes')  String? supplyToComplexNotes, @JsonKey(name: 'complex_supply_amount')  double? complexSupplyAmount, @JsonKey(name: 'do_complex_notes')  bool doComplexNotes, @JsonKey(name: 'do_complex_notes_date')  DateTime? doComplexNotesDate, @JsonKey(name: 'do_complex_notes_notes')  String? doComplexNotesNotes, @JsonKey(name: 'issue_document')  bool issueDocument, @JsonKey(name: 'issue_document_date')  DateTime? issueDocumentDate, @JsonKey(name: 'issue_document_notes')  String? issueDocumentNotes, @JsonKey(name: 'prepare_facade_boards')  bool prepareFacadeBoards, @JsonKey(name: 'prepare_facade_boards_date')  DateTime? prepareFacadeBoardsDate, @JsonKey(name: 'prepare_facade_boards_notes')  String? prepareFacadeBoardsNotes, @JsonKey(name: 'apply_online_for_license')  bool applyOnlineForLicense, @JsonKey(name: 'apply_online_for_license_date')  DateTime? applyOnlineForLicenseDate, @JsonKey(name: 'apply_online_for_license_notes')  String? applyOnlineForLicenseNotes, @JsonKey(name: 'request_number')  String? requestNumber, @JsonKey(name: 'request_number_notes')  String? requestNumberNotes, @JsonKey(name: 'agency_review')  bool agencyReview, @JsonKey(name: 'agency_review_date')  DateTime? agencyReviewDate, @JsonKey(name: 'agency_review_notes')  String? agencyReviewNotes, @JsonKey(name: 'determine_fees')  bool determineFees, @JsonKey(name: 'determine_fees_date')  DateTime? determineFeesDate, @JsonKey(name: 'determine_fees_notes')  String? determineFeesNotes, @JsonKey(name: 'pay_fees')  bool payFees, @JsonKey(name: 'pay_fees_date')  DateTime? payFeesDate, @JsonKey(name: 'pay_fees_notes')  String? payFeesNotes, @JsonKey(name: 'fees_amount')  double? feesAmount, @JsonKey(name: 'issue_license')  bool issueLicense, @JsonKey(name: 'issue_license_date')  DateTime? issueLicenseDate, @JsonKey(name: 'issue_license_notes')  String? issueLicenseNotes, @JsonKey(name: 'apply_for_structural_meter')  bool applyForStructuralMeter, @JsonKey(name: 'apply_for_structural_meter_date')  DateTime? applyForStructuralMeterDate, @JsonKey(name: 'apply_for_structural_meter_notes')  String? applyForStructuralMeterNotes, @JsonKey(name: 'give_board_copy_to_owner')  bool giveBoardCopyToOwner, @JsonKey(name: 'give_board_copy_to_owner_date')  DateTime? giveBoardCopyToOwnerDate, @JsonKey(name: 'give_board_copy_to_owner_notes')  String? giveBoardCopyToOwnerNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _License():
return $default(_that.id,_that.customerId,_that.receiveDocuments,_that.receiveDocumentsDate,_that.receiveDocumentsNotes,_that.receiveAuthorization,_that.receiveAuthorizationDate,_that.receiveAuthorizationNotes,_that.siteValidity,_that.siteValidityDate,_that.siteValidityNotes,_that.executiveStatus,_that.executiveStatusDate,_that.executiveStatusNotes,_that.showToOwner,_that.showToOwnerDate,_that.showToOwnerNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.civilDefense,_that.civilDefenseDate,_that.civilDefenseNotes,_that.prepareStructural,_that.prepareStructuralDate,_that.prepareStructuralNotes,_that.prepareStructuralReports,_that.prepareStructuralReportsDate,_that.prepareStructuralReportsNotes,_that.submitToComplex,_that.submitToComplexDate,_that.submitToComplexNotes,_that.supplyToComplex,_that.supplyToComplexDate,_that.supplyToComplexNotes,_that.complexSupplyAmount,_that.doComplexNotes,_that.doComplexNotesDate,_that.doComplexNotesNotes,_that.issueDocument,_that.issueDocumentDate,_that.issueDocumentNotes,_that.prepareFacadeBoards,_that.prepareFacadeBoardsDate,_that.prepareFacadeBoardsNotes,_that.applyOnlineForLicense,_that.applyOnlineForLicenseDate,_that.applyOnlineForLicenseNotes,_that.requestNumber,_that.requestNumberNotes,_that.agencyReview,_that.agencyReviewDate,_that.agencyReviewNotes,_that.determineFees,_that.determineFeesDate,_that.determineFeesNotes,_that.payFees,_that.payFeesDate,_that.payFeesNotes,_that.feesAmount,_that.issueLicense,_that.issueLicenseDate,_that.issueLicenseNotes,_that.applyForStructuralMeter,_that.applyForStructuralMeterDate,_that.applyForStructuralMeterNotes,_that.giveBoardCopyToOwner,_that.giveBoardCopyToOwnerDate,_that.giveBoardCopyToOwnerNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'receive_documents')  bool receiveDocuments, @JsonKey(name: 'receive_documents_date')  DateTime? receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes')  String? receiveDocumentsNotes, @JsonKey(name: 'receive_authorization')  bool receiveAuthorization, @JsonKey(name: 'receive_authorization_date')  DateTime? receiveAuthorizationDate, @JsonKey(name: 'receive_authorization_notes')  String? receiveAuthorizationNotes, @JsonKey(name: 'site_validity')  bool siteValidity, @JsonKey(name: 'site_validity_date')  DateTime? siteValidityDate, @JsonKey(name: 'site_validity_notes')  String? siteValidityNotes, @JsonKey(name: 'executive_status')  bool executiveStatus, @JsonKey(name: 'executive_status_date')  DateTime? executiveStatusDate, @JsonKey(name: 'executive_status_notes')  String? executiveStatusNotes, @JsonKey(name: 'show_to_owner')  bool showToOwner, @JsonKey(name: 'show_to_owner_date')  DateTime? showToOwnerDate, @JsonKey(name: 'show_to_owner_notes')  String? showToOwnerNotes, @JsonKey(name: 'review_with_agency')  bool reviewWithAgency, @JsonKey(name: 'review_with_agency_date')  DateTime? reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes')  String? reviewWithAgencyNotes, @JsonKey(name: 'civil_defense')  bool civilDefense, @JsonKey(name: 'civil_defense_date')  DateTime? civilDefenseDate, @JsonKey(name: 'civil_defense_notes')  String? civilDefenseNotes, @JsonKey(name: 'prepare_structural')  bool prepareStructural, @JsonKey(name: 'prepare_structural_date')  DateTime? prepareStructuralDate, @JsonKey(name: 'prepare_structural_notes')  String? prepareStructuralNotes, @JsonKey(name: 'prepare_structural_reports')  bool prepareStructuralReports, @JsonKey(name: 'prepare_structural_reports_date')  DateTime? prepareStructuralReportsDate, @JsonKey(name: 'prepare_structural_reports_notes')  String? prepareStructuralReportsNotes, @JsonKey(name: 'submit_to_complex')  bool submitToComplex, @JsonKey(name: 'submit_to_complex_date')  DateTime? submitToComplexDate, @JsonKey(name: 'submit_to_complex_notes')  String? submitToComplexNotes, @JsonKey(name: 'supply_to_complex')  bool supplyToComplex, @JsonKey(name: 'supply_to_complex_date')  DateTime? supplyToComplexDate, @JsonKey(name: 'supply_to_complex_notes')  String? supplyToComplexNotes, @JsonKey(name: 'complex_supply_amount')  double? complexSupplyAmount, @JsonKey(name: 'do_complex_notes')  bool doComplexNotes, @JsonKey(name: 'do_complex_notes_date')  DateTime? doComplexNotesDate, @JsonKey(name: 'do_complex_notes_notes')  String? doComplexNotesNotes, @JsonKey(name: 'issue_document')  bool issueDocument, @JsonKey(name: 'issue_document_date')  DateTime? issueDocumentDate, @JsonKey(name: 'issue_document_notes')  String? issueDocumentNotes, @JsonKey(name: 'prepare_facade_boards')  bool prepareFacadeBoards, @JsonKey(name: 'prepare_facade_boards_date')  DateTime? prepareFacadeBoardsDate, @JsonKey(name: 'prepare_facade_boards_notes')  String? prepareFacadeBoardsNotes, @JsonKey(name: 'apply_online_for_license')  bool applyOnlineForLicense, @JsonKey(name: 'apply_online_for_license_date')  DateTime? applyOnlineForLicenseDate, @JsonKey(name: 'apply_online_for_license_notes')  String? applyOnlineForLicenseNotes, @JsonKey(name: 'request_number')  String? requestNumber, @JsonKey(name: 'request_number_notes')  String? requestNumberNotes, @JsonKey(name: 'agency_review')  bool agencyReview, @JsonKey(name: 'agency_review_date')  DateTime? agencyReviewDate, @JsonKey(name: 'agency_review_notes')  String? agencyReviewNotes, @JsonKey(name: 'determine_fees')  bool determineFees, @JsonKey(name: 'determine_fees_date')  DateTime? determineFeesDate, @JsonKey(name: 'determine_fees_notes')  String? determineFeesNotes, @JsonKey(name: 'pay_fees')  bool payFees, @JsonKey(name: 'pay_fees_date')  DateTime? payFeesDate, @JsonKey(name: 'pay_fees_notes')  String? payFeesNotes, @JsonKey(name: 'fees_amount')  double? feesAmount, @JsonKey(name: 'issue_license')  bool issueLicense, @JsonKey(name: 'issue_license_date')  DateTime? issueLicenseDate, @JsonKey(name: 'issue_license_notes')  String? issueLicenseNotes, @JsonKey(name: 'apply_for_structural_meter')  bool applyForStructuralMeter, @JsonKey(name: 'apply_for_structural_meter_date')  DateTime? applyForStructuralMeterDate, @JsonKey(name: 'apply_for_structural_meter_notes')  String? applyForStructuralMeterNotes, @JsonKey(name: 'give_board_copy_to_owner')  bool giveBoardCopyToOwner, @JsonKey(name: 'give_board_copy_to_owner_date')  DateTime? giveBoardCopyToOwnerDate, @JsonKey(name: 'give_board_copy_to_owner_notes')  String? giveBoardCopyToOwnerNotes, @JsonKey(name: 'stage_notes')  String? stageNotes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _License() when $default != null:
return $default(_that.id,_that.customerId,_that.receiveDocuments,_that.receiveDocumentsDate,_that.receiveDocumentsNotes,_that.receiveAuthorization,_that.receiveAuthorizationDate,_that.receiveAuthorizationNotes,_that.siteValidity,_that.siteValidityDate,_that.siteValidityNotes,_that.executiveStatus,_that.executiveStatusDate,_that.executiveStatusNotes,_that.showToOwner,_that.showToOwnerDate,_that.showToOwnerNotes,_that.reviewWithAgency,_that.reviewWithAgencyDate,_that.reviewWithAgencyNotes,_that.civilDefense,_that.civilDefenseDate,_that.civilDefenseNotes,_that.prepareStructural,_that.prepareStructuralDate,_that.prepareStructuralNotes,_that.prepareStructuralReports,_that.prepareStructuralReportsDate,_that.prepareStructuralReportsNotes,_that.submitToComplex,_that.submitToComplexDate,_that.submitToComplexNotes,_that.supplyToComplex,_that.supplyToComplexDate,_that.supplyToComplexNotes,_that.complexSupplyAmount,_that.doComplexNotes,_that.doComplexNotesDate,_that.doComplexNotesNotes,_that.issueDocument,_that.issueDocumentDate,_that.issueDocumentNotes,_that.prepareFacadeBoards,_that.prepareFacadeBoardsDate,_that.prepareFacadeBoardsNotes,_that.applyOnlineForLicense,_that.applyOnlineForLicenseDate,_that.applyOnlineForLicenseNotes,_that.requestNumber,_that.requestNumberNotes,_that.agencyReview,_that.agencyReviewDate,_that.agencyReviewNotes,_that.determineFees,_that.determineFeesDate,_that.determineFeesNotes,_that.payFees,_that.payFeesDate,_that.payFeesNotes,_that.feesAmount,_that.issueLicense,_that.issueLicenseDate,_that.issueLicenseNotes,_that.applyForStructuralMeter,_that.applyForStructuralMeterDate,_that.applyForStructuralMeterNotes,_that.giveBoardCopyToOwner,_that.giveBoardCopyToOwnerDate,_that.giveBoardCopyToOwnerNotes,_that.stageNotes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _License extends License {
  const _License({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'receive_documents') this.receiveDocuments = false, @JsonKey(name: 'receive_documents_date') this.receiveDocumentsDate, @JsonKey(name: 'receive_documents_notes') this.receiveDocumentsNotes, @JsonKey(name: 'receive_authorization') this.receiveAuthorization = false, @JsonKey(name: 'receive_authorization_date') this.receiveAuthorizationDate, @JsonKey(name: 'receive_authorization_notes') this.receiveAuthorizationNotes, @JsonKey(name: 'site_validity') this.siteValidity = false, @JsonKey(name: 'site_validity_date') this.siteValidityDate, @JsonKey(name: 'site_validity_notes') this.siteValidityNotes, @JsonKey(name: 'executive_status') this.executiveStatus = false, @JsonKey(name: 'executive_status_date') this.executiveStatusDate, @JsonKey(name: 'executive_status_notes') this.executiveStatusNotes, @JsonKey(name: 'show_to_owner') this.showToOwner = false, @JsonKey(name: 'show_to_owner_date') this.showToOwnerDate, @JsonKey(name: 'show_to_owner_notes') this.showToOwnerNotes, @JsonKey(name: 'review_with_agency') this.reviewWithAgency = false, @JsonKey(name: 'review_with_agency_date') this.reviewWithAgencyDate, @JsonKey(name: 'review_with_agency_notes') this.reviewWithAgencyNotes, @JsonKey(name: 'civil_defense') this.civilDefense = false, @JsonKey(name: 'civil_defense_date') this.civilDefenseDate, @JsonKey(name: 'civil_defense_notes') this.civilDefenseNotes, @JsonKey(name: 'prepare_structural') this.prepareStructural = false, @JsonKey(name: 'prepare_structural_date') this.prepareStructuralDate, @JsonKey(name: 'prepare_structural_notes') this.prepareStructuralNotes, @JsonKey(name: 'prepare_structural_reports') this.prepareStructuralReports = false, @JsonKey(name: 'prepare_structural_reports_date') this.prepareStructuralReportsDate, @JsonKey(name: 'prepare_structural_reports_notes') this.prepareStructuralReportsNotes, @JsonKey(name: 'submit_to_complex') this.submitToComplex = false, @JsonKey(name: 'submit_to_complex_date') this.submitToComplexDate, @JsonKey(name: 'submit_to_complex_notes') this.submitToComplexNotes, @JsonKey(name: 'supply_to_complex') this.supplyToComplex = false, @JsonKey(name: 'supply_to_complex_date') this.supplyToComplexDate, @JsonKey(name: 'supply_to_complex_notes') this.supplyToComplexNotes, @JsonKey(name: 'complex_supply_amount') this.complexSupplyAmount, @JsonKey(name: 'do_complex_notes') this.doComplexNotes = false, @JsonKey(name: 'do_complex_notes_date') this.doComplexNotesDate, @JsonKey(name: 'do_complex_notes_notes') this.doComplexNotesNotes, @JsonKey(name: 'issue_document') this.issueDocument = false, @JsonKey(name: 'issue_document_date') this.issueDocumentDate, @JsonKey(name: 'issue_document_notes') this.issueDocumentNotes, @JsonKey(name: 'prepare_facade_boards') this.prepareFacadeBoards = false, @JsonKey(name: 'prepare_facade_boards_date') this.prepareFacadeBoardsDate, @JsonKey(name: 'prepare_facade_boards_notes') this.prepareFacadeBoardsNotes, @JsonKey(name: 'apply_online_for_license') this.applyOnlineForLicense = false, @JsonKey(name: 'apply_online_for_license_date') this.applyOnlineForLicenseDate, @JsonKey(name: 'apply_online_for_license_notes') this.applyOnlineForLicenseNotes, @JsonKey(name: 'request_number') this.requestNumber, @JsonKey(name: 'request_number_notes') this.requestNumberNotes, @JsonKey(name: 'agency_review') this.agencyReview = false, @JsonKey(name: 'agency_review_date') this.agencyReviewDate, @JsonKey(name: 'agency_review_notes') this.agencyReviewNotes, @JsonKey(name: 'determine_fees') this.determineFees = false, @JsonKey(name: 'determine_fees_date') this.determineFeesDate, @JsonKey(name: 'determine_fees_notes') this.determineFeesNotes, @JsonKey(name: 'pay_fees') this.payFees = false, @JsonKey(name: 'pay_fees_date') this.payFeesDate, @JsonKey(name: 'pay_fees_notes') this.payFeesNotes, @JsonKey(name: 'fees_amount') this.feesAmount, @JsonKey(name: 'issue_license') this.issueLicense = false, @JsonKey(name: 'issue_license_date') this.issueLicenseDate, @JsonKey(name: 'issue_license_notes') this.issueLicenseNotes, @JsonKey(name: 'apply_for_structural_meter') this.applyForStructuralMeter = false, @JsonKey(name: 'apply_for_structural_meter_date') this.applyForStructuralMeterDate, @JsonKey(name: 'apply_for_structural_meter_notes') this.applyForStructuralMeterNotes, @JsonKey(name: 'give_board_copy_to_owner') this.giveBoardCopyToOwner = false, @JsonKey(name: 'give_board_copy_to_owner_date') this.giveBoardCopyToOwnerDate, @JsonKey(name: 'give_board_copy_to_owner_notes') this.giveBoardCopyToOwnerNotes, @JsonKey(name: 'stage_notes') this.stageNotes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): super._();
  factory _License.fromJson(Map<String, dynamic> json) => _$LicenseFromJson(json);

@override final  int id;
@override@JsonKey(name: 'customer_id') final  int customerId;
// Step 1: استلام الأوراق
@override@JsonKey(name: 'receive_documents') final  bool receiveDocuments;
@override@JsonKey(name: 'receive_documents_date') final  DateTime? receiveDocumentsDate;
@override@JsonKey(name: 'receive_documents_notes') final  String? receiveDocumentsNotes;
// Step 2: استلام التوكيل
@override@JsonKey(name: 'receive_authorization') final  bool receiveAuthorization;
@override@JsonKey(name: 'receive_authorization_date') final  DateTime? receiveAuthorizationDate;
@override@JsonKey(name: 'receive_authorization_notes') final  String? receiveAuthorizationNotes;
// Step 3: صلاحية موقع
@override@JsonKey(name: 'site_validity') final  bool siteValidity;
@override@JsonKey(name: 'site_validity_date') final  DateTime? siteValidityDate;
@override@JsonKey(name: 'site_validity_notes') final  String? siteValidityNotes;
// Step 4: موقف تنفيذي
@override@JsonKey(name: 'executive_status') final  bool executiveStatus;
@override@JsonKey(name: 'executive_status_date') final  DateTime? executiveStatusDate;
@override@JsonKey(name: 'executive_status_notes') final  String? executiveStatusNotes;
// Step 5: عرض على المالك (NEW)
@override@JsonKey(name: 'show_to_owner') final  bool showToOwner;
@override@JsonKey(name: 'show_to_owner_date') final  DateTime? showToOwnerDate;
@override@JsonKey(name: 'show_to_owner_notes') final  String? showToOwnerNotes;
// Step 6: مراجعة مع الجهاز
@override@JsonKey(name: 'review_with_agency') final  bool reviewWithAgency;
@override@JsonKey(name: 'review_with_agency_date') final  DateTime? reviewWithAgencyDate;
@override@JsonKey(name: 'review_with_agency_notes') final  String? reviewWithAgencyNotes;
// Step 7: دفاع مدني
@override@JsonKey(name: 'civil_defense') final  bool civilDefense;
@override@JsonKey(name: 'civil_defense_date') final  DateTime? civilDefenseDate;
@override@JsonKey(name: 'civil_defense_notes') final  String? civilDefenseNotes;
// Step 8: تجهيز الانشائي
@override@JsonKey(name: 'prepare_structural') final  bool prepareStructural;
@override@JsonKey(name: 'prepare_structural_date') final  DateTime? prepareStructuralDate;
@override@JsonKey(name: 'prepare_structural_notes') final  String? prepareStructuralNotes;
// Step 9: تجهيز تقارير الانشائي
@override@JsonKey(name: 'prepare_structural_reports') final  bool prepareStructuralReports;
@override@JsonKey(name: 'prepare_structural_reports_date') final  DateTime? prepareStructuralReportsDate;
@override@JsonKey(name: 'prepare_structural_reports_notes') final  String? prepareStructuralReportsNotes;
// Step 10: تقديم المجمعة
@override@JsonKey(name: 'submit_to_complex') final  bool submitToComplex;
@override@JsonKey(name: 'submit_to_complex_date') final  DateTime? submitToComplexDate;
@override@JsonKey(name: 'submit_to_complex_notes') final  String? submitToComplexNotes;
// Step 11: توريد المجمعة (has money field)
@override@JsonKey(name: 'supply_to_complex') final  bool supplyToComplex;
@override@JsonKey(name: 'supply_to_complex_date') final  DateTime? supplyToComplexDate;
@override@JsonKey(name: 'supply_to_complex_notes') final  String? supplyToComplexNotes;
@override@JsonKey(name: 'complex_supply_amount') final  double? complexSupplyAmount;
// Step 12: عمل ملاحظات المجمعة
@override@JsonKey(name: 'do_complex_notes') final  bool doComplexNotes;
@override@JsonKey(name: 'do_complex_notes_date') final  DateTime? doComplexNotesDate;
@override@JsonKey(name: 'do_complex_notes_notes') final  String? doComplexNotesNotes;
// Step 13: اصدار الوثيقة
@override@JsonKey(name: 'issue_document') final  bool issueDocument;
@override@JsonKey(name: 'issue_document_date') final  DateTime? issueDocumentDate;
@override@JsonKey(name: 'issue_document_notes') final  String? issueDocumentNotes;
// Step 14: تجهيز لوحات الواجهات والصحى والكهرباء (NEW)
@override@JsonKey(name: 'prepare_facade_boards') final  bool prepareFacadeBoards;
@override@JsonKey(name: 'prepare_facade_boards_date') final  DateTime? prepareFacadeBoardsDate;
@override@JsonKey(name: 'prepare_facade_boards_notes') final  String? prepareFacadeBoardsNotes;
// Step 15: التقديم علي الموقع لاصدار الترخيص
@override@JsonKey(name: 'apply_online_for_license') final  bool applyOnlineForLicense;
@override@JsonKey(name: 'apply_online_for_license_date') final  DateTime? applyOnlineForLicenseDate;
@override@JsonKey(name: 'apply_online_for_license_notes') final  String? applyOnlineForLicenseNotes;
// Step 16: رقم الطلب
@override@JsonKey(name: 'request_number') final  String? requestNumber;
@override@JsonKey(name: 'request_number_notes') final  String? requestNumberNotes;
// Step 17: مراجعة الجهاز (NEW)
@override@JsonKey(name: 'agency_review') final  bool agencyReview;
@override@JsonKey(name: 'agency_review_date') final  DateTime? agencyReviewDate;
@override@JsonKey(name: 'agency_review_notes') final  String? agencyReviewNotes;
// Step 18: تحديد الرسوم
@override@JsonKey(name: 'determine_fees') final  bool determineFees;
@override@JsonKey(name: 'determine_fees_date') final  DateTime? determineFeesDate;
@override@JsonKey(name: 'determine_fees_notes') final  String? determineFeesNotes;
// Step 19: سداد الرسوم (has money field)
@override@JsonKey(name: 'pay_fees') final  bool payFees;
@override@JsonKey(name: 'pay_fees_date') final  DateTime? payFeesDate;
@override@JsonKey(name: 'pay_fees_notes') final  String? payFeesNotes;
@override@JsonKey(name: 'fees_amount') final  double? feesAmount;
// Step 20: اصدار الرخصة
@override@JsonKey(name: 'issue_license') final  bool issueLicense;
@override@JsonKey(name: 'issue_license_date') final  DateTime? issueLicenseDate;
@override@JsonKey(name: 'issue_license_notes') final  String? issueLicenseNotes;
// Step 21: تقديم علي عداد انشائي
@override@JsonKey(name: 'apply_for_structural_meter') final  bool applyForStructuralMeter;
@override@JsonKey(name: 'apply_for_structural_meter_date') final  DateTime? applyForStructuralMeterDate;
@override@JsonKey(name: 'apply_for_structural_meter_notes') final  String? applyForStructuralMeterNotes;
// Step 22: إعطاء نسخة اللوحات للمالك
@override@JsonKey(name: 'give_board_copy_to_owner') final  bool giveBoardCopyToOwner;
@override@JsonKey(name: 'give_board_copy_to_owner_date') final  DateTime? giveBoardCopyToOwnerDate;
@override@JsonKey(name: 'give_board_copy_to_owner_notes') final  String? giveBoardCopyToOwnerNotes;
// General stage notes
@override@JsonKey(name: 'stage_notes') final  String? stageNotes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of License
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LicenseCopyWith<_License> get copyWith => __$LicenseCopyWithImpl<_License>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LicenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _License&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.receiveDocuments, receiveDocuments) || other.receiveDocuments == receiveDocuments)&&(identical(other.receiveDocumentsDate, receiveDocumentsDate) || other.receiveDocumentsDate == receiveDocumentsDate)&&(identical(other.receiveDocumentsNotes, receiveDocumentsNotes) || other.receiveDocumentsNotes == receiveDocumentsNotes)&&(identical(other.receiveAuthorization, receiveAuthorization) || other.receiveAuthorization == receiveAuthorization)&&(identical(other.receiveAuthorizationDate, receiveAuthorizationDate) || other.receiveAuthorizationDate == receiveAuthorizationDate)&&(identical(other.receiveAuthorizationNotes, receiveAuthorizationNotes) || other.receiveAuthorizationNotes == receiveAuthorizationNotes)&&(identical(other.siteValidity, siteValidity) || other.siteValidity == siteValidity)&&(identical(other.siteValidityDate, siteValidityDate) || other.siteValidityDate == siteValidityDate)&&(identical(other.siteValidityNotes, siteValidityNotes) || other.siteValidityNotes == siteValidityNotes)&&(identical(other.executiveStatus, executiveStatus) || other.executiveStatus == executiveStatus)&&(identical(other.executiveStatusDate, executiveStatusDate) || other.executiveStatusDate == executiveStatusDate)&&(identical(other.executiveStatusNotes, executiveStatusNotes) || other.executiveStatusNotes == executiveStatusNotes)&&(identical(other.showToOwner, showToOwner) || other.showToOwner == showToOwner)&&(identical(other.showToOwnerDate, showToOwnerDate) || other.showToOwnerDate == showToOwnerDate)&&(identical(other.showToOwnerNotes, showToOwnerNotes) || other.showToOwnerNotes == showToOwnerNotes)&&(identical(other.reviewWithAgency, reviewWithAgency) || other.reviewWithAgency == reviewWithAgency)&&(identical(other.reviewWithAgencyDate, reviewWithAgencyDate) || other.reviewWithAgencyDate == reviewWithAgencyDate)&&(identical(other.reviewWithAgencyNotes, reviewWithAgencyNotes) || other.reviewWithAgencyNotes == reviewWithAgencyNotes)&&(identical(other.civilDefense, civilDefense) || other.civilDefense == civilDefense)&&(identical(other.civilDefenseDate, civilDefenseDate) || other.civilDefenseDate == civilDefenseDate)&&(identical(other.civilDefenseNotes, civilDefenseNotes) || other.civilDefenseNotes == civilDefenseNotes)&&(identical(other.prepareStructural, prepareStructural) || other.prepareStructural == prepareStructural)&&(identical(other.prepareStructuralDate, prepareStructuralDate) || other.prepareStructuralDate == prepareStructuralDate)&&(identical(other.prepareStructuralNotes, prepareStructuralNotes) || other.prepareStructuralNotes == prepareStructuralNotes)&&(identical(other.prepareStructuralReports, prepareStructuralReports) || other.prepareStructuralReports == prepareStructuralReports)&&(identical(other.prepareStructuralReportsDate, prepareStructuralReportsDate) || other.prepareStructuralReportsDate == prepareStructuralReportsDate)&&(identical(other.prepareStructuralReportsNotes, prepareStructuralReportsNotes) || other.prepareStructuralReportsNotes == prepareStructuralReportsNotes)&&(identical(other.submitToComplex, submitToComplex) || other.submitToComplex == submitToComplex)&&(identical(other.submitToComplexDate, submitToComplexDate) || other.submitToComplexDate == submitToComplexDate)&&(identical(other.submitToComplexNotes, submitToComplexNotes) || other.submitToComplexNotes == submitToComplexNotes)&&(identical(other.supplyToComplex, supplyToComplex) || other.supplyToComplex == supplyToComplex)&&(identical(other.supplyToComplexDate, supplyToComplexDate) || other.supplyToComplexDate == supplyToComplexDate)&&(identical(other.supplyToComplexNotes, supplyToComplexNotes) || other.supplyToComplexNotes == supplyToComplexNotes)&&(identical(other.complexSupplyAmount, complexSupplyAmount) || other.complexSupplyAmount == complexSupplyAmount)&&(identical(other.doComplexNotes, doComplexNotes) || other.doComplexNotes == doComplexNotes)&&(identical(other.doComplexNotesDate, doComplexNotesDate) || other.doComplexNotesDate == doComplexNotesDate)&&(identical(other.doComplexNotesNotes, doComplexNotesNotes) || other.doComplexNotesNotes == doComplexNotesNotes)&&(identical(other.issueDocument, issueDocument) || other.issueDocument == issueDocument)&&(identical(other.issueDocumentDate, issueDocumentDate) || other.issueDocumentDate == issueDocumentDate)&&(identical(other.issueDocumentNotes, issueDocumentNotes) || other.issueDocumentNotes == issueDocumentNotes)&&(identical(other.prepareFacadeBoards, prepareFacadeBoards) || other.prepareFacadeBoards == prepareFacadeBoards)&&(identical(other.prepareFacadeBoardsDate, prepareFacadeBoardsDate) || other.prepareFacadeBoardsDate == prepareFacadeBoardsDate)&&(identical(other.prepareFacadeBoardsNotes, prepareFacadeBoardsNotes) || other.prepareFacadeBoardsNotes == prepareFacadeBoardsNotes)&&(identical(other.applyOnlineForLicense, applyOnlineForLicense) || other.applyOnlineForLicense == applyOnlineForLicense)&&(identical(other.applyOnlineForLicenseDate, applyOnlineForLicenseDate) || other.applyOnlineForLicenseDate == applyOnlineForLicenseDate)&&(identical(other.applyOnlineForLicenseNotes, applyOnlineForLicenseNotes) || other.applyOnlineForLicenseNotes == applyOnlineForLicenseNotes)&&(identical(other.requestNumber, requestNumber) || other.requestNumber == requestNumber)&&(identical(other.requestNumberNotes, requestNumberNotes) || other.requestNumberNotes == requestNumberNotes)&&(identical(other.agencyReview, agencyReview) || other.agencyReview == agencyReview)&&(identical(other.agencyReviewDate, agencyReviewDate) || other.agencyReviewDate == agencyReviewDate)&&(identical(other.agencyReviewNotes, agencyReviewNotes) || other.agencyReviewNotes == agencyReviewNotes)&&(identical(other.determineFees, determineFees) || other.determineFees == determineFees)&&(identical(other.determineFeesDate, determineFeesDate) || other.determineFeesDate == determineFeesDate)&&(identical(other.determineFeesNotes, determineFeesNotes) || other.determineFeesNotes == determineFeesNotes)&&(identical(other.payFees, payFees) || other.payFees == payFees)&&(identical(other.payFeesDate, payFeesDate) || other.payFeesDate == payFeesDate)&&(identical(other.payFeesNotes, payFeesNotes) || other.payFeesNotes == payFeesNotes)&&(identical(other.feesAmount, feesAmount) || other.feesAmount == feesAmount)&&(identical(other.issueLicense, issueLicense) || other.issueLicense == issueLicense)&&(identical(other.issueLicenseDate, issueLicenseDate) || other.issueLicenseDate == issueLicenseDate)&&(identical(other.issueLicenseNotes, issueLicenseNotes) || other.issueLicenseNotes == issueLicenseNotes)&&(identical(other.applyForStructuralMeter, applyForStructuralMeter) || other.applyForStructuralMeter == applyForStructuralMeter)&&(identical(other.applyForStructuralMeterDate, applyForStructuralMeterDate) || other.applyForStructuralMeterDate == applyForStructuralMeterDate)&&(identical(other.applyForStructuralMeterNotes, applyForStructuralMeterNotes) || other.applyForStructuralMeterNotes == applyForStructuralMeterNotes)&&(identical(other.giveBoardCopyToOwner, giveBoardCopyToOwner) || other.giveBoardCopyToOwner == giveBoardCopyToOwner)&&(identical(other.giveBoardCopyToOwnerDate, giveBoardCopyToOwnerDate) || other.giveBoardCopyToOwnerDate == giveBoardCopyToOwnerDate)&&(identical(other.giveBoardCopyToOwnerNotes, giveBoardCopyToOwnerNotes) || other.giveBoardCopyToOwnerNotes == giveBoardCopyToOwnerNotes)&&(identical(other.stageNotes, stageNotes) || other.stageNotes == stageNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,receiveDocuments,receiveDocumentsDate,receiveDocumentsNotes,receiveAuthorization,receiveAuthorizationDate,receiveAuthorizationNotes,siteValidity,siteValidityDate,siteValidityNotes,executiveStatus,executiveStatusDate,executiveStatusNotes,showToOwner,showToOwnerDate,showToOwnerNotes,reviewWithAgency,reviewWithAgencyDate,reviewWithAgencyNotes,civilDefense,civilDefenseDate,civilDefenseNotes,prepareStructural,prepareStructuralDate,prepareStructuralNotes,prepareStructuralReports,prepareStructuralReportsDate,prepareStructuralReportsNotes,submitToComplex,submitToComplexDate,submitToComplexNotes,supplyToComplex,supplyToComplexDate,supplyToComplexNotes,complexSupplyAmount,doComplexNotes,doComplexNotesDate,doComplexNotesNotes,issueDocument,issueDocumentDate,issueDocumentNotes,prepareFacadeBoards,prepareFacadeBoardsDate,prepareFacadeBoardsNotes,applyOnlineForLicense,applyOnlineForLicenseDate,applyOnlineForLicenseNotes,requestNumber,requestNumberNotes,agencyReview,agencyReviewDate,agencyReviewNotes,determineFees,determineFeesDate,determineFeesNotes,payFees,payFeesDate,payFeesNotes,feesAmount,issueLicense,issueLicenseDate,issueLicenseNotes,applyForStructuralMeter,applyForStructuralMeterDate,applyForStructuralMeterNotes,giveBoardCopyToOwner,giveBoardCopyToOwnerDate,giveBoardCopyToOwnerNotes,stageNotes,createdAt,updatedAt]);

@override
String toString() {
  return 'License(id: $id, customerId: $customerId, receiveDocuments: $receiveDocuments, receiveDocumentsDate: $receiveDocumentsDate, receiveDocumentsNotes: $receiveDocumentsNotes, receiveAuthorization: $receiveAuthorization, receiveAuthorizationDate: $receiveAuthorizationDate, receiveAuthorizationNotes: $receiveAuthorizationNotes, siteValidity: $siteValidity, siteValidityDate: $siteValidityDate, siteValidityNotes: $siteValidityNotes, executiveStatus: $executiveStatus, executiveStatusDate: $executiveStatusDate, executiveStatusNotes: $executiveStatusNotes, showToOwner: $showToOwner, showToOwnerDate: $showToOwnerDate, showToOwnerNotes: $showToOwnerNotes, reviewWithAgency: $reviewWithAgency, reviewWithAgencyDate: $reviewWithAgencyDate, reviewWithAgencyNotes: $reviewWithAgencyNotes, civilDefense: $civilDefense, civilDefenseDate: $civilDefenseDate, civilDefenseNotes: $civilDefenseNotes, prepareStructural: $prepareStructural, prepareStructuralDate: $prepareStructuralDate, prepareStructuralNotes: $prepareStructuralNotes, prepareStructuralReports: $prepareStructuralReports, prepareStructuralReportsDate: $prepareStructuralReportsDate, prepareStructuralReportsNotes: $prepareStructuralReportsNotes, submitToComplex: $submitToComplex, submitToComplexDate: $submitToComplexDate, submitToComplexNotes: $submitToComplexNotes, supplyToComplex: $supplyToComplex, supplyToComplexDate: $supplyToComplexDate, supplyToComplexNotes: $supplyToComplexNotes, complexSupplyAmount: $complexSupplyAmount, doComplexNotes: $doComplexNotes, doComplexNotesDate: $doComplexNotesDate, doComplexNotesNotes: $doComplexNotesNotes, issueDocument: $issueDocument, issueDocumentDate: $issueDocumentDate, issueDocumentNotes: $issueDocumentNotes, prepareFacadeBoards: $prepareFacadeBoards, prepareFacadeBoardsDate: $prepareFacadeBoardsDate, prepareFacadeBoardsNotes: $prepareFacadeBoardsNotes, applyOnlineForLicense: $applyOnlineForLicense, applyOnlineForLicenseDate: $applyOnlineForLicenseDate, applyOnlineForLicenseNotes: $applyOnlineForLicenseNotes, requestNumber: $requestNumber, requestNumberNotes: $requestNumberNotes, agencyReview: $agencyReview, agencyReviewDate: $agencyReviewDate, agencyReviewNotes: $agencyReviewNotes, determineFees: $determineFees, determineFeesDate: $determineFeesDate, determineFeesNotes: $determineFeesNotes, payFees: $payFees, payFeesDate: $payFeesDate, payFeesNotes: $payFeesNotes, feesAmount: $feesAmount, issueLicense: $issueLicense, issueLicenseDate: $issueLicenseDate, issueLicenseNotes: $issueLicenseNotes, applyForStructuralMeter: $applyForStructuralMeter, applyForStructuralMeterDate: $applyForStructuralMeterDate, applyForStructuralMeterNotes: $applyForStructuralMeterNotes, giveBoardCopyToOwner: $giveBoardCopyToOwner, giveBoardCopyToOwnerDate: $giveBoardCopyToOwnerDate, giveBoardCopyToOwnerNotes: $giveBoardCopyToOwnerNotes, stageNotes: $stageNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LicenseCopyWith<$Res> implements $LicenseCopyWith<$Res> {
  factory _$LicenseCopyWith(_License value, $Res Function(_License) _then) = __$LicenseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'receive_documents') bool receiveDocuments,@JsonKey(name: 'receive_documents_date') DateTime? receiveDocumentsDate,@JsonKey(name: 'receive_documents_notes') String? receiveDocumentsNotes,@JsonKey(name: 'receive_authorization') bool receiveAuthorization,@JsonKey(name: 'receive_authorization_date') DateTime? receiveAuthorizationDate,@JsonKey(name: 'receive_authorization_notes') String? receiveAuthorizationNotes,@JsonKey(name: 'site_validity') bool siteValidity,@JsonKey(name: 'site_validity_date') DateTime? siteValidityDate,@JsonKey(name: 'site_validity_notes') String? siteValidityNotes,@JsonKey(name: 'executive_status') bool executiveStatus,@JsonKey(name: 'executive_status_date') DateTime? executiveStatusDate,@JsonKey(name: 'executive_status_notes') String? executiveStatusNotes,@JsonKey(name: 'show_to_owner') bool showToOwner,@JsonKey(name: 'show_to_owner_date') DateTime? showToOwnerDate,@JsonKey(name: 'show_to_owner_notes') String? showToOwnerNotes,@JsonKey(name: 'review_with_agency') bool reviewWithAgency,@JsonKey(name: 'review_with_agency_date') DateTime? reviewWithAgencyDate,@JsonKey(name: 'review_with_agency_notes') String? reviewWithAgencyNotes,@JsonKey(name: 'civil_defense') bool civilDefense,@JsonKey(name: 'civil_defense_date') DateTime? civilDefenseDate,@JsonKey(name: 'civil_defense_notes') String? civilDefenseNotes,@JsonKey(name: 'prepare_structural') bool prepareStructural,@JsonKey(name: 'prepare_structural_date') DateTime? prepareStructuralDate,@JsonKey(name: 'prepare_structural_notes') String? prepareStructuralNotes,@JsonKey(name: 'prepare_structural_reports') bool prepareStructuralReports,@JsonKey(name: 'prepare_structural_reports_date') DateTime? prepareStructuralReportsDate,@JsonKey(name: 'prepare_structural_reports_notes') String? prepareStructuralReportsNotes,@JsonKey(name: 'submit_to_complex') bool submitToComplex,@JsonKey(name: 'submit_to_complex_date') DateTime? submitToComplexDate,@JsonKey(name: 'submit_to_complex_notes') String? submitToComplexNotes,@JsonKey(name: 'supply_to_complex') bool supplyToComplex,@JsonKey(name: 'supply_to_complex_date') DateTime? supplyToComplexDate,@JsonKey(name: 'supply_to_complex_notes') String? supplyToComplexNotes,@JsonKey(name: 'complex_supply_amount') double? complexSupplyAmount,@JsonKey(name: 'do_complex_notes') bool doComplexNotes,@JsonKey(name: 'do_complex_notes_date') DateTime? doComplexNotesDate,@JsonKey(name: 'do_complex_notes_notes') String? doComplexNotesNotes,@JsonKey(name: 'issue_document') bool issueDocument,@JsonKey(name: 'issue_document_date') DateTime? issueDocumentDate,@JsonKey(name: 'issue_document_notes') String? issueDocumentNotes,@JsonKey(name: 'prepare_facade_boards') bool prepareFacadeBoards,@JsonKey(name: 'prepare_facade_boards_date') DateTime? prepareFacadeBoardsDate,@JsonKey(name: 'prepare_facade_boards_notes') String? prepareFacadeBoardsNotes,@JsonKey(name: 'apply_online_for_license') bool applyOnlineForLicense,@JsonKey(name: 'apply_online_for_license_date') DateTime? applyOnlineForLicenseDate,@JsonKey(name: 'apply_online_for_license_notes') String? applyOnlineForLicenseNotes,@JsonKey(name: 'request_number') String? requestNumber,@JsonKey(name: 'request_number_notes') String? requestNumberNotes,@JsonKey(name: 'agency_review') bool agencyReview,@JsonKey(name: 'agency_review_date') DateTime? agencyReviewDate,@JsonKey(name: 'agency_review_notes') String? agencyReviewNotes,@JsonKey(name: 'determine_fees') bool determineFees,@JsonKey(name: 'determine_fees_date') DateTime? determineFeesDate,@JsonKey(name: 'determine_fees_notes') String? determineFeesNotes,@JsonKey(name: 'pay_fees') bool payFees,@JsonKey(name: 'pay_fees_date') DateTime? payFeesDate,@JsonKey(name: 'pay_fees_notes') String? payFeesNotes,@JsonKey(name: 'fees_amount') double? feesAmount,@JsonKey(name: 'issue_license') bool issueLicense,@JsonKey(name: 'issue_license_date') DateTime? issueLicenseDate,@JsonKey(name: 'issue_license_notes') String? issueLicenseNotes,@JsonKey(name: 'apply_for_structural_meter') bool applyForStructuralMeter,@JsonKey(name: 'apply_for_structural_meter_date') DateTime? applyForStructuralMeterDate,@JsonKey(name: 'apply_for_structural_meter_notes') String? applyForStructuralMeterNotes,@JsonKey(name: 'give_board_copy_to_owner') bool giveBoardCopyToOwner,@JsonKey(name: 'give_board_copy_to_owner_date') DateTime? giveBoardCopyToOwnerDate,@JsonKey(name: 'give_board_copy_to_owner_notes') String? giveBoardCopyToOwnerNotes,@JsonKey(name: 'stage_notes') String? stageNotes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$LicenseCopyWithImpl<$Res>
    implements _$LicenseCopyWith<$Res> {
  __$LicenseCopyWithImpl(this._self, this._then);

  final _License _self;
  final $Res Function(_License) _then;

/// Create a copy of License
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? receiveDocuments = null,Object? receiveDocumentsDate = freezed,Object? receiveDocumentsNotes = freezed,Object? receiveAuthorization = null,Object? receiveAuthorizationDate = freezed,Object? receiveAuthorizationNotes = freezed,Object? siteValidity = null,Object? siteValidityDate = freezed,Object? siteValidityNotes = freezed,Object? executiveStatus = null,Object? executiveStatusDate = freezed,Object? executiveStatusNotes = freezed,Object? showToOwner = null,Object? showToOwnerDate = freezed,Object? showToOwnerNotes = freezed,Object? reviewWithAgency = null,Object? reviewWithAgencyDate = freezed,Object? reviewWithAgencyNotes = freezed,Object? civilDefense = null,Object? civilDefenseDate = freezed,Object? civilDefenseNotes = freezed,Object? prepareStructural = null,Object? prepareStructuralDate = freezed,Object? prepareStructuralNotes = freezed,Object? prepareStructuralReports = null,Object? prepareStructuralReportsDate = freezed,Object? prepareStructuralReportsNotes = freezed,Object? submitToComplex = null,Object? submitToComplexDate = freezed,Object? submitToComplexNotes = freezed,Object? supplyToComplex = null,Object? supplyToComplexDate = freezed,Object? supplyToComplexNotes = freezed,Object? complexSupplyAmount = freezed,Object? doComplexNotes = null,Object? doComplexNotesDate = freezed,Object? doComplexNotesNotes = freezed,Object? issueDocument = null,Object? issueDocumentDate = freezed,Object? issueDocumentNotes = freezed,Object? prepareFacadeBoards = null,Object? prepareFacadeBoardsDate = freezed,Object? prepareFacadeBoardsNotes = freezed,Object? applyOnlineForLicense = null,Object? applyOnlineForLicenseDate = freezed,Object? applyOnlineForLicenseNotes = freezed,Object? requestNumber = freezed,Object? requestNumberNotes = freezed,Object? agencyReview = null,Object? agencyReviewDate = freezed,Object? agencyReviewNotes = freezed,Object? determineFees = null,Object? determineFeesDate = freezed,Object? determineFeesNotes = freezed,Object? payFees = null,Object? payFeesDate = freezed,Object? payFeesNotes = freezed,Object? feesAmount = freezed,Object? issueLicense = null,Object? issueLicenseDate = freezed,Object? issueLicenseNotes = freezed,Object? applyForStructuralMeter = null,Object? applyForStructuralMeterDate = freezed,Object? applyForStructuralMeterNotes = freezed,Object? giveBoardCopyToOwner = null,Object? giveBoardCopyToOwnerDate = freezed,Object? giveBoardCopyToOwnerNotes = freezed,Object? stageNotes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_License(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,receiveDocuments: null == receiveDocuments ? _self.receiveDocuments : receiveDocuments // ignore: cast_nullable_to_non_nullable
as bool,receiveDocumentsDate: freezed == receiveDocumentsDate ? _self.receiveDocumentsDate : receiveDocumentsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveDocumentsNotes: freezed == receiveDocumentsNotes ? _self.receiveDocumentsNotes : receiveDocumentsNotes // ignore: cast_nullable_to_non_nullable
as String?,receiveAuthorization: null == receiveAuthorization ? _self.receiveAuthorization : receiveAuthorization // ignore: cast_nullable_to_non_nullable
as bool,receiveAuthorizationDate: freezed == receiveAuthorizationDate ? _self.receiveAuthorizationDate : receiveAuthorizationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,receiveAuthorizationNotes: freezed == receiveAuthorizationNotes ? _self.receiveAuthorizationNotes : receiveAuthorizationNotes // ignore: cast_nullable_to_non_nullable
as String?,siteValidity: null == siteValidity ? _self.siteValidity : siteValidity // ignore: cast_nullable_to_non_nullable
as bool,siteValidityDate: freezed == siteValidityDate ? _self.siteValidityDate : siteValidityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,siteValidityNotes: freezed == siteValidityNotes ? _self.siteValidityNotes : siteValidityNotes // ignore: cast_nullable_to_non_nullable
as String?,executiveStatus: null == executiveStatus ? _self.executiveStatus : executiveStatus // ignore: cast_nullable_to_non_nullable
as bool,executiveStatusDate: freezed == executiveStatusDate ? _self.executiveStatusDate : executiveStatusDate // ignore: cast_nullable_to_non_nullable
as DateTime?,executiveStatusNotes: freezed == executiveStatusNotes ? _self.executiveStatusNotes : executiveStatusNotes // ignore: cast_nullable_to_non_nullable
as String?,showToOwner: null == showToOwner ? _self.showToOwner : showToOwner // ignore: cast_nullable_to_non_nullable
as bool,showToOwnerDate: freezed == showToOwnerDate ? _self.showToOwnerDate : showToOwnerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,showToOwnerNotes: freezed == showToOwnerNotes ? _self.showToOwnerNotes : showToOwnerNotes // ignore: cast_nullable_to_non_nullable
as String?,reviewWithAgency: null == reviewWithAgency ? _self.reviewWithAgency : reviewWithAgency // ignore: cast_nullable_to_non_nullable
as bool,reviewWithAgencyDate: freezed == reviewWithAgencyDate ? _self.reviewWithAgencyDate : reviewWithAgencyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewWithAgencyNotes: freezed == reviewWithAgencyNotes ? _self.reviewWithAgencyNotes : reviewWithAgencyNotes // ignore: cast_nullable_to_non_nullable
as String?,civilDefense: null == civilDefense ? _self.civilDefense : civilDefense // ignore: cast_nullable_to_non_nullable
as bool,civilDefenseDate: freezed == civilDefenseDate ? _self.civilDefenseDate : civilDefenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,civilDefenseNotes: freezed == civilDefenseNotes ? _self.civilDefenseNotes : civilDefenseNotes // ignore: cast_nullable_to_non_nullable
as String?,prepareStructural: null == prepareStructural ? _self.prepareStructural : prepareStructural // ignore: cast_nullable_to_non_nullable
as bool,prepareStructuralDate: freezed == prepareStructuralDate ? _self.prepareStructuralDate : prepareStructuralDate // ignore: cast_nullable_to_non_nullable
as DateTime?,prepareStructuralNotes: freezed == prepareStructuralNotes ? _self.prepareStructuralNotes : prepareStructuralNotes // ignore: cast_nullable_to_non_nullable
as String?,prepareStructuralReports: null == prepareStructuralReports ? _self.prepareStructuralReports : prepareStructuralReports // ignore: cast_nullable_to_non_nullable
as bool,prepareStructuralReportsDate: freezed == prepareStructuralReportsDate ? _self.prepareStructuralReportsDate : prepareStructuralReportsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,prepareStructuralReportsNotes: freezed == prepareStructuralReportsNotes ? _self.prepareStructuralReportsNotes : prepareStructuralReportsNotes // ignore: cast_nullable_to_non_nullable
as String?,submitToComplex: null == submitToComplex ? _self.submitToComplex : submitToComplex // ignore: cast_nullable_to_non_nullable
as bool,submitToComplexDate: freezed == submitToComplexDate ? _self.submitToComplexDate : submitToComplexDate // ignore: cast_nullable_to_non_nullable
as DateTime?,submitToComplexNotes: freezed == submitToComplexNotes ? _self.submitToComplexNotes : submitToComplexNotes // ignore: cast_nullable_to_non_nullable
as String?,supplyToComplex: null == supplyToComplex ? _self.supplyToComplex : supplyToComplex // ignore: cast_nullable_to_non_nullable
as bool,supplyToComplexDate: freezed == supplyToComplexDate ? _self.supplyToComplexDate : supplyToComplexDate // ignore: cast_nullable_to_non_nullable
as DateTime?,supplyToComplexNotes: freezed == supplyToComplexNotes ? _self.supplyToComplexNotes : supplyToComplexNotes // ignore: cast_nullable_to_non_nullable
as String?,complexSupplyAmount: freezed == complexSupplyAmount ? _self.complexSupplyAmount : complexSupplyAmount // ignore: cast_nullable_to_non_nullable
as double?,doComplexNotes: null == doComplexNotes ? _self.doComplexNotes : doComplexNotes // ignore: cast_nullable_to_non_nullable
as bool,doComplexNotesDate: freezed == doComplexNotesDate ? _self.doComplexNotesDate : doComplexNotesDate // ignore: cast_nullable_to_non_nullable
as DateTime?,doComplexNotesNotes: freezed == doComplexNotesNotes ? _self.doComplexNotesNotes : doComplexNotesNotes // ignore: cast_nullable_to_non_nullable
as String?,issueDocument: null == issueDocument ? _self.issueDocument : issueDocument // ignore: cast_nullable_to_non_nullable
as bool,issueDocumentDate: freezed == issueDocumentDate ? _self.issueDocumentDate : issueDocumentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,issueDocumentNotes: freezed == issueDocumentNotes ? _self.issueDocumentNotes : issueDocumentNotes // ignore: cast_nullable_to_non_nullable
as String?,prepareFacadeBoards: null == prepareFacadeBoards ? _self.prepareFacadeBoards : prepareFacadeBoards // ignore: cast_nullable_to_non_nullable
as bool,prepareFacadeBoardsDate: freezed == prepareFacadeBoardsDate ? _self.prepareFacadeBoardsDate : prepareFacadeBoardsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,prepareFacadeBoardsNotes: freezed == prepareFacadeBoardsNotes ? _self.prepareFacadeBoardsNotes : prepareFacadeBoardsNotes // ignore: cast_nullable_to_non_nullable
as String?,applyOnlineForLicense: null == applyOnlineForLicense ? _self.applyOnlineForLicense : applyOnlineForLicense // ignore: cast_nullable_to_non_nullable
as bool,applyOnlineForLicenseDate: freezed == applyOnlineForLicenseDate ? _self.applyOnlineForLicenseDate : applyOnlineForLicenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applyOnlineForLicenseNotes: freezed == applyOnlineForLicenseNotes ? _self.applyOnlineForLicenseNotes : applyOnlineForLicenseNotes // ignore: cast_nullable_to_non_nullable
as String?,requestNumber: freezed == requestNumber ? _self.requestNumber : requestNumber // ignore: cast_nullable_to_non_nullable
as String?,requestNumberNotes: freezed == requestNumberNotes ? _self.requestNumberNotes : requestNumberNotes // ignore: cast_nullable_to_non_nullable
as String?,agencyReview: null == agencyReview ? _self.agencyReview : agencyReview // ignore: cast_nullable_to_non_nullable
as bool,agencyReviewDate: freezed == agencyReviewDate ? _self.agencyReviewDate : agencyReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime?,agencyReviewNotes: freezed == agencyReviewNotes ? _self.agencyReviewNotes : agencyReviewNotes // ignore: cast_nullable_to_non_nullable
as String?,determineFees: null == determineFees ? _self.determineFees : determineFees // ignore: cast_nullable_to_non_nullable
as bool,determineFeesDate: freezed == determineFeesDate ? _self.determineFeesDate : determineFeesDate // ignore: cast_nullable_to_non_nullable
as DateTime?,determineFeesNotes: freezed == determineFeesNotes ? _self.determineFeesNotes : determineFeesNotes // ignore: cast_nullable_to_non_nullable
as String?,payFees: null == payFees ? _self.payFees : payFees // ignore: cast_nullable_to_non_nullable
as bool,payFeesDate: freezed == payFeesDate ? _self.payFeesDate : payFeesDate // ignore: cast_nullable_to_non_nullable
as DateTime?,payFeesNotes: freezed == payFeesNotes ? _self.payFeesNotes : payFeesNotes // ignore: cast_nullable_to_non_nullable
as String?,feesAmount: freezed == feesAmount ? _self.feesAmount : feesAmount // ignore: cast_nullable_to_non_nullable
as double?,issueLicense: null == issueLicense ? _self.issueLicense : issueLicense // ignore: cast_nullable_to_non_nullable
as bool,issueLicenseDate: freezed == issueLicenseDate ? _self.issueLicenseDate : issueLicenseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,issueLicenseNotes: freezed == issueLicenseNotes ? _self.issueLicenseNotes : issueLicenseNotes // ignore: cast_nullable_to_non_nullable
as String?,applyForStructuralMeter: null == applyForStructuralMeter ? _self.applyForStructuralMeter : applyForStructuralMeter // ignore: cast_nullable_to_non_nullable
as bool,applyForStructuralMeterDate: freezed == applyForStructuralMeterDate ? _self.applyForStructuralMeterDate : applyForStructuralMeterDate // ignore: cast_nullable_to_non_nullable
as DateTime?,applyForStructuralMeterNotes: freezed == applyForStructuralMeterNotes ? _self.applyForStructuralMeterNotes : applyForStructuralMeterNotes // ignore: cast_nullable_to_non_nullable
as String?,giveBoardCopyToOwner: null == giveBoardCopyToOwner ? _self.giveBoardCopyToOwner : giveBoardCopyToOwner // ignore: cast_nullable_to_non_nullable
as bool,giveBoardCopyToOwnerDate: freezed == giveBoardCopyToOwnerDate ? _self.giveBoardCopyToOwnerDate : giveBoardCopyToOwnerDate // ignore: cast_nullable_to_non_nullable
as DateTime?,giveBoardCopyToOwnerNotes: freezed == giveBoardCopyToOwnerNotes ? _self.giveBoardCopyToOwnerNotes : giveBoardCopyToOwnerNotes // ignore: cast_nullable_to_non_nullable
as String?,stageNotes: freezed == stageNotes ? _self.stageNotes : stageNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
