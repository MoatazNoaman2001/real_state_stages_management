// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_License _$LicenseFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_License',
  json,
  ($checkedConvert) {
    final val = _License(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      customerId: $checkedConvert('customer_id', (v) => (v as num).toInt()),
      receiveDocuments: $checkedConvert(
        'receive_documents',
        (v) => v as bool? ?? false,
      ),
      receiveDocumentsDate: $checkedConvert(
        'receive_documents_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      receiveDocumentsNotes: $checkedConvert(
        'receive_documents_notes',
        (v) => v as String?,
      ),
      receiveAuthorization: $checkedConvert(
        'receive_authorization',
        (v) => v as bool? ?? false,
      ),
      receiveAuthorizationDate: $checkedConvert(
        'receive_authorization_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      receiveAuthorizationNotes: $checkedConvert(
        'receive_authorization_notes',
        (v) => v as String?,
      ),
      siteValidity: $checkedConvert(
        'site_validity',
        (v) => v as bool? ?? false,
      ),
      siteValidityDate: $checkedConvert(
        'site_validity_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      siteValidityNotes: $checkedConvert(
        'site_validity_notes',
        (v) => v as String?,
      ),
      executiveStatus: $checkedConvert(
        'executive_status',
        (v) => v as bool? ?? false,
      ),
      executiveStatusDate: $checkedConvert(
        'executive_status_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      executiveStatusNotes: $checkedConvert(
        'executive_status_notes',
        (v) => v as String?,
      ),
      showToOwner: $checkedConvert('show_to_owner', (v) => v as bool? ?? false),
      showToOwnerDate: $checkedConvert(
        'show_to_owner_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      showToOwnerNotes: $checkedConvert(
        'show_to_owner_notes',
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
      civilDefense: $checkedConvert(
        'civil_defense',
        (v) => v as bool? ?? false,
      ),
      civilDefenseDate: $checkedConvert(
        'civil_defense_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      civilDefenseNotes: $checkedConvert(
        'civil_defense_notes',
        (v) => v as String?,
      ),
      prepareStructural: $checkedConvert(
        'prepare_structural',
        (v) => v as bool? ?? false,
      ),
      prepareStructuralDate: $checkedConvert(
        'prepare_structural_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      prepareStructuralNotes: $checkedConvert(
        'prepare_structural_notes',
        (v) => v as String?,
      ),
      prepareStructuralReports: $checkedConvert(
        'prepare_structural_reports',
        (v) => v as bool? ?? false,
      ),
      prepareStructuralReportsDate: $checkedConvert(
        'prepare_structural_reports_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      prepareStructuralReportsNotes: $checkedConvert(
        'prepare_structural_reports_notes',
        (v) => v as String?,
      ),
      submitToComplex: $checkedConvert(
        'submit_to_complex',
        (v) => v as bool? ?? false,
      ),
      submitToComplexDate: $checkedConvert(
        'submit_to_complex_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      submitToComplexNotes: $checkedConvert(
        'submit_to_complex_notes',
        (v) => v as String?,
      ),
      supplyToComplex: $checkedConvert(
        'supply_to_complex',
        (v) => v as bool? ?? false,
      ),
      supplyToComplexDate: $checkedConvert(
        'supply_to_complex_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      supplyToComplexNotes: $checkedConvert(
        'supply_to_complex_notes',
        (v) => v as String?,
      ),
      complexSupplyAmount: $checkedConvert(
        'complex_supply_amount',
        (v) => (v as num?)?.toDouble(),
      ),
      doComplexNotes: $checkedConvert(
        'do_complex_notes',
        (v) => v as bool? ?? false,
      ),
      doComplexNotesDate: $checkedConvert(
        'do_complex_notes_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      doComplexNotesNotes: $checkedConvert(
        'do_complex_notes_notes',
        (v) => v as String?,
      ),
      issueDocument: $checkedConvert(
        'issue_document',
        (v) => v as bool? ?? false,
      ),
      issueDocumentDate: $checkedConvert(
        'issue_document_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      issueDocumentNotes: $checkedConvert(
        'issue_document_notes',
        (v) => v as String?,
      ),
      prepareFacadeBoards: $checkedConvert(
        'prepare_facade_boards',
        (v) => v as bool? ?? false,
      ),
      prepareFacadeBoardsDate: $checkedConvert(
        'prepare_facade_boards_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      prepareFacadeBoardsNotes: $checkedConvert(
        'prepare_facade_boards_notes',
        (v) => v as String?,
      ),
      applyOnlineForLicense: $checkedConvert(
        'apply_online_for_license',
        (v) => v as bool? ?? false,
      ),
      applyOnlineForLicenseDate: $checkedConvert(
        'apply_online_for_license_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      applyOnlineForLicenseNotes: $checkedConvert(
        'apply_online_for_license_notes',
        (v) => v as String?,
      ),
      requestNumber: $checkedConvert('request_number', (v) => v as String?),
      requestNumberNotes: $checkedConvert(
        'request_number_notes',
        (v) => v as String?,
      ),
      agencyReview: $checkedConvert(
        'agency_review',
        (v) => v as bool? ?? false,
      ),
      agencyReviewDate: $checkedConvert(
        'agency_review_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      agencyReviewNotes: $checkedConvert(
        'agency_review_notes',
        (v) => v as String?,
      ),
      determineFees: $checkedConvert(
        'determine_fees',
        (v) => v as bool? ?? false,
      ),
      determineFeesDate: $checkedConvert(
        'determine_fees_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      determineFeesNotes: $checkedConvert(
        'determine_fees_notes',
        (v) => v as String?,
      ),
      payFees: $checkedConvert('pay_fees', (v) => v as bool? ?? false),
      payFeesDate: $checkedConvert(
        'pay_fees_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      payFeesNotes: $checkedConvert('pay_fees_notes', (v) => v as String?),
      feesAmount: $checkedConvert(
        'fees_amount',
        (v) => (v as num?)?.toDouble(),
      ),
      issueLicense: $checkedConvert(
        'issue_license',
        (v) => v as bool? ?? false,
      ),
      issueLicenseDate: $checkedConvert(
        'issue_license_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      issueLicenseNotes: $checkedConvert(
        'issue_license_notes',
        (v) => v as String?,
      ),
      applyForStructuralMeter: $checkedConvert(
        'apply_for_structural_meter',
        (v) => v as bool? ?? false,
      ),
      applyForStructuralMeterDate: $checkedConvert(
        'apply_for_structural_meter_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      applyForStructuralMeterNotes: $checkedConvert(
        'apply_for_structural_meter_notes',
        (v) => v as String?,
      ),
      giveBoardCopyToOwner: $checkedConvert(
        'give_board_copy_to_owner',
        (v) => v as bool? ?? false,
      ),
      giveBoardCopyToOwnerDate: $checkedConvert(
        'give_board_copy_to_owner_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      giveBoardCopyToOwnerNotes: $checkedConvert(
        'give_board_copy_to_owner_notes',
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
    'receiveDocuments': 'receive_documents',
    'receiveDocumentsDate': 'receive_documents_date',
    'receiveDocumentsNotes': 'receive_documents_notes',
    'receiveAuthorization': 'receive_authorization',
    'receiveAuthorizationDate': 'receive_authorization_date',
    'receiveAuthorizationNotes': 'receive_authorization_notes',
    'siteValidity': 'site_validity',
    'siteValidityDate': 'site_validity_date',
    'siteValidityNotes': 'site_validity_notes',
    'executiveStatus': 'executive_status',
    'executiveStatusDate': 'executive_status_date',
    'executiveStatusNotes': 'executive_status_notes',
    'showToOwner': 'show_to_owner',
    'showToOwnerDate': 'show_to_owner_date',
    'showToOwnerNotes': 'show_to_owner_notes',
    'reviewWithAgency': 'review_with_agency',
    'reviewWithAgencyDate': 'review_with_agency_date',
    'reviewWithAgencyNotes': 'review_with_agency_notes',
    'civilDefense': 'civil_defense',
    'civilDefenseDate': 'civil_defense_date',
    'civilDefenseNotes': 'civil_defense_notes',
    'prepareStructural': 'prepare_structural',
    'prepareStructuralDate': 'prepare_structural_date',
    'prepareStructuralNotes': 'prepare_structural_notes',
    'prepareStructuralReports': 'prepare_structural_reports',
    'prepareStructuralReportsDate': 'prepare_structural_reports_date',
    'prepareStructuralReportsNotes': 'prepare_structural_reports_notes',
    'submitToComplex': 'submit_to_complex',
    'submitToComplexDate': 'submit_to_complex_date',
    'submitToComplexNotes': 'submit_to_complex_notes',
    'supplyToComplex': 'supply_to_complex',
    'supplyToComplexDate': 'supply_to_complex_date',
    'supplyToComplexNotes': 'supply_to_complex_notes',
    'complexSupplyAmount': 'complex_supply_amount',
    'doComplexNotes': 'do_complex_notes',
    'doComplexNotesDate': 'do_complex_notes_date',
    'doComplexNotesNotes': 'do_complex_notes_notes',
    'issueDocument': 'issue_document',
    'issueDocumentDate': 'issue_document_date',
    'issueDocumentNotes': 'issue_document_notes',
    'prepareFacadeBoards': 'prepare_facade_boards',
    'prepareFacadeBoardsDate': 'prepare_facade_boards_date',
    'prepareFacadeBoardsNotes': 'prepare_facade_boards_notes',
    'applyOnlineForLicense': 'apply_online_for_license',
    'applyOnlineForLicenseDate': 'apply_online_for_license_date',
    'applyOnlineForLicenseNotes': 'apply_online_for_license_notes',
    'requestNumber': 'request_number',
    'requestNumberNotes': 'request_number_notes',
    'agencyReview': 'agency_review',
    'agencyReviewDate': 'agency_review_date',
    'agencyReviewNotes': 'agency_review_notes',
    'determineFees': 'determine_fees',
    'determineFeesDate': 'determine_fees_date',
    'determineFeesNotes': 'determine_fees_notes',
    'payFees': 'pay_fees',
    'payFeesDate': 'pay_fees_date',
    'payFeesNotes': 'pay_fees_notes',
    'feesAmount': 'fees_amount',
    'issueLicense': 'issue_license',
    'issueLicenseDate': 'issue_license_date',
    'issueLicenseNotes': 'issue_license_notes',
    'applyForStructuralMeter': 'apply_for_structural_meter',
    'applyForStructuralMeterDate': 'apply_for_structural_meter_date',
    'applyForStructuralMeterNotes': 'apply_for_structural_meter_notes',
    'giveBoardCopyToOwner': 'give_board_copy_to_owner',
    'giveBoardCopyToOwnerDate': 'give_board_copy_to_owner_date',
    'giveBoardCopyToOwnerNotes': 'give_board_copy_to_owner_notes',
    'stageNotes': 'stage_notes',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$LicenseToJson(_License instance) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'receive_documents': instance.receiveDocuments,
  'receive_documents_date': ?instance.receiveDocumentsDate?.toIso8601String(),
  'receive_documents_notes': ?instance.receiveDocumentsNotes,
  'receive_authorization': instance.receiveAuthorization,
  'receive_authorization_date': ?instance.receiveAuthorizationDate
      ?.toIso8601String(),
  'receive_authorization_notes': ?instance.receiveAuthorizationNotes,
  'site_validity': instance.siteValidity,
  'site_validity_date': ?instance.siteValidityDate?.toIso8601String(),
  'site_validity_notes': ?instance.siteValidityNotes,
  'executive_status': instance.executiveStatus,
  'executive_status_date': ?instance.executiveStatusDate?.toIso8601String(),
  'executive_status_notes': ?instance.executiveStatusNotes,
  'show_to_owner': instance.showToOwner,
  'show_to_owner_date': ?instance.showToOwnerDate?.toIso8601String(),
  'show_to_owner_notes': ?instance.showToOwnerNotes,
  'review_with_agency': instance.reviewWithAgency,
  'review_with_agency_date': ?instance.reviewWithAgencyDate?.toIso8601String(),
  'review_with_agency_notes': ?instance.reviewWithAgencyNotes,
  'civil_defense': instance.civilDefense,
  'civil_defense_date': ?instance.civilDefenseDate?.toIso8601String(),
  'civil_defense_notes': ?instance.civilDefenseNotes,
  'prepare_structural': instance.prepareStructural,
  'prepare_structural_date': ?instance.prepareStructuralDate?.toIso8601String(),
  'prepare_structural_notes': ?instance.prepareStructuralNotes,
  'prepare_structural_reports': instance.prepareStructuralReports,
  'prepare_structural_reports_date': ?instance.prepareStructuralReportsDate
      ?.toIso8601String(),
  'prepare_structural_reports_notes': ?instance.prepareStructuralReportsNotes,
  'submit_to_complex': instance.submitToComplex,
  'submit_to_complex_date': ?instance.submitToComplexDate?.toIso8601String(),
  'submit_to_complex_notes': ?instance.submitToComplexNotes,
  'supply_to_complex': instance.supplyToComplex,
  'supply_to_complex_date': ?instance.supplyToComplexDate?.toIso8601String(),
  'supply_to_complex_notes': ?instance.supplyToComplexNotes,
  'complex_supply_amount': ?instance.complexSupplyAmount,
  'do_complex_notes': instance.doComplexNotes,
  'do_complex_notes_date': ?instance.doComplexNotesDate?.toIso8601String(),
  'do_complex_notes_notes': ?instance.doComplexNotesNotes,
  'issue_document': instance.issueDocument,
  'issue_document_date': ?instance.issueDocumentDate?.toIso8601String(),
  'issue_document_notes': ?instance.issueDocumentNotes,
  'prepare_facade_boards': instance.prepareFacadeBoards,
  'prepare_facade_boards_date': ?instance.prepareFacadeBoardsDate
      ?.toIso8601String(),
  'prepare_facade_boards_notes': ?instance.prepareFacadeBoardsNotes,
  'apply_online_for_license': instance.applyOnlineForLicense,
  'apply_online_for_license_date': ?instance.applyOnlineForLicenseDate
      ?.toIso8601String(),
  'apply_online_for_license_notes': ?instance.applyOnlineForLicenseNotes,
  'request_number': ?instance.requestNumber,
  'request_number_notes': ?instance.requestNumberNotes,
  'agency_review': instance.agencyReview,
  'agency_review_date': ?instance.agencyReviewDate?.toIso8601String(),
  'agency_review_notes': ?instance.agencyReviewNotes,
  'determine_fees': instance.determineFees,
  'determine_fees_date': ?instance.determineFeesDate?.toIso8601String(),
  'determine_fees_notes': ?instance.determineFeesNotes,
  'pay_fees': instance.payFees,
  'pay_fees_date': ?instance.payFeesDate?.toIso8601String(),
  'pay_fees_notes': ?instance.payFeesNotes,
  'fees_amount': ?instance.feesAmount,
  'issue_license': instance.issueLicense,
  'issue_license_date': ?instance.issueLicenseDate?.toIso8601String(),
  'issue_license_notes': ?instance.issueLicenseNotes,
  'apply_for_structural_meter': instance.applyForStructuralMeter,
  'apply_for_structural_meter_date': ?instance.applyForStructuralMeterDate
      ?.toIso8601String(),
  'apply_for_structural_meter_notes': ?instance.applyForStructuralMeterNotes,
  'give_board_copy_to_owner': instance.giveBoardCopyToOwner,
  'give_board_copy_to_owner_date': ?instance.giveBoardCopyToOwnerDate
      ?.toIso8601String(),
  'give_board_copy_to_owner_notes': ?instance.giveBoardCopyToOwnerNotes,
  'stage_notes': ?instance.stageNotes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
