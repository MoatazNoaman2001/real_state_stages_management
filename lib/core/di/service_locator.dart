import 'package:get_it/get_it.dart';

import '../../data/repositories/alert_repository.dart';
import '../../data/repositories/architectural_modification_repository.dart';
import '../../data/repositories/company_project_repository.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/excavation_permit_repository.dart';
import '../../data/repositories/execution_stage_repository.dart';
import '../../data/repositories/inspection_repository.dart';
import '../../data/repositories/license_repository.dart';
import '../../data/repositories/real_estate_project_repository.dart';
import '../../data/repositories/road_work_repository.dart';
import '../../data/repositories/rooftop_addition_repository.dart';
import '../../data/repositories/scheduled_alert_repository.dart';
import '../../data/repositories/stage_history_repository.dart';
import '../../data/repositories/supervision_certificate_repository.dart';
import '../../data/repositories/utility_meter_repository.dart';
import '../../domain/services/alert_service.dart';
import '../../domain/services/customer_service.dart';
import '../../domain/services/excavation_permit_service.dart';
import '../../domain/services/execution_stage_service.dart';
import '../../domain/services/inspection_service.dart';
import '../../domain/services/license_service.dart';
import '../../domain/services/notification_service.dart';
import '../../domain/services/search_service.dart';

final getIt = GetIt.instance;

/// Setup all repositories
void setupRepositories() {
  // Customer
  getIt.registerLazySingleton<CustomerRepository>(
    () => CustomerRepository(),
  );

  // License
  getIt.registerLazySingleton<LicenseRepository>(
    () => LicenseRepository(),
  );

  // Excavation Permit
  getIt.registerLazySingleton<ExcavationPermitRepository>(
    () => ExcavationPermitRepository(),
  );

  // Execution Stage
  getIt.registerLazySingleton<ExecutionStageRepository>(
    () => ExecutionStageRepository(),
  );

  // Architectural Modification
  getIt.registerLazySingleton<ArchitecturalModificationRepository>(
    () => ArchitecturalModificationRepository(),
  );

  // Utility Meter
  getIt.registerLazySingleton<UtilityMeterRepository>(
    () => UtilityMeterRepository(),
  );

  // Road Work
  getIt.registerLazySingleton<RoadWorkRepository>(
    () => RoadWorkRepository(),
  );

  // Rooftop Addition
  getIt.registerLazySingleton<RooftopAdditionRepository>(
    () => RooftopAdditionRepository(),
  );

  // Inspection
  getIt.registerLazySingleton<InspectionRepository>(
    () => InspectionRepository(),
  );

  // Supervision Certificate
  getIt.registerLazySingleton<SupervisionCertificateRepository>(
    () => SupervisionCertificateRepository(),
  );

  // Real Estate Project
  getIt.registerLazySingleton<RealEstateProjectRepository>(
    () => RealEstateProjectRepository(),
  );

  // Company Project
  getIt.registerLazySingleton<CompanyProjectRepository>(
    () => CompanyProjectRepository(),
  );

  // Alert
  getIt.registerLazySingleton<AlertRepository>(
    () => AlertRepository(),
  );

  // Stage History
  getIt.registerLazySingleton<StageHistoryRepository>(
    () => StageHistoryRepository(),
  );

  // Scheduled Alert
  getIt.registerLazySingleton<ScheduledAlertRepository>(
    () => ScheduledAlertRepository(),
  );
}

/// Setup all services
void setupServices() {
  // Customer Service
  getIt.registerLazySingleton<CustomerService>(
    () => CustomerService(getIt<CustomerRepository>()),
  );

  // License Service
  getIt.registerLazySingleton<LicenseService>(
    () => LicenseService(
      getIt<LicenseRepository>(),
      getIt<CustomerRepository>(),
      getIt<StageHistoryRepository>(),
    ),
  );

  // Alert Service
  getIt.registerLazySingleton<AlertService>(
    () => AlertService(
      getIt<AlertRepository>(),
      getIt<StageHistoryRepository>(),
      getIt<CustomerRepository>(),
      getIt<InspectionRepository>(),
    ),
  );

  // Excavation Permit Service
  getIt.registerLazySingleton<ExcavationPermitService>(
    () => ExcavationPermitService(
      getIt<ExcavationPermitRepository>(),
      getIt<CustomerRepository>(),
      getIt<LicenseRepository>(),
      getIt<StageHistoryRepository>(),
    ),
  );

  // Execution Stage Service
  getIt.registerLazySingleton<ExecutionStageService>(
    () => ExecutionStageService(
      getIt<ExecutionStageRepository>(),
      getIt<CustomerRepository>(),
      getIt<ExcavationPermitRepository>(),
      getIt<StageHistoryRepository>(),
    ),
  );

  // Inspection Service
  getIt.registerLazySingleton<InspectionService>(
    () => InspectionService(
      getIt<InspectionRepository>(),
      getIt<CustomerRepository>(),
      getIt<AlertRepository>(),
    ),
  );

  // Search Service
  getIt.registerLazySingleton<SearchService>(
    () => SearchService(
      getIt<CustomerRepository>(),
      getIt<InspectionRepository>(),
      getIt<RealEstateProjectRepository>(),
      getIt<CompanyProjectRepository>(),
    ),
  );

  // Notification Service
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(
      getIt<ScheduledAlertRepository>(),
      getIt<RoadWorkRepository>(),
    ),
  );
}

/// Initialize all dependencies
Future<void> initDependencies() async {
  setupRepositories();
  setupServices();

  // Initialize notification service to start monitoring
  await _initializeNotificationService();
}

/// Initialize and start the notification service
Future<void> _initializeNotificationService() async {
  try {
    print('Initializing NotificationService...');
    final notificationService = getIt<NotificationService>();
    await notificationService.initialize();
    print('✓ Notification service initialized and monitoring started');
  } catch (e, stackTrace) {
    print('⚠ Failed to initialize notification service: $e');
    print('Stack trace: $stackTrace');
    // Don't rethrow - let the app continue even if notifications fail
  }
}

/// Reset all dependencies (useful for testing)
Future<void> resetDependencies() async {
  await getIt.reset();
}
