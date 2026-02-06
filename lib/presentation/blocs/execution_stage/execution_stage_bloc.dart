import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../data/repositories/execution_stage_repository.dart';
import '../../../domain/models/execution_stage.dart';
import '../../../domain/services/execution_stage_service.dart';

part 'execution_stage_event.dart';
part 'execution_stage_state.dart';

class ExecutionStageBloc extends Bloc<ExecutionStageEvent, ExecutionStageState> {
  final ExecutionStageService _service;
  final ExecutionStageRepository _repository;

  ExecutionStageBloc(this._service, this._repository) : super(ExecutionStageInitial()) {
    on<LoadExecutionStageForCustomer>(_onLoadStage);
    on<UpdateExecutionStep>(_onUpdateStep);
    on<UpdateExecutionStepNotes>(_onUpdateStepNotes);
    on<CreateExecutionStage>(_onCreateStage);
  }

  Future<void> _onLoadStage(
    LoadExecutionStageForCustomer event,
    Emitter<ExecutionStageState> emit,
  ) async {
    emit(ExecutionStageLoading());
    try {
      final stage = await _service.getStageForCustomer(event.customerId);
      if (stage != null) {
        final completedSteps = await _service.getCompletedSteps(event.customerId);
        final pendingSteps = await _service.getPendingSteps(event.customerId);
        emit(ExecutionStageLoaded(
          stage: stage,
          progress: stage.progress,
          completedSteps: completedSteps,
          pendingSteps: pendingSteps,
          currentStep: stage.currentStageName,
        ));
      } else {
        emit(ExecutionStageNotFound(customerId: event.customerId));
      }
    } catch (e) {
      emit(ExecutionStageError(_getErrorMessage(e)));
    }
  }

  Future<void> _onUpdateStep(
    UpdateExecutionStep event,
    Emitter<ExecutionStageState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ExecutionStageLoaded) return;

    // Optimistically update the state
    final optimisticStage = _updateStageStep(
      currentState.stage,
      event.stepName,
      event.value,
    );
    emit(ExecutionStageLoaded(
      stage: optimisticStage,
      progress: optimisticStage.progress,
      completedSteps: currentState.completedSteps,
      pendingSteps: currentState.pendingSteps,
      currentStep: currentState.currentStep,
      updatingStep: event.stepName,
    ));

    try {
      await _service.updateStep(
        stageId: event.stageId,
        stepName: event.stepName,
        completed: event.value,
      );

      // Silently refresh data
      final stage = await _service.getStageForCustomer(currentState.stage.customerId);
      if (stage != null) {
        final completedSteps = await _service.getCompletedSteps(currentState.stage.customerId);
        final pendingSteps = await _service.getPendingSteps(currentState.stage.customerId);
        emit(ExecutionStageLoaded(
          stage: stage,
          progress: stage.progress,
          completedSteps: completedSteps,
          pendingSteps: pendingSteps,
          currentStep: stage.currentStageName,
        ));
      }
    } catch (e) {
      // Revert on error
      emit(ExecutionStageLoaded(
        stage: currentState.stage,
        progress: currentState.progress,
        completedSteps: currentState.completedSteps,
        pendingSteps: currentState.pendingSteps,
        currentStep: currentState.currentStep,
      ));
      emit(ExecutionStageError(_getErrorMessage(e)));
    }
  }

  ExecutionStage _updateStageStep(ExecutionStage stage, String stepName, bool value) {
    final json = stage.toJson();
    json[stepName] = value;
    if (value) {
      json['${stepName}_date'] = DateTime.now().toIso8601String();
    } else {
      json['${stepName}_date'] = null;
    }
    return ExecutionStage.fromJson(json);
  }

  Future<void> _onUpdateStepNotes(
    UpdateExecutionStepNotes event,
    Emitter<ExecutionStageState> emit,
  ) async {
    final currentState = state;
    emit(ExecutionStageOperationInProgress('جاري حفظ الملاحظات...'));
    try {
      await _repository.updateStepNotes(
        stageId: event.stageId,
        stepName: event.stepName,
        notes: event.notes,
      );
      emit(ExecutionStageOperationSuccess('تم حفظ الملاحظات'));
      // Reload stage
      if (currentState is ExecutionStageLoaded) {
        add(LoadExecutionStageForCustomer(currentState.stage.customerId));
      }
    } catch (e) {
      emit(ExecutionStageError(_getErrorMessage(e)));
    }
  }

  Future<void> _onCreateStage(
    CreateExecutionStage event,
    Emitter<ExecutionStageState> emit,
  ) async {
    emit(ExecutionStageOperationInProgress('جاري إنشاء مرحلة التنفيذ...'));
    try {
      final now = DateTime.now();
      final stage = ExecutionStage(
        id: 0,
        customerId: event.customerId,
        createdAt: now,
        updatedAt: now,
      );
      await _service.createStage(stage);
      emit(ExecutionStageOperationSuccess('تم إنشاء مرحلة التنفيذ بنجاح'));
      // Load the new stage
      add(LoadExecutionStageForCustomer(event.customerId));
    } catch (e) {
      emit(ExecutionStageError(_getErrorMessage(e)));
    }
  }

  String _getErrorMessage(Object error) {
    if (error is AppException) {
      return error.message;
    }
    return 'حدث خطأ غير متوقع: ${error.toString()}';
  }
}
