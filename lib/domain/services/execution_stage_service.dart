import '../../core/exceptions/app_exceptions.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/excavation_permit_repository.dart';
import '../../data/repositories/execution_stage_repository.dart';
import '../../data/repositories/stage_history_repository.dart';
import '../models/execution_stage.dart';

class ExecutionStageService {
  final ExecutionStageRepository _stageRepo;
  final CustomerRepository _customerRepo;
  final ExcavationPermitRepository _permitRepo;
  final StageHistoryRepository _historyRepo;

  ExecutionStageService(
    this._stageRepo,
    this._customerRepo,
    this._permitRepo,
    this._historyRepo,
  );

  /// Get execution stage for customer
  Future<ExecutionStage?> getStageForCustomer(int customerId) async {
    return await _stageRepo.findByCustomerId(customerId);
  }

  /// Create execution stage for customer
  Future<int> createStage(ExecutionStage stage) async {
    // Check customer exists
    final customer = await _customerRepo.findById(stage.customerId);
    if (customer == null) {
      throw NotFoundException('العميل غير موجود');
    }

    // Check customer has excavation permit
    final permit = await _permitRepo.findByCustomerId(stage.customerId);
    if (permit == null) {
      throw BusinessRuleException('يجب إصدار تصريح الحفر أولاً');
    }

    // Check customer doesn't already have execution stage
    final existing = await _stageRepo.findByCustomerId(stage.customerId);
    if (existing != null) {
      throw DuplicateException('العميل لديه مرحلة تنفيذ بالفعل');
    }

    // Create stage
    final stageId = await _stageRepo.insert(stage);

    // Update customer stage
    final updatedCustomer = customer.copyWith(currentStage: 'التنفيذ');
    await _customerRepo.update(customer.id, updatedCustomer);

    // Log to history
    await _historyRepo.startStage(
      customerId: stage.customerId,
      stageName: 'التنفيذ',
    );

    return stageId;
  }

  /// Update a specific step
  Future<bool> updateStep({
    required int stageId,
    required String stepName,
    required bool completed,
  }) async {
    final stage = await _stageRepo.findById(stageId);
    if (stage == null) {
      throw NotFoundException('مرحلة التنفيذ غير موجودة');
    }

    final success = await _stageRepo.updateStep(
      stageId: stageId,
      stepName: stepName,
      value: completed,
    );

    // Log to history if completed
    if (success && completed) {
      await _historyRepo.startStage(
        customerId: stage.customerId,
        stageName: 'execution_$stepName',
      );
    }

    // Update customer stage to display current step
    if (success) {
      final customer = await _customerRepo.findById(stage.customerId);
      if (customer != null) {
        final currentStep = await getCurrentStage(stage.customerId);
        final displayName = getStepDisplayName(currentStep ?? 'completed');
        final updatedCustomer = customer.copyWith(
          currentStage: 'التنفيذ - $displayName',
        );
        await _customerRepo.update(customer.id, updatedCustomer);
      }
    }

    return success;
  }

  /// Get progress for customer
  Future<double> getProgress(int customerId) async {
    final stage = await _stageRepo.findByCustomerId(customerId);
    if (stage == null) return 0.0;
    return stage.progress;
  }

  /// Get current stage name
  Future<String?> getCurrentStage(int customerId) async {
    final stage = await _stageRepo.findByCustomerId(customerId);
    if (stage == null) return null;
    return await _stageRepo.getCurrentStage(stage.id);
  }

  /// Get completed steps
  Future<List<String>> getCompletedSteps(int customerId) async {
    final stage = await _stageRepo.findByCustomerId(customerId);
    if (stage == null) return [];
    return await _stageRepo.getCompletedSteps(stage.id);
  }

  /// Get pending steps
  Future<List<String>> getPendingSteps(int customerId) async {
    final stage = await _stageRepo.findByCustomerId(customerId);
    if (stage == null) return ExecutionStageRepository.stepNames;
    return await _stageRepo.getPendingSteps(stage.id);
  }

  /// Estimate completion date
  Future<DateTime?> estimateCompletionDate(int customerId) async {
    final stage = await _stageRepo.findByCustomerId(customerId);
    if (stage == null) return null;

    final pending = await _stageRepo.getPendingSteps(stage.id);
    if (pending.isEmpty) return DateTime.now();

    // Get average duration for each pending step
    double totalDays = 0;
    for (final step in pending) {
      final avgDuration = await _historyRepo.getAverageDuration(
        'execution_$step',
      );
      totalDays += avgDuration > 0 ? avgDuration : 7; // Default 7 days
    }

    return DateTime.now().add(Duration(days: totalDays.ceil()));
  }

  /// Check if complete
  Future<bool> isComplete(int customerId) async {
    final stage = await _stageRepo.findByCustomerId(customerId);
    if (stage == null) return false;
    return stage.isComplete;
  }

  /// Get all incomplete stages
  Future<List<ExecutionStage>> getIncompleteStages() async {
    return await _stageRepo.findByCompletionStatus(isComplete: false);
  }

  /// Get step display name
  String getStepDisplayName(String stepName) {
    const stepNames = {
      'survey_1': 'المساحة 1',
      'excavation': 'الحفر',
      'replacement': 'الإحلال',
      'survey_2': 'المساحة 2',
      'plain_concrete': 'الخرسانة العادية',
      'reinforced_concrete': 'الخرسانة المسلحة',
      'basement_columns': 'أعمدة البدروم',
      'basement_ceiling': 'سقف البدروم',
      'ground_columns': 'أعمدة الأرضي',
      'ground_ceiling': 'سقف الأرضي',
      'first_columns': 'أعمدة الأول',
      'first_ceiling': 'سقف الأول',
      'second_columns': 'أعمدة الثاني',
      'second_ceiling': 'سقف الثاني',
      'third_columns': 'أعمدة الثالث',
      'third_ceiling': 'سقف الثالث',
      'fourth_columns': 'أعمدة الرابع',
      'fourth_ceiling': 'سقف الرابع',
      'fifth_columns': 'أعمدة الخامس',
      'fifth_ceiling': 'سقف الخامس',
      'completed': 'مكتمل',
    };
    return stepNames[stepName] ?? stepName;
  }
}
