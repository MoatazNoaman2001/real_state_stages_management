part of 'excavation_permit_bloc.dart';

@immutable
sealed class ExcavationPermitState {}

/// Initial state
final class ExcavationPermitInitial extends ExcavationPermitState {}

/// Loading state
final class ExcavationPermitLoading extends ExcavationPermitState {}

/// Excavation permit loaded successfully
final class ExcavationPermitLoaded extends ExcavationPermitState {
  final ExcavationPermit permit;
  final double progress;
  final List<String> completedSteps;
  final String? nextStep;
  final String? updatingStep; // Track which step is being updated for loading indicator

  ExcavationPermitLoaded({
    required this.permit,
    required this.progress,
    required this.completedSteps,
    this.nextStep,
    this.updatingStep,
  });
}

/// Excavation permit not found for customer
final class ExcavationPermitNotFound extends ExcavationPermitState {
  final int customerId;
  ExcavationPermitNotFound({required this.customerId});
}

/// Error state
final class ExcavationPermitError extends ExcavationPermitState {
  final String message;
  ExcavationPermitError(this.message);
}

/// Operation in progress
final class ExcavationPermitOperationInProgress extends ExcavationPermitState {
  final String message;
  ExcavationPermitOperationInProgress(this.message);
}

/// Operation success
final class ExcavationPermitOperationSuccess extends ExcavationPermitState {
  final String message;
  ExcavationPermitOperationSuccess(this.message);
}

/// Step updated
final class ExcavationPermitStepUpdated extends ExcavationPermitState {
  final String stepName;
  final bool value;
  final String message;

  ExcavationPermitStepUpdated({
    required this.stepName,
    required this.value,
    required this.message,
  });
}
