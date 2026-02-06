import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/stage_history.dart';

class StageHistoryRepository extends BaseRepository<StageHistory> {
  final DatabaseService _db = DatabaseService.instance;

  @override
  String get tableName => 'stage_history';

  @override
  StageHistory fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    return StageHistory.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(StageHistory history) {
    final map = history.toJson();
    map.remove('id');
    map.remove('created_at');
    return map;
  }

  /// Find history by customer ID
  Future<List<StageHistory>> findByCustomerId(int customerId) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE customer_id = @customerId
      ORDER BY started_at DESC
    ''';

    final result = await _db.query(
      sql,
      parameters: {'customerId': customerId},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find by stage name
  Future<List<StageHistory>> findByStage(String stageName) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE stage_name = @stageName
      ORDER BY started_at DESC
    ''';

    final result = await _db.query(
      sql,
      parameters: {'stageName': stageName},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Get average duration for a stage (in days)
  Future<double> getAverageDuration(String stageName) async {
    final sql = '''
      SELECT AVG(duration_days)
      FROM $tableName
      WHERE stage_name = @stageName
        AND duration_days IS NOT NULL
    ''';

    final result = await _db.query(
      sql,
      parameters: {'stageName': stageName},
    );

    final avg = result.first[0];
    if (avg == null) return 0.0;

    return (avg as num).toDouble();
  }

  /// Get all stage statistics
  Future<Map<String, double>> getAllAverageDurations() async {
    final sql = '''
      SELECT stage_name, AVG(duration_days) as avg_duration
      FROM $tableName
      WHERE duration_days IS NOT NULL
      GROUP BY stage_name
      ORDER BY stage_name
    ''';

    final result = await _db.query(sql);
    final rows = resultToList(result);

    final stats = <String, double>{};
    for (final row in rows) {
      final name = row['stage_name'] as String?;
      final avg = row['avg_duration'];
      if (name != null && avg != null) {
        stats[name] = (avg as num).toDouble();
      }
    }

    return stats;
  }

  /// Find in-progress stages
  Future<List<StageHistory>> findInProgress() async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE started_at IS NOT NULL
        AND completed_at IS NULL
      ORDER BY started_at
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Complete a stage
  Future<bool> completeStage({
    required int historyId,
    required int durationDays,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET completed_at = NOW(),
          duration_days = @durationDays
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': historyId, 'durationDays': durationDays},
    );

    return result.affectedRows > 0;
  }

  /// Start a new stage for customer
  Future<int> startStage({
    required int customerId,
    required String stageName,
  }) async {
    final sql = '''
      INSERT INTO $tableName (customer_id, stage_name, started_at, created_at)
      VALUES (@customerId, @stageName, NOW(), NOW())
      RETURNING id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'customerId': customerId, 'stageName': stageName},
    );

    return result.first[0] as int;
  }
}
