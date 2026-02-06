part of 'execution_stage_bloc.dart';

@immutable
sealed class ExecutionStageState {}

/// Initial state
final class ExecutionStageInitial extends ExecutionStageState {}

/// Loading state
final class ExecutionStageLoading extends ExecutionStageState {}

/// Execution stage loaded successfully
final class ExecutionStageLoaded extends ExecutionStageState {
  final ExecutionStage stage;
  final double progress;
  final List<String> completedSteps;
  final List<String> pendingSteps;
  final String currentStep;
  final String? updatingStep; // Track which step is being updated for loading indicator

  ExecutionStageLoaded({
    required this.stage,
    required this.progress,
    required this.completedSteps,
    required this.pendingSteps,
    required this.currentStep,
    this.updatingStep,
  });
}

/// Execution stage not found for customer
final class ExecutionStageNotFound extends ExecutionStageState {
  final int customerId;
  ExecutionStageNotFound({required this.customerId});
}

/// Error state
final class ExecutionStageError extends ExecutionStageState {
  final String message;
  ExecutionStageError(this.message);
}

/// Operation in progress
final class ExecutionStageOperationInProgress extends ExecutionStageState {
  final String message;
  ExecutionStageOperationInProgress(this.message);
}

/// Operation success
final class ExecutionStageOperationSuccess extends ExecutionStageState {
  final String message;
  ExecutionStageOperationSuccess(this.message);
}

/// Step updated
final class ExecutionStageStepUpdated extends ExecutionStageState {
  final String stepName;
  final bool value;
  final String message;

  ExecutionStageStepUpdated({
    required this.stepName,
    required this.value,
    required this.message,
  });
}
