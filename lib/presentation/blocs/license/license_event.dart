part of 'license_bloc.dart';

@immutable
sealed class LicenseEvent {}

/// Load license for a specific customer
final class LoadLicenseForCustomer extends LicenseEvent {
  final int customerId;
  LoadLicenseForCustomer(this.customerId);
}

/// Update a specific step
final class UpdateLicenseStep extends LicenseEvent {
  final int licenseId;
  final String stepName;
  final bool value;

  UpdateLicenseStep({
    required this.licenseId,
    required this.stepName,
    required this.value,
  });
}

/// Update request number (step 14)
final class UpdateLicenseRequestNumber extends LicenseEvent {
  final int licenseId;
  final String? requestNumber;

  UpdateLicenseRequestNumber({
    required this.licenseId,
    required this.requestNumber,
  });
}

/// Update amount fields
final class UpdateLicenseAmounts extends LicenseEvent {
  final int licenseId;
  final double? complexSupplyAmount;
  final double? feesAmount;

  UpdateLicenseAmounts({
    required this.licenseId,
    this.complexSupplyAmount,
    this.feesAmount,
  });
}

/// Create new license for customer
final class CreateLicense extends LicenseEvent {
  final int customerId;
  CreateLicense(this.customerId);
}

/// Update step notes
final class UpdateLicenseStepNotes extends LicenseEvent {
  final int licenseId;
  final String stepName;
  final String? notes;

  UpdateLicenseStepNotes({
    required this.licenseId,
    required this.stepName,
    required this.notes,
  });
}
