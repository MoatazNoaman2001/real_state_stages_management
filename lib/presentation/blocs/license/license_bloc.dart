import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/exceptions/app_exceptions.dart';
import '../../../domain/models/license.dart';
import '../../../domain/services/license_service.dart';

part 'license_event.dart';
part 'license_state.dart';

class LicenseBloc extends Bloc<LicenseEvent, LicenseState> {
  final LicenseService _service;

  LicenseBloc(this._service) : super(LicenseInitial()) {
    on<LoadLicenseForCustomer>(_onLoadLicense);
    on<UpdateLicenseStep>(_onUpdateStep);
    on<UpdateLicenseRequestNumber>(_onUpdateRequestNumber);
    on<UpdateLicenseAmounts>(_onUpdateAmounts);
    on<CreateLicense>(_onCreateLicense);
    on<UpdateLicenseStepNotes>(_onUpdateStepNotes);
  }

  Future<void> _onLoadLicense(
    LoadLicenseForCustomer event,
    Emitter<LicenseState> emit,
  ) async {
    emit(LicenseLoading());
    try {
      final license = await _service.getLicenseForCustomer(event.customerId);
      if (license != null) {
        final completedSteps = await _service.getCompletedSteps(event.customerId);
        final nextStep = await _service.getNextStep(event.customerId);
        emit(LicenseLoaded(
          license: license,
          progress: license.progress,
          completedSteps: completedSteps,
          nextStep: nextStep,
        ));
      } else {
        emit(LicenseNotFound(customerId: event.customerId));
      }
    } catch (e) {
      emit(LicenseError(_getErrorMessage(e)));
    }
  }

  Future<void> _onUpdateStep(
    UpdateLicenseStep event,
    Emitter<LicenseState> emit,
  ) async {
    final currentState = state;
    if (currentState is! LicenseLoaded) return;

    // Optimistically update the state
    final optimisticLicense = _updateLicenseStep(
      currentState.license,
      event.stepName,
      event.value,
    );
    emit(LicenseLoaded(
      license: optimisticLicense,
      progress: optimisticLicense.progress,
      completedSteps: currentState.completedSteps,
      nextStep: currentState.nextStep,
      updatingStep: event.stepName,
    ));

    try {
      await _service.updateStep(
        licenseId: event.licenseId,
        stepName: event.stepName,
        completed: event.value,
      );

      // Silently refresh data
      final license = await _service.getLicenseForCustomer(currentState.license.customerId);
      if (license != null) {
        final completedSteps = await _service.getCompletedSteps(currentState.license.customerId);
        final nextStep = await _service.getNextStep(currentState.license.customerId);
        emit(LicenseLoaded(
          license: license,
          progress: license.progress,
          completedSteps: completedSteps,
          nextStep: nextStep,
        ));
      }
    } catch (e) {
      // Revert on error
      emit(LicenseLoaded(
        license: currentState.license,
        progress: currentState.progress,
        completedSteps: currentState.completedSteps,
        nextStep: currentState.nextStep,
      ));
      emit(LicenseError(_getErrorMessage(e)));
    }
  }

  License _updateLicenseStep(License license, String stepName, bool value) {
    final json = license.toJson();
    json[stepName] = value;
    if (value) {
      json['${stepName}_date'] = DateTime.now().toIso8601String();
    } else {
      json['${stepName}_date'] = null;
    }
    return License.fromJson(json);
  }

  Future<void> _onUpdateRequestNumber(
    UpdateLicenseRequestNumber event,
    Emitter<LicenseState> emit,
  ) async {
    final currentState = state;
    emit(LicenseOperationInProgress('جاري تحديث رقم الطلب...'));
    try {
      await _service.updateRequestNumber(
        licenseId: event.licenseId,
        requestNumber: event.requestNumber,
      );
      emit(LicenseOperationSuccess('تم تحديث رقم الطلب'));
      // Reload license
      if (currentState is LicenseLoaded) {
        add(LoadLicenseForCustomer(currentState.license.customerId));
      }
    } catch (e) {
      emit(LicenseError(_getErrorMessage(e)));
    }
  }

  Future<void> _onUpdateAmounts(
    UpdateLicenseAmounts event,
    Emitter<LicenseState> emit,
  ) async {
    final currentState = state;
    emit(LicenseOperationInProgress('جاري تحديث المبالغ...'));
    try {
      await _service.updateAmounts(
        licenseId: event.licenseId,
        complexSupplyAmount: event.complexSupplyAmount,
        feesAmount: event.feesAmount,
      );
      emit(LicenseOperationSuccess('تم تحديث المبالغ'));
      // Reload license
      if (currentState is LicenseLoaded) {
        add(LoadLicenseForCustomer(currentState.license.customerId));
      }
    } catch (e) {
      emit(LicenseError(_getErrorMessage(e)));
    }
  }

  Future<void> _onCreateLicense(
    CreateLicense event,
    Emitter<LicenseState> emit,
  ) async {
    emit(LicenseOperationInProgress('جاري إنشاء الترخيص...'));
    try {
      final now = DateTime.now();
      final license = License(
        id: 0,
        customerId: event.customerId,
        createdAt: now,
        updatedAt: now,
      );
      await _service.createLicense(license);
      emit(LicenseOperationSuccess('تم إنشاء الترخيص بنجاح'));
      // Load the new license
      add(LoadLicenseForCustomer(event.customerId));
    } catch (e) {
      emit(LicenseError(_getErrorMessage(e)));
    }
  }

  Future<void> _onUpdateStepNotes(
    UpdateLicenseStepNotes event,
    Emitter<LicenseState> emit,
  ) async {
    final currentState = state;
    if (currentState is! LicenseLoaded) return;

    try {
      await _service.updateStepNotes(
        licenseId: event.licenseId,
        stepName: event.stepName,
        notes: event.notes,
      );

      // Reload to show updated notes
      final license = await _service.getLicenseForCustomer(currentState.license.customerId);
      if (license != null) {
        final completedSteps = await _service.getCompletedSteps(currentState.license.customerId);
        final nextStep = await _service.getNextStep(currentState.license.customerId);
        emit(LicenseLoaded(
          license: license,
          progress: license.progress,
          completedSteps: completedSteps,
          nextStep: nextStep,
        ));
        emit(LicenseStepUpdated(
          stepName: event.stepName,
          value: true,
          message: 'تم حفظ الملاحظات',
        ));
      }
    } catch (e) {
      emit(LicenseError(_getErrorMessage(e)));
    }
  }

  String _getErrorMessage(Object error) {
    if (error is AppException) {
      return error.message;
    }
    return 'حدث خطأ غير متوقع: ${error.toString()}';
  }
}
