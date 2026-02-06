import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../data/repositories/scheduled_alert_repository.dart';
import '../../data/repositories/road_work_repository.dart';
import '../models/scheduled_alert.dart';

class NotificationService {
  final ScheduledAlertRepository _scheduledAlertRepository;
  final RoadWorkRepository _roadWorkRepository;
  final FlutterLocalNotificationsPlugin _notificationsPlugin;

  Timer? _checkTimer;
  bool _isInitialized = false;

  static const String _channelId = 'real_estate_alerts';
  static const String _channelName = 'تنبيهات المشاريع';
  static const String _channelDescription = 'تنبيهات نظام إدارة المشاريع العقارية';

  NotificationService(
    this._scheduledAlertRepository,
    this._roadWorkRepository,
  ) : _notificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Check if the service is initialized
  bool get isInitialized => _isInitialized;

  /// Initialize the notification service
  Future<void> initialize() async {
    if (_isInitialized) {
      print('NotificationService already initialized');
      return;
    }

    try {
      // Android initialization settings
      const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

      // iOS/macOS initialization settings
      const darwinSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      // Linux initialization settings
      const linuxSettings = LinuxInitializationSettings(
        defaultActionName: 'Open notification',
      );

      // Windows initialization settings
      const windowsSettings = WindowsInitializationSettings(
        appName: 'Real Estate Management',
        appUserModelId: 'com.realstate.management',
        guid: 'a8c5c1f8-8e2c-4b3d-9f1e-3d4c5b6a7e8f',
      );

      const initSettings = InitializationSettings(
        android: androidSettings,
        iOS: darwinSettings,
        macOS: darwinSettings,
        linux: linuxSettings,
        windows: windowsSettings,
      );

      final initialized = await _notificationsPlugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: _onNotificationTapped,
      );

      if (initialized == false) {
        throw Exception('Failed to initialize flutter_local_notifications');
      }

      // Create notification channel for Android
      await _createNotificationChannel();

      // Mark as initialized
      _isInitialized = true;

      // Start periodic check for alerts
      _startAlertChecker();

      print('✓ NotificationService initialized successfully');
    } catch (e) {
      print('✗ NotificationService initialization failed: $e');
      rethrow;
    }
  }

  /// Create notification channel (Android)
  Future<void> _createNotificationChannel() async {
    const androidChannel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    // Handle notification tap - can navigate to specific screen
    // based on payload
    final payload = response.payload;
    if (payload != null) {
      // Parse payload and navigate
      // Format: "type:id" e.g., "scheduled_alert:123" or "road_work:456"
    }
  }

  /// Start periodic check for due alerts
  void _startAlertChecker() {
    // Check every minute
    _checkTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _checkAndTriggerAlerts(),
    );

    // Also check immediately on start
    _checkAndTriggerAlerts();
  }

  /// Stop the alert checker
  void stopAlertChecker() {
    _checkTimer?.cancel();
    _checkTimer = null;
  }

  /// Manually trigger alert check (useful for testing)
  Future<int> triggerAlertCheckNow() async {
    print('[NotificationService] Manual alert check triggered');
    await _checkAndTriggerAlerts();
    final dueCount = await _scheduledAlertRepository.countDueAlerts();
    return dueCount;
  }

  /// Check for due alerts and trigger notifications
  Future<void> _checkAndTriggerAlerts() async {
    try {
      print('[NotificationService] Checking for due alerts at ${DateTime.now()}');

      // Check scheduled alerts
      await _checkScheduledAlerts();

      // Check road work renewals
      await _checkRoadWorkRenewals();
    } catch (e, stackTrace) {
      // Log error but don't crash
      print('[NotificationService] Error checking alerts: $e');
      print('[NotificationService] Stack trace: $stackTrace');
    }
  }

  /// Check and trigger scheduled alerts
  Future<void> _checkScheduledAlerts() async {
    final dueAlerts = await _scheduledAlertRepository.findDueAlerts();
    print('[NotificationService] Found ${dueAlerts.length} due alerts');

    for (final alert in dueAlerts) {
      print('[NotificationService] Triggering alert: ${alert.title} (ID: ${alert.id}, scheduled for: ${alert.alertDate})');

      try {
        await showNotification(
          id: alert.id,
          title: alert.title,
          body: alert.message ?? '',
          payload: 'scheduled_alert:${alert.id}',
        );
        print('[NotificationService] ✓ Notification shown for alert ${alert.id}');

        // Mark as triggered
        await _scheduledAlertRepository.markAsTriggered(alert.id);
        print('[NotificationService] ✓ Alert ${alert.id} marked as triggered');

        // If repeating, reschedule
        if (alert.repeatType != RepeatType.once) {
          await _scheduledAlertRepository.rescheduleRepeatingAlert(alert.id);
          print('[NotificationService] ✓ Alert ${alert.id} rescheduled');
        }
      } catch (e) {
        print('[NotificationService] ✗ Error processing alert ${alert.id}: $e');
      }
    }
  }

  /// Check and trigger road work renewal alerts
  Future<void> _checkRoadWorkRenewals() async {
    // Get overdue renewals
    final overdueRenewals = await _roadWorkRepository.findOverdueRenewals();

    for (final roadWork in overdueRenewals) {
      await showNotification(
        id: 10000 + roadWork.id, // Offset to avoid ID collision
        title: 'تنبيه تجديد إشغال الطريق',
        body: 'موعد التجديد لعميل رقم ${roadWork.customerId} قد انتهى',
        payload: 'road_work:${roadWork.id}',
      );
    }

    // Get upcoming renewals (within 7 days)
    final upcomingRenewals = await _roadWorkRepository.findWithUpcomingRenewal(days: 7);

    for (final roadWork in upcomingRenewals) {
      final daysLeft = roadWork.daysUntilRenewal ?? 0;
      await showNotification(
        id: 20000 + roadWork.id, // Offset to avoid ID collision
        title: 'تذكير تجديد إشغال الطريق',
        body: 'باقي $daysLeft أيام على موعد التجديد لعميل رقم ${roadWork.customerId}',
        payload: 'road_work:${roadWork.id}',
      );
    }
  }

  /// Show a notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    if (!_isInitialized) {
      throw Exception('NotificationService must be initialized first. Call initialize() before showing notifications.');
    }

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const linuxDetails = LinuxNotificationDetails();

    const windowsDetails = WindowsNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
      linux: linuxDetails,
      windows: windowsDetails,
    );

    await _notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  /// Schedule a notification for a specific time
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const linuxDetails = LinuxNotificationDetails();

    const windowsDetails = WindowsNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
      macOS: darwinDetails,
      linux: linuxDetails,
      windows: windowsDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _convertToTZDateTime(scheduledTime),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  /// Convert DateTime to TZDateTime (simplified - uses local timezone)
  dynamic _convertToTZDateTime(DateTime dateTime) {
    // For simplicity, we use the basic approach
    // In production, you'd want to use timezone package properly
    return dateTime;
  }

  /// Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notificationsPlugin.pendingNotificationRequests();
  }

  /// Create alert for a customer
  Future<ScheduledAlert> createAlert({
    required int customerId,
    required String title,
    String? message,
    required DateTime alertDate,
    RepeatType repeatType = RepeatType.once,
    String? relatedTable,
    int? relatedId,
  }) async {
    final alert = ScheduledAlert(
      id: 0, // Will be set by database
      customerId: customerId,
      title: title,
      message: message,
      alertDate: alertDate,
      repeatType: repeatType,
      relatedTable: relatedTable,
      relatedId: relatedId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final id = await _scheduledAlertRepository.insert(alert);
    return alert.copyWith(id: id);
  }

  /// Get all alerts for a customer
  Future<List<ScheduledAlert>> getCustomerAlerts(int customerId) async {
    return await _scheduledAlertRepository.findByCustomerId(customerId);
  }

  /// Get all upcoming alerts
  Future<List<ScheduledAlert>> getUpcomingAlerts({int days = 7}) async {
    return await _scheduledAlertRepository.findUpcomingAlerts(days: days);
  }

  /// Get today's alerts
  Future<List<ScheduledAlert>> getTodayAlerts() async {
    return await _scheduledAlertRepository.findTodayAlerts();
  }

  /// Delete an alert
  Future<bool> deleteAlert(int alertId) async {
    await cancelNotification(alertId);
    return await _scheduledAlertRepository.delete(alertId);
  }

  /// Dispose resources
  void dispose() {
    stopAlertChecker();
  }
}
