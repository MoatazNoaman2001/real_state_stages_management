import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/scheduled_alert.dart';

class ScheduledAlertRepository extends BaseRepository<ScheduledAlert> {
  final DatabaseService _db = DatabaseService.instance;

  @override
  String get tableName => 'scheduled_alerts';

  @override
  ScheduledAlert fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    return ScheduledAlert.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(ScheduledAlert alert) {
    final map = alert.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');

    // Convert enum to string
    if (map['repeat_type'] is RepeatType) {
      map['repeat_type'] = (map['repeat_type'] as RepeatType).name;
    }

    return map;
  }

  /// Find alerts by customer ID
  Future<List<ScheduledAlert>> findByCustomerId(int customerId) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE customer_id = @customerId
      ORDER BY alert_date
    ''';

    final result = await _db.query(
      sql,
      parameters: {'customerId': customerId},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find active alerts
  Future<List<ScheduledAlert>> findActiveAlerts() async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE is_active = TRUE
      ORDER BY alert_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find due alerts (alert_date <= now and not triggered)
  Future<List<ScheduledAlert>> findDueAlerts() async {
    // Get current time for comparison
    final now = DateTime.now();
    print('[ScheduledAlertRepository] Finding due alerts. Current time: $now');

    final sql = '''
      SELECT * FROM $tableName
      WHERE is_active = TRUE
      AND is_triggered = FALSE
      AND alert_date <= @now
      ORDER BY alert_date
    ''';

    final result = await _db.query(sql, parameters: {'now': now});

    if (result.isEmpty) {
      print('[ScheduledAlertRepository] No due alerts found');
      return [];
    }

    final rows = resultToList(result);
    final alerts = rows.map((row) => fromMap(row)).toList();
    print('[ScheduledAlertRepository] Found ${alerts.length} due alerts');
    for (final alert in alerts) {
      print('[ScheduledAlertRepository]   - Alert ${alert.id}: "${alert.title}" scheduled for ${alert.alertDate}');
    }
    return alerts;
  }

  /// Find upcoming alerts (within specified days)
  Future<List<ScheduledAlert>> findUpcomingAlerts({int days = 7}) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE is_active = TRUE
      AND alert_date > NOW()
      AND alert_date <= NOW() + INTERVAL '$days days'
      ORDER BY alert_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find alerts for today
  Future<List<ScheduledAlert>> findTodayAlerts() async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE is_active = TRUE
      AND DATE(alert_date) = CURRENT_DATE
      ORDER BY alert_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find alerts by related entity
  Future<List<ScheduledAlert>> findByRelatedEntity({
    required String tableName,
    required int relatedId,
  }) async {
    final sql = '''
      SELECT * FROM ${this.tableName}
      WHERE related_table = @tableName
      AND related_id = @relatedId
      ORDER BY alert_date
    ''';

    final result = await _db.query(
      sql,
      parameters: {'tableName': tableName, 'relatedId': relatedId},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Mark alert as triggered
  Future<bool> markAsTriggered(int alertId) async {
    final sql = '''
      UPDATE $tableName
      SET is_triggered = TRUE,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': alertId},
    );

    return result.affectedRows > 0;
  }

  /// Mark alert as active/inactive
  Future<bool> setActive({
    required int alertId,
    required bool isActive,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET is_active = @isActive,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': alertId, 'isActive': isActive},
    );

    return result.affectedRows > 0;
  }

  /// Reset triggered status (for repeating alerts)
  Future<bool> resetTriggered(int alertId) async {
    final sql = '''
      UPDATE $tableName
      SET is_triggered = FALSE,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': alertId},
    );

    return result.affectedRows > 0;
  }

  /// Update alert date (for rescheduling)
  Future<bool> updateAlertDate({
    required int alertId,
    required DateTime newDate,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET alert_date = @newDate,
          is_triggered = FALSE,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': alertId, 'newDate': newDate},
    );

    return result.affectedRows > 0;
  }

  /// Reschedule repeating alert to next occurrence
  Future<bool> rescheduleRepeatingAlert(int alertId) async {
    final alert = await findById(alertId);
    if (alert == null || alert.repeatType == RepeatType.once) return false;

    final nextDate = alert.nextAlertDate;
    if (nextDate == null) return false;

    return updateAlertDate(alertId: alertId, newDate: nextDate);
  }

  /// Delete old triggered alerts (cleanup)
  Future<int> deleteOldTriggeredAlerts({int daysOld = 30}) async {
    final sql = '''
      DELETE FROM $tableName
      WHERE is_triggered = TRUE
      AND repeat_type = 'once'
      AND alert_date < NOW() - INTERVAL '$daysOld days'
    ''';

    final result = await _db.execute(sql);
    return result.affectedRows;
  }

  /// Count active alerts
  Future<int> countActiveAlerts() async {
    final sql = '''
      SELECT COUNT(*) as count FROM $tableName
      WHERE is_active = TRUE
    ''';

    final result = await _db.query(sql);
    if (result.isEmpty) return 0;

    final rows = resultToList(result);
    return rows.first['count'] as int? ?? 0;
  }

  /// Count due alerts
  Future<int> countDueAlerts() async {
    final sql = '''
      SELECT COUNT(*) as count FROM $tableName
      WHERE is_active = TRUE
      AND is_triggered = FALSE
      AND alert_date <= NOW()
    ''';

    final result = await _db.query(sql);
    if (result.isEmpty) return 0;

    final rows = resultToList(result);
    return rows.first['count'] as int? ?? 0;
  }
}
