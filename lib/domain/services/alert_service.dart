import 'dart:async';

import '../../core/exceptions/app_exceptions.dart';
import '../../data/repositories/alert_repository.dart';
import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/inspection_repository.dart';
import '../../data/repositories/stage_history_repository.dart';
import '../models/alert.dart';

class AlertService {
  final AlertRepository _alertRepo;
  final StageHistoryRepository _historyRepo;
  final CustomerRepository _customerRepo;
  final InspectionRepository _inspectionRepo;

  Timer? _backgroundTimer;

  // Alert types
  static const String typeStuckStage = 'stuck_stage';
  static const String typeUpcomingInspection = 'upcoming_inspection';
  static const String typePendingPayment = 'pending_payment';
  static const String typeCustom = 'custom';

  AlertService(
    this._alertRepo,
    this._historyRepo,
    this._customerRepo,
    this._inspectionRepo,
  );

  /// Check for stages stuck more than N days
  Future<List<Alert>> checkStuckStages({int stuckDays = 7}) async {
    final inProgress = await _historyRepo.findInProgress();
    final newAlerts = <Alert>[];
    final now = DateTime.now();

    for (final history in inProgress) {
      if (history.startedAt == null) continue;

      final daysSinceStart = now.difference(history.startedAt!).inDays;
      if (daysSinceStart > stuckDays) {
        // Check if alert already exists
        final existingAlerts = await _alertRepo.findByCustomerId(
          history.customerId,
        );

        final alreadyAlerted = existingAlerts.any(
          (a) =>
              a.alertType == typeStuckStage &&
              a.message?.contains(history.stageName ?? '') == true &&
              a.isActive,
        );

        if (!alreadyAlerted) {
          final customer = await _customerRepo.findById(history.customerId);
          final alertId = await createAlert(
            customerId: history.customerId,
            type: typeStuckStage,
            message:
                'المرحلة "${history.stageName}" متوقفة منذ $daysSinceStart يوم للعميل ${customer?.customerName ?? ""}',
          );

          final alert = await _alertRepo.findById(alertId);
          if (alert != null) newAlerts.add(alert);
        }
      }
    }

    return newAlerts;
  }

  /// Check for upcoming inspections
  Future<List<Alert>> checkUpcomingInspections({int days = 7}) async {
    final upcoming = await _inspectionRepo.findUpcoming(days);
    final newAlerts = <Alert>[];

    for (final inspection in upcoming) {
      // Check if alert already exists
      final existingAlerts = await _alertRepo.findByCustomerId(
        inspection.customerId,
      );

      final alreadyAlerted = existingAlerts.any(
        (a) =>
            a.alertType == typeUpcomingInspection &&
            a.message?.contains(inspection.id.toString()) == true &&
            a.isActive,
      );

      if (!alreadyAlerted) {
        final customer = await _customerRepo.findById(inspection.customerId);
        final daysUntil =
            inspection.inspectionDate?.difference(DateTime.now()).inDays ?? 0;

        final alertId = await createAlert(
          customerId: inspection.customerId,
          type: typeUpcomingInspection,
          message:
              'معاينة قادمة بعد $daysUntil يوم للعميل ${customer?.customerName ?? ""} - ${inspection.reason ?? ""}',
        );

        final alert = await _alertRepo.findById(alertId);
        if (alert != null) newAlerts.add(alert);
      }
    }

    return newAlerts;
  }

  /// Get all active alerts
  Future<List<Alert>> getActiveAlerts() async {
    return await _alertRepo.findActive();
  }

  /// Get alerts for specific customer
  Future<List<Alert>> getAlertsForCustomer(int customerId) async {
    return await _alertRepo.findByCustomerId(customerId);
  }

  /// Get active alerts for customer
  Future<List<Alert>> getActiveAlertsForCustomer(int customerId) async {
    final alerts = await _alertRepo.findByCustomerId(customerId);
    return alerts.where((a) => a.isActive).toList();
  }

  /// Mark alert as read
  Future<bool> markAsRead(int alertId) async {
    final alert = await _alertRepo.findById(alertId);
    if (alert == null) {
      throw NotFoundException('التنبيه غير موجود');
    }
    return await _alertRepo.markAsRead(alertId);
  }

  /// Mark all customer alerts as read
  Future<int> markAllAsRead(int customerId) async {
    return await _alertRepo.markAllAsRead(customerId);
  }

  /// Create new alert
  Future<int> createAlert({
    required int customerId,
    required String type,
    required String message,
  }) async {
    // Validate customer exists
    final customer = await _customerRepo.findById(customerId);
    if (customer == null) {
      throw NotFoundException('العميل غير موجود');
    }

    final alert = Alert(
      id: 0,
      customerId: customerId,
      alertType: type,
      message: message,
      alertDate: DateTime.now(),
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await _alertRepo.insert(alert);
  }

  /// Delete old alerts
  Future<int> deleteOldAlerts(int days) async {
    return await _alertRepo.deleteOld(days);
  }

  /// Get alert count
  Future<int> getActiveAlertCount() async {
    return await _alertRepo.countActive();
  }

  /// Get alert count for customer
  Future<int> getActiveAlertCountForCustomer(int customerId) async {
    return await _alertRepo.countActiveForCustomer(customerId);
  }

  /// Start background checking
  void startBackgroundCheck({
    Duration interval = const Duration(hours: 1),
  }) {
    stopBackgroundCheck();
    _backgroundTimer = Timer.periodic(interval, (_) async {
      await checkStuckStages();
      await checkUpcomingInspections();
    });
  }

  /// Stop background checking
  void stopBackgroundCheck() {
    _backgroundTimer?.cancel();
    _backgroundTimer = null;
  }

  /// Dispose resources
  void dispose() {
    stopBackgroundCheck();
  }

  /// Get alert type display name (Arabic)
  String getAlertTypeDisplayName(String type) {
    const types = {
      typeStuckStage: 'مرحلة متوقفة',
      typeUpcomingInspection: 'معاينة قادمة',
      typePendingPayment: 'دفعة متأخرة',
      typeCustom: 'تنبيه',
    };
    return types[type] ?? type;
  }
}
