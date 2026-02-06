import '../../core/exceptions/app_exceptions.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/license_repository.dart';
import '../../data/repositories/stage_history_repository.dart';
import '../models/license.dart';

class LicenseService {
  final LicenseRepository _licenseRepo;
  final CustomerRepository _customerRepo;
  final StageHistoryRepository _historyRepo;

  LicenseService(this._licenseRepo, this._customerRepo, this._historyRepo);

  /// Get all step names
  List<String> get stepNames => LicenseRepository.stepNames;

  /// Get license for customer
  Future<License?> getLicenseForCustomer(int customerId) async {
    return await _licenseRepo.findByCustomerId(customerId);
  }

  /// Get license by ID
  Future<License?> getLicenseById(int licenseId) async {
    return await _licenseRepo.findById(licenseId);
  }

  /// Create license for customer
  Future<int> createLicense(License license) async {
    // Check customer exists
    final customer = await _customerRepo.findById(license.customerId);
    if (customer == null) {
      throw NotFoundException('العميل غير موجود');
    }

    // Check customer doesn't already have a license
    final existing = await _licenseRepo.findByCustomerId(license.customerId);
    if (existing != null) {
      throw DuplicateException('العميل لديه ترخيص بالفعل');
    }

    // Create license
    final licenseId = await _licenseRepo.insert(license);

    // Update customer stage
    final updatedCustomer = customer.copyWith(currentStage: 'التراخيص');
    await _customerRepo.update(customer.id, updatedCustomer);

    // Log to stage history
    await _historyRepo.startStage(
      customerId: license.customerId,
      stageName: 'التراخيص',
    );

    return licenseId;
  }

