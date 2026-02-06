import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/inspection.dart';

class InspectionRepository extends BaseRepository<Inspection> {
  final DatabaseService _db = DatabaseService.instance;

  @override
  String get tableName => 'inspections';

  @override
  Inspection fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    return Inspection.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(Inspection inspection) {
    final map = inspection.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find inspections by customer ID
  Future<List<Inspection>> findByCustomerId(int customerId) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE customer_id = @customerId
      ORDER BY inspection_date DESC
    ''';

    final result = await _db.query(
      sql,
      parameters: {'customerId': customerId},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find inspections by date
  Future<List<Inspection>> findByDate(DateTime date) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE DATE(inspection_date) = DATE(@date)
      ORDER BY inspection_date
    ''';

    final result = await _db.query(
      sql,
      parameters: {'date': date},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find inspections by status
  Future<List<Inspection>> findByStatus(String status) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE status = @status
      ORDER BY inspection_date
    ''';

    final result = await _db.query(
      sql,
      parameters: {'status': status},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find upcoming inspections in the next N days
  Future<List<Inspection>> findUpcoming(int days) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE inspection_date BETWEEN NOW() AND NOW() + INTERVAL '$days days'
        AND status = 'pending'
      ORDER BY inspection_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find today's inspections
  Future<List<Inspection>> findToday() async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE DATE(inspection_date) = CURRENT_DATE
      ORDER BY inspection_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Update inspection status
  Future<bool> updateStatus({
    required int inspectionId,
    required String status,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET status = @status,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': inspectionId, 'status': status},
    );

    return result.affectedRows > 0;
  }

  /// Mark inspection as completed
  Future<bool> markAsCompleted(int inspectionId) async {
    return updateStatus(inspectionId: inspectionId, status: 'completed');
  }

  /// Mark inspection as cancelled
  Future<bool> markAsCancelled(int inspectionId) async {
    return updateStatus(inspectionId: inspectionId, status: 'cancelled');
  }

  /// Count inspections by status
  Future<Map<String, int>> countByStatus() async {
    final sql = '''
      SELECT status, COUNT(*) as count
      FROM $tableName
      GROUP BY status
    ''';

    final result = await _db.query(sql);
    final rows = resultToList(result);

    final counts = <String, int>{};
    for (final row in rows) {
      counts[row['status'] as String] = row['count'] as int;
    }

    return counts;
  }
}
