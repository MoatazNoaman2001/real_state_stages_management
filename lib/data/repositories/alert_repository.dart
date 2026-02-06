import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/alert.dart';

class AlertRepository extends BaseRepository<Alert> {
  final DatabaseService _db = DatabaseService.instance;

  @override
  String get tableName => 'alerts';

  @override
  Alert fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    return Alert.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(Alert alert) {
    final map = alert.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find alerts by customer ID
  Future<List<Alert>> findByCustomerId(int customerId) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE customer_id = @customerId
      ORDER BY alert_date DESC
    ''';

    final result = await _db.query(
      sql,
      parameters: {'customerId': customerId},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find all active alerts
  Future<List<Alert>> findActive() async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE is_active = true
      ORDER BY alert_date DESC
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Mark alert as read (set is_active = false)
  Future<bool> markAsRead(int id) async {
    final sql = '''
      UPDATE $tableName
      SET is_active = false,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(sql, parameters: {'id': id});
    return result.affectedRows > 0;
  }

  /// Update alert status (active/inactive)
  Future<bool> updateStatus(int id, bool isActive) async {
    final sql = '''
      UPDATE $tableName
      SET is_active = @isActive,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': id, 'isActive': isActive},
    );
    return result.affectedRows > 0;
  }

  /// Update alert date
  Future<bool> updateAlertDate(int id, DateTime? alertDate) async {
    final sql = '''
      UPDATE $tableName
      SET alert_date = @alertDate,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': id, 'alertDate': alertDate},
    );
    return result.affectedRows > 0;
  }

  /// Mark all customer alerts as read
  Future<int> markAllAsRead(int customerId) async {
    final sql = '''
      UPDATE $tableName
      SET is_active = false,
          updated_at = NOW()
      WHERE customer_id = @customerId
        AND is_active = true
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'customerId': customerId},
    );
    return result.affectedRows;
  }

  /// Delete alerts older than N days
  Future<int> deleteOld(int days) async {
    final sql = '''
      DELETE FROM $tableName
      WHERE created_at < NOW() - INTERVAL '$days days'
    ''';

    final result = await _db.execute(sql);
    return result.affectedRows;
  }

  /// Find alerts by type
  Future<List<Alert>> findByType(String alertType) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE alert_type = @alertType
      ORDER BY alert_date DESC
    ''';

    final result = await _db.query(
      sql,
      parameters: {'alertType': alertType},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Count active alerts
  Future<int> countActive() async {
    final sql = '''
      SELECT COUNT(*) FROM $tableName
      WHERE is_active = true
    ''';

    final result = await _db.query(sql);
    return result.first[0] as int;
  }

  /// Count active alerts for customer
  Future<int> countActiveForCustomer(int customerId) async {
    final sql = '''
      SELECT COUNT(*) FROM $tableName
      WHERE customer_id = @customerId
        AND is_active = true
    ''';

    final result = await _db.query(
      sql,
      parameters: {'customerId': customerId},
    );
    return result.first[0] as int;
  }
}