  /// Update a specific step
  Future<bool> updateStep({
    required int licenseId,
    required String stepName,
    required bool completed,
  }) async {
    // Validate step name
    if (!LicenseRepository.stepNames.contains(stepName)) {
      throw ValidationException('اسم الخطوة غير صالح: $stepName');
    }

    // Handle request_number differently
    if (stepName == 'request_number') {
      throw ValidationException('استخدم updateRequestNumber لتحديث رقم الطلب');
    }

    // Get license
    final license = await _licenseRepo.findById(licenseId);
    if (license == null) {
      throw NotFoundException('الترخيص غير موجود');
    }

    // Update step
    final success = await _licenseRepo.updateStep(
      licenseId: licenseId,
      stepName: stepName,
      value: completed,
    );

    // Log to history if completed
    if (success && completed) {
      await _historyRepo.startStage(
        customerId: license.customerId,
        stageName: 'license_$stepName',
      );
    }

    return success;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int licenseId,
    required String stepName,
    required String? notes,
  }) async {
    // Validate step name
    if (!LicenseRepository.stepNames.contains(stepName)) {
      throw ValidationException('اسم الخطوة غير صالح: $stepName');
    }

    final license = await _licenseRepo.findById(licenseId);
    if (license == null) {
      throw NotFoundException('الترخيص غير موجود');
    }

    return await _licenseRepo.updateStepNotes(
      licenseId: licenseId,
      stepName: stepName,
      notes: notes,
    );
  }

  /// Update request number (step 16)
  Future<bool> updateRequestNumber({
    required int licenseId,
    required String? requestNumber,
  }) async {
    final license = await _licenseRepo.findById(licenseId);
    if (license == null) {
      throw NotFoundException('الترخيص غير موجود');
    }

    final success = await _licenseRepo.updateRequestNumber(
      licenseId: licenseId,
      requestNumber: requestNumber,
    );

    // Log to history if set
    if (success && requestNumber != null && requestNumber.isNotEmpty) {
      await _historyRepo.startStage(
        customerId: license.customerId,
        stageName: 'license_request_number',
      );
    }

    return success;
  }

  /// Get progress for customer
  Future<double> getProgress(int customerId) async {
    final license = await _licenseRepo.findByCustomerId(customerId);
    if (license == null) return 0.0;
    return license.progress;
  }

  /// Get completed steps
  Future<List<String>> getCompletedSteps(int customerId) async {
    final license = await _licenseRepo.findByCustomerId(customerId);
    if (license == null) return [];
    return await _licenseRepo.getCompletedSteps(license.id);
  }

  /// Get pending steps
  Future<List<String>> getPendingSteps(int customerId) async {
    final license = await _licenseRepo.findByCustomerId(customerId);
    if (license == null) return LicenseRepository.stepNames;
    return await _licenseRepo.getPendingSteps(license.id);
  }

  /// Get next step to complete
  Future<String?> getNextStep(int customerId) async {
    final license = await _licenseRepo.findByCustomerId(customerId);
    if (license == null) return null;

    final pending = await _licenseRepo.getPendingSteps(license.id);
    return pending.isNotEmpty ? pending.first : null;
  }

  /// Update amount fields
  Future<bool> updateAmounts({
    required int licenseId,
    double? complexSupplyAmount,
    double? feesAmount,
  }) async {
    final license = await _licenseRepo.findById(licenseId);
    if (license == null) {
      throw NotFoundException('الترخيص غير موجود');
    }

    // Validate amounts
    if (complexSupplyAmount != null && complexSupplyAmount < 0) {
      throw ValidationException('المبلغ يجب أن يكون أكبر من صفر');
    }
    if (feesAmount != null && feesAmount < 0) {
      throw ValidationException('المبلغ يجب أن يكون أكبر من صفر');
    }

    return await _licenseRepo.updateAmounts(
      licenseId: licenseId,
      complexSupplyAmount: complexSupplyAmount,
      feesAmount: feesAmount,
    );
  }

  /// Bulk update multiple steps
  Future<bool> updateMultipleSteps({
    required int licenseId,
    required Map<String, bool> steps,
  }) async {
    final license = await _licenseRepo.findById(licenseId);
    if (license == null) {
      throw NotFoundException('الترخيص غير موجود');
    }

    final success = await _licenseRepo.updateMultipleSteps(
      licenseId: licenseId,
      steps: steps,
    );

    // Log completed steps to history
    if (success) {
      for (final entry in steps.entries) {
        if (entry.value) {
          await _historyRepo.startStage(
            customerId: license.customerId,
            stageName: 'license_${entry.key}',
          );
        }
      }
    }

    return success;
  }

  /// Check if all steps are complete
  Future<bool> isComplete(int customerId) async {
    final license = await _licenseRepo.findByCustomerId(customerId);
    if (license == null) return false;
    return license.isComplete;
  }

  /// Get all licenses with progress < 100%
  Future<List<License>> getIncompleteLicenses() async {
    return await _licenseRepo.findByCompletionStatus(isComplete: false);
  }

  /// Get all complete licenses
  Future<List<License>> getCompleteLicenses() async {
    return await _licenseRepo.findByCompletionStatus(isComplete: true);
  }

  /// Get all licenses
  Future<List<License>> getAllLicenses() async {
    return await _licenseRepo.findAll();
  }

  /// Delete license
  Future<bool> deleteLicense(int licenseId) async {
    final license = await _licenseRepo.findById(licenseId);
    if (license == null) {
      throw NotFoundException('الترخيص غير موجود');
    }

    return await _licenseRepo.delete(licenseId);
  }

  /// Get step display name (Arabic)
  String getStepDisplayName(String stepName) {
    return _licenseRepo.getStepDisplayName(stepName);
  }

  /// Get step index (1-based)
  int getStepIndex(String stepName) {
    final index = LicenseRepository.stepNames.indexOf(stepName);
    return index >= 0 ? index + 1 : -1;
  }

  /// Check if step has money field
  bool stepHasMoneyField(String stepName) {
    return LicenseRepository.stepsWithMoney.contains(stepName);
  }

  /// Check if step is a date-based step (not request_number)
  bool stepHasDateField(String stepName) {
    return LicenseRepository.stepsWithDate.contains(stepName);
  }
}
