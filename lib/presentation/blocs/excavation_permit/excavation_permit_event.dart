part of 'excavation_permit_bloc.dart';

@immutable
sealed class ExcavationPermitEvent {}

/// Load excavation permit for a specific customer
final class LoadExcavationPermitForCustomer extends ExcavationPermitEvent {
  final int customerId;
  LoadExcavationPermitForCustomer(this.customerId);
}

/// Update a specific step (checkbox)
final class UpdateExcavationPermitStep extends ExcavationPermitEvent {
  final int permitId;
  final String stepName;
  final bool value;

  UpdateExcavationPermitStep({
    required this.permitId,
    required this.stepName,
    required this.value,
  });
}

/// Update step notes
final class UpdateExcavationPermitStepNotes extends ExcavationPermitEvent {
  final int permitId;
  final String stepName;
  final String? notes;

  UpdateExcavationPermitStepNotes({
    required this.permitId,
    required this.stepName,
    required this.notes,
  });
}

/// Update union supply amount
final class UpdateExcavationPermitAmount extends ExcavationPermitEvent {
  final int permitId;
  final double? amount;

  UpdateExcavationPermitAmount({
    required this.permitId,
    required this.amount,
  });
}

/// Create new excavation permit for customer
final class CreateExcavationPermit extends ExcavationPermitEvent {
  final int customerId;
  CreateExcavationPermit(this.customerId);
}
