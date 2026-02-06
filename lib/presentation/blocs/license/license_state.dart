part of 'license_bloc.dart';

@immutable
sealed class LicenseState {}

/// Initial state
final class LicenseInitial extends LicenseState {}

/// Loading state
final class LicenseLoading extends LicenseState {}

/// License loaded successfully
final class LicenseLoaded extends LicenseState {
  final License license;
  final double progress;
  final List<String> completedSteps;
  final String? nextStep;
  final String? updatingStep; // Track which step is being updated for loading indicator

  LicenseLoaded({
    required this.license,
    required this.progress,
    required this.completedSteps,
    this.nextStep,
    this.updatingStep,
  });
}

/// License not found for customer
final class LicenseNotFound extends LicenseState {
  final int customerId;
  LicenseNotFound({required this.customerId});
}

/// Error state
final class LicenseError extends LicenseState {
  final String message;
  LicenseError(this.message);
}

/// Operation in progress
final class LicenseOperationInProgress extends LicenseState {
  final String message;
  LicenseOperationInProgress(this.message);
}

/// Operation success
final class LicenseOperationSuccess extends LicenseState {
  final String message;
  LicenseOperationSuccess(this.message);
}

final class LicenseStepUpdated extends LicenseState {
  final String stepName;
  final bool value;
  final String message;

  LicenseStepUpdated({
    required this.stepName,
    required this.value,
    required this.message,
  });
}
