import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/road_work.dart';

class RoadWorkRepository extends BaseRepository<RoadWork> {
  final DatabaseService _db = DatabaseService.instance;

  // All 2 step names in order
  static const List<String> stepNames = [
    'submit_request', // 1
    'supply',         // 2 (has money field)
  ];

  // Arabic display names
  static const Map<String, String> stepDisplayNames = {
    'submit_request': 'تقديم الطلب',
    'supply': 'التوريد',
  };

  @override
  String get tableName => 'road_works';

  @override
  RoadWork fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    // Convert string amounts to double
    if (processedMap['supply_amount'] != null && processedMap['supply_amount'] is String) {
      processedMap['supply_amount'] = double.tryParse(processedMap['supply_amount'] as String);
    }

    return RoadWork.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(RoadWork roadWork) {
    final map = roadWork.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find by customer ID
  Future<RoadWork?> findByCustomerId(int customerId) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE customer_id = @customerId
    ''';

    final result = await _db.query(
      sql,
      parameters: {'customerId': customerId},
    );

    if (result.isEmpty) return null;

    final rows = resultToList(result);
    return fromMap(rows.first);
  }

  /// Update a specific step with auto-timestamp
  Future<bool> updateStep({
    required int roadWorkId,
    required String stepName,
    required bool value,
  }) async {
    if (!stepNames.contains(stepName)) {
      throw ArgumentError('Invalid step name: $stepName');
    }

    final dateColumn = '${stepName}_date';
    final sql = '''
      UPDATE $tableName
      SET $stepName = @value,
          $dateColumn = CASE WHEN @value THEN NOW() ELSE NULL END,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': roadWorkId, 'value': value},
    );

    return result.affectedRows > 0;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int roadWorkId,
    required String stepName,
    required String? notes,
  }) async {
    if (!stepNames.contains(stepName)) {
      throw ArgumentError('Invalid step name: $stepName');
    }

    final notesColumn = '${stepName}_notes';
    final sql = '''
      UPDATE $tableName
      SET $notesColumn = @notes,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': roadWorkId, 'notes': notes},
    );

    return result.affectedRows > 0;
  }

  /// Update supply amount
  Future<bool> updateSupplyAmount({
    required int roadWorkId,
    required double? amount,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET supply_amount = @amount,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': roadWorkId, 'amount': amount},
    );

    return result.affectedRows > 0;
  }

  /// Update renewal alert enabled status
  Future<bool> updateRenewalAlert({
    required int roadWorkId,
    required bool enabled,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET renewal_alert_enabled = @enabled,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': roadWorkId, 'enabled': enabled},
    );

    return result.affectedRows > 0;
  }

  /// Update renewal date
  Future<bool> updateRenewalDate({
    required int roadWorkId,
    required DateTime? renewalDate,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET renewal_date = @renewalDate,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': roadWorkId, 'renewalDate': renewalDate},
    );

    return result.affectedRows > 0;
  }

  /// Update both renewal date and alert
  Future<bool> updateRenewalDateAndAlert({
    required int roadWorkId,
    required DateTime? renewalDate,
    required bool alertEnabled,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET renewal_date = @renewalDate,
          renewal_alert_enabled = @alertEnabled,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {
        'id': roadWorkId,
        'renewalDate': renewalDate,
        'alertEnabled': alertEnabled,
      },
    );

    return result.affectedRows > 0;
  }

  /// Get all road works with renewal alerts enabled
  Future<List<RoadWork>> findWithRenewalAlerts() async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE renewal_alert_enabled = TRUE
      AND renewal_date IS NOT NULL
      ORDER BY renewal_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Get road works with upcoming renewal (within days)
  Future<List<RoadWork>> findWithUpcomingRenewal({int days = 7}) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE renewal_alert_enabled = TRUE
      AND renewal_date IS NOT NULL
      AND renewal_date <= NOW() + INTERVAL '$days days'
      AND renewal_date >= NOW()
      ORDER BY renewal_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Get overdue road works (renewal date passed)
  Future<List<RoadWork>> findOverdueRenewals() async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE renewal_alert_enabled = TRUE
      AND renewal_date IS NOT NULL
      AND renewal_date < NOW()
      ORDER BY renewal_date
    ''';

    final result = await _db.query(sql);

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Get progress percentage
  Future<double> getProgress(int id) async {
    final roadWork = await findById(id);
    if (roadWork == null) return 0.0;
    return roadWork.progress;
  }

  /// Get list of completed step names
  Future<List<String>> getCompletedSteps(int id) async {
    final roadWork = await findById(id);
    if (roadWork == null) return [];

    final completed = <String>[];
    final json = roadWork.toJson();

    for (final step in stepNames) {
      if (json[step] == true) {
        completed.add(step);
      }
    }

    return completed;
  }

  /// Get list of pending step names
  Future<List<String>> getPendingSteps(int id) async {
    final roadWork = await findById(id);
    if (roadWork == null) return stepNames;

    final pending = <String>[];
    final json = roadWork.toJson();

    for (final step in stepNames) {
      if (json[step] != true) {
        pending.add(step);
      }
    }

    return pending;
  }

  /// Get step display name in Arabic
  String getStepDisplayName(String stepName) {
    return stepDisplayNames[stepName] ?? stepName;
  }

  /// Find by completion status
  Future<List<RoadWork>> findByCompletionStatus({
    required bool isComplete,
  }) async {
    final all = await findAll();
    return all.where((r) => r.isComplete == isComplete).toList();
  }
}
