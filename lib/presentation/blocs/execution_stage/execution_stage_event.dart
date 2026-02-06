part of 'execution_stage_bloc.dart';

@immutable
sealed class ExecutionStageEvent {}

/// Load execution stage for a specific customer
final class LoadExecutionStageForCustomer extends ExecutionStageEvent {
  final int customerId;
  LoadExecutionStageForCustomer(this.customerId);
}

/// Update a specific step (checkbox)
final class UpdateExecutionStep extends ExecutionStageEvent {
  final int stageId;
  final String stepName;
  final bool value;

  UpdateExecutionStep({
    required this.stageId,
    required this.stepName,
    required this.value,
  });
}

/// Update step notes
final class UpdateExecutionStepNotes extends ExecutionStageEvent {
  final int stageId;
  final String stepName;
  final String? notes;

  UpdateExecutionStepNotes({
    required this.stageId,
    required this.stepName,
    required this.notes,
  });
}

/// Create new execution stage for customer
final class CreateExecutionStage extends ExecutionStageEvent {
  final int customerId;
  CreateExecutionStage(this.customerId);
}
