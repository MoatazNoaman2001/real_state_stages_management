import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../data/repositories/excavation_permit_repository.dart';
import '../../../domain/models/excavation_permit.dart';
import '../../../domain/services/excavation_permit_service.dart';

part 'excavation_permit_event.dart';
part 'excavation_permit_state.dart';

class ExcavationPermitBloc extends Bloc<ExcavationPermitEvent, ExcavationPermitState> {
  final ExcavationPermitService _service;
  final ExcavationPermitRepository _repository;

  ExcavationPermitBloc(this._service, this._repository) : super(ExcavationPermitInitial()) {
    on<LoadExcavationPermitForCustomer>(_onLoadPermit);
    on<UpdateExcavationPermitStep>(_onUpdateStep);
    on<UpdateExcavationPermitStepNotes>(_onUpdateStepNotes);
    on<UpdateExcavationPermitAmount>(_onUpdateAmount);
    on<CreateExcavationPermit>(_onCreatePermit);
  }

  Future<void> _onLoadPermit(
    LoadExcavationPermitForCustomer event,
    Emitter<ExcavationPermitState> emit,
  ) async {
    emit(ExcavationPermitLoading());
    try {
      final permit = await _service.getPermitForCustomer(event.customerId);
      if (permit != null) {
        final completedSteps = await _service.getCompletedSteps(event.customerId);
        final nextStep = await _service.getNextStep(event.customerId);
        emit(ExcavationPermitLoaded(
          permit: permit,
          progress: permit.progress,
          completedSteps: completedSteps,
          nextStep: nextStep,
        ));
      } else {
        emit(ExcavationPermitNotFound(customerId: event.customerId));
      }
    } catch (e) {
      emit(ExcavationPermitError(_getErrorMessage(e)));
    }
  }

  Future<void> _onUpdateStep(
    UpdateExcavationPermitStep event,
    Emitter<ExcavationPermitState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ExcavationPermitLoaded) return;

    // Optimistically update the state
    final optimisticPermit = _updatePermitStep(
      currentState.permit,
      event.stepName,
      event.value,
    );
    emit(ExcavationPermitLoaded(
      permit: optimisticPermit,
      progress: optimisticPermit.progress,
      completedSteps: currentState.completedSteps,
      nextStep: currentState.nextStep,
      updatingStep: event.stepName,
    ));

    try {
      await _service.updateStep(
        permitId: event.permitId,
        stepName: event.stepName,
        completed: event.value,
      );

      // Silently refresh data
      final permit = await _service.getPermitForCustomer(currentState.permit.customerId);
      if (permit != null) {
        final completedSteps = await _service.getCompletedSteps(currentState.permit.customerId);
        final nextStep = await _service.getNextStep(currentState.permit.customerId);
        emit(ExcavationPermitLoaded(
          permit: permit,
          progress: permit.progress,
          completedSteps: completedSteps,
          nextStep: nextStep,
        ));
      }
    } catch (e) {
      // Revert on error
      emit(ExcavationPermitLoaded(
        permit: currentState.permit,
        progress: currentState.progress,
        completedSteps: currentState.completedSteps,
        nextStep: currentState.nextStep,
      ));
      emit(ExcavationPermitError(_getErrorMessage(e)));
    }
  }

  ExcavationPermit _updatePermitStep(ExcavationPermit permit, String stepName, bool value) {
    final json = permit.toJson();
    json[stepName] = value;
    if (value) {
      json['${stepName}_date'] = DateTime.now().toIso8601String();
    } else {
      json['${stepName}_date'] = null;
    }
    return ExcavationPermit.fromJson(json);
  }

  Future<void> _onUpdateStepNotes(
    UpdateExcavationPermitStepNotes event,
    Emitter<ExcavationPermitState> emit,
  ) async {
    final currentState = state;
    emit(ExcavationPermitOperationInProgress('جاري حفظ الملاحظات...'));
    try {
      await _repository.updateStepNotes(
        permitId: event.permitId,
        stepName: event.stepName,
        notes: event.notes,
      );
      emit(ExcavationPermitOperationSuccess('تم حفظ الملاحظات'));
      // Reload permit
      if (currentState is ExcavationPermitLoaded) {
        add(LoadExcavationPermitForCustomer(currentState.permit.customerId));
      }
    } catch (e) {
      emit(ExcavationPermitError(_getErrorMessage(e)));
    }
  }

  Future<void> _onUpdateAmount(
    UpdateExcavationPermitAmount event,
    Emitter<ExcavationPermitState> emit,
  ) async {
    final currentState = state;
    emit(ExcavationPermitOperationInProgress('جاري حفظ المبلغ...'));
    try {
      await _repository.updateSupplyAmount(
        permitId: event.permitId,
        amount: event.amount,
      );
      emit(ExcavationPermitOperationSuccess('تم حفظ المبلغ'));
      // Reload permit
      if (currentState is ExcavationPermitLoaded) {
        add(LoadExcavationPermitForCustomer(currentState.permit.customerId));
      }
    } catch (e) {
      emit(ExcavationPermitError(_getErrorMessage(e)));
    }
  }

  Future<void> _onCreatePermit(
    CreateExcavationPermit event,
    Emitter<ExcavationPermitState> emit,
  ) async {
    emit(ExcavationPermitOperationInProgress('جاري إنشاء إذن الحفر...'));
    try {
      final now = DateTime.now();
      final permit = ExcavationPermit(
        id: 0,
        customerId: event.customerId,
        createdAt: now,
        updatedAt: now,
      );
      await _service.createPermit(permit);
      emit(ExcavationPermitOperationSuccess('تم إنشاء إذن الحفر بنجاح'));
      // Load the new permit
      add(LoadExcavationPermitForCustomer(event.customerId));
    } catch (e) {
      emit(ExcavationPermitError(_getErrorMessage(e)));
    }
  }

  String _getErrorMessage(Object error) {
    if (error is AppException) {
      return error.message;
    }
    return 'حدث خطأ غير متوقع: ${error.toString()}';
  }
}
