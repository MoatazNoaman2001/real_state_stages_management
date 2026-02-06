import '../../core/exceptions/app_exceptions.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/excavation_permit_repository.dart';
import '../../data/repositories/license_repository.dart';
import '../../data/repositories/stage_history_repository.dart';
import '../models/excavation_permit.dart';

class ExcavationPermitService {
  final ExcavationPermitRepository _permitRepo;
  final CustomerRepository _customerRepo;
  final LicenseRepository _licenseRepo;
  final StageHistoryRepository _historyRepo;

  ExcavationPermitService(
    this._permitRepo,
    this._customerRepo,
    this._licenseRepo,
    this._historyRepo,
  );

  /// Get permit for customer
  Future<ExcavationPermit?> getPermitForCustomer(int customerId) async {
    return await _permitRepo.findByCustomerId(customerId);
  }

  /// Create permit for customer
  Future<int> createPermit(ExcavationPermit permit) async {
    // Check customer exists
    final customer = await _customerRepo.findById(permit.customerId);
    if (customer == null) {
      throw NotFoundException('العميل غير موجود');
    }

    // Check customer has a completed license first
    final license = await _licenseRepo.findByCustomerId(permit.customerId);
    if (license == null) {
      throw BusinessRuleException('يجب إصدار الترخيص أولاً قبل تصريح الحفر');
    }

    // Check customer doesn't already have a permit
    final existing = await _permitRepo.findByCustomerId(permit.customerId);
    if (existing != null) {
      throw DuplicateException('العميل لديه تصريح حفر بالفعل');
    }

    // Create permit
    final permitId = await _permitRepo.insert(permit);

    // Update customer stage
    final updatedCustomer = customer.copyWith(currentStage: 'تصريح الحفر');
    await _customerRepo.update(customer.id, updatedCustomer);

    // Log to stage history
    await _historyRepo.startStage(
      customerId: permit.customerId,
      stageName: 'تصريح الحفر',
    );

    return permitId;
  }

  /// Update a specific step
  Future<bool> updateStep({
    required int permitId,
    required String stepName,
    required bool completed,
  }) async {
    final permit = await _permitRepo.findById(permitId);
    if (permit == null) {
      throw NotFoundException('تصريح الحفر غير موجود');
    }

    final success = await _permitRepo.updateStep(
      permitId: permitId,
      stepName: stepName,
      value: completed,
    );

    // Log to history if completed
    if (success && completed) {
      await _historyRepo.startStage(
        customerId: permit.customerId,
        stageName: 'excavation_$stepName',
      );
    }

    return success;
  }

  /// Get progress for customer
  Future<double> getProgress(int customerId) async {
    final permit = await _permitRepo.findByCustomerId(customerId);
    if (permit == null) return 0.0;
    return permit.progress;
  }

  /// Get completed steps
  Future<List<String>> getCompletedSteps(int customerId) async {
    final permit = await _permitRepo.findByCustomerId(customerId);
    if (permit == null) return [];
    return await _permitRepo.getCompletedSteps(permit.id);
  }

  /// Get next step
  Future<String?> getNextStep(int customerId) async {
    final permit = await _permitRepo.findByCustomerId(customerId);
    if (permit == null) return null;

    final pending = await _permitRepo.getPendingSteps(permit.id);
    return pending.isNotEmpty ? pending.first : null;
  }

  /// Check if complete
  Future<bool> isComplete(int customerId) async {
    final permit = await _permitRepo.findByCustomerId(customerId);
    if (permit == null) return false;
    return permit.isComplete;
  }

  /// Get step display name
  String getStepDisplayName(String stepName) {
    const stepNames = {
      'supervision_certificate': 'شهادة الإشراف',
      'contract_agreement': 'الاتفاق على العقد',
      'approve_contract_from_union': 'اعتماد العقد من النقابة',
      'supply_to_union': 'التوريد للنقابة',
      'issue_excavation_permit': 'إصدار تصريح الحفر',
      'army_permit': 'تصريح الجيش',
      'equipment_permit': 'تصريح المعدات',
    };
    return stepNames[stepName] ?? stepName;
  }
}
