import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/rooftop_addition.dart';

class RooftopAdditionRepository extends BaseRepository<RooftopAddition> {
  final DatabaseService _db = DatabaseService.instance;

  // All 9 step names in order
  static const List<String> stepNames = [
    'submit_request',         // 1
    'pay_inspection',         // 2 (has money field)
    'inspection',             // 3 (date only)
    'review_with_agency',     // 4
    'print_letters',          // 5 (NEW)
    'supply',                 // 6 (has money field)
    'initial_contract',       // 7
    'supplementary_contract', // 8
    'then_to_license',        // 9
  ];

  // Steps with boolean + date fields
  static const List<String> stepsWithDate = [
    'submit_request',
    'pay_inspection',
    'review_with_agency',
    'print_letters',
    'supply',
    'initial_contract',
    'supplementary_contract',
    'then_to_license',
  ];

  // Arabic display names
  static const Map<String, String> stepDisplayNames = {
    'submit_request': 'التقديم علي الطلب',
    'pay_inspection': 'سداد المعاينة',
    'inspection': 'ميعاد المعاينة',
    'review_with_agency': 'مراجعة مع الجهاز',
    'print_letters': 'طباعة الجوابات',
    'supply': 'التوريد',
    'initial_contract': 'العقد الابتدائي',
    'supplementary_contract': 'العقد الملحق',
    'then_to_license': 'وتروح بعدها للترخيص',
  };

  @override
  String get tableName => 'rooftop_additions';

  @override
  RooftopAddition fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    // Convert string amounts to double
    if (processedMap['inspection_amount'] != null && processedMap['inspection_amount'] is String) {
      processedMap['inspection_amount'] = double.tryParse(processedMap['inspection_amount'] as String);
    }
    if (processedMap['supply_amount'] != null && processedMap['supply_amount'] is String) {
      processedMap['supply_amount'] = double.tryParse(processedMap['supply_amount'] as String);
    }

    return RooftopAddition.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(RooftopAddition addition) {
    final map = addition.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find by customer ID
  Future<RooftopAddition?> findByCustomerId(int customerId) async {
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
    required int additionId,
    required String stepName,
    required bool value,
  }) async {
    if (!stepsWithDate.contains(stepName)) {
      throw ArgumentError('Invalid step name or step does not have boolean: $stepName');
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
      parameters: {'id': additionId, 'value': value},
    );

    return result.affectedRows > 0;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int additionId,
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
      parameters: {'id': additionId, 'notes': notes},
    );

    return result.affectedRows > 0;
  }

  /// Update inspection date (step 3)
  Future<bool> updateInspectionDate({
    required int additionId,
    required DateTime? inspectionDate,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET inspection_date = @inspectionDate,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': additionId, 'inspectionDate': inspectionDate},
    );

    return result.affectedRows > 0;
  }

  /// Update inspection amount (pay_inspection step)
  Future<bool> updateInspectionAmount({
    required int additionId,
    required double? amount,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET inspection_amount = @amount,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': additionId, 'amount': amount},
    );

    return result.affectedRows > 0;
  }

  /// Update supply amount
  Future<bool> updateSupplyAmount({
    required int additionId,
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
      parameters: {'id': additionId, 'amount': amount},
    );

    return result.affectedRows > 0;
  }

  /// Find by inspection date
  Future<List<RooftopAddition>> findByInspectionDate(DateTime date) async {
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

  /// Get progress percentage
  Future<double> getProgress(int id) async {
    final addition = await findById(id);
    if (addition == null) return 0.0;
    return addition.progress;
  }

  /// Get list of completed step names
  Future<List<String>> getCompletedSteps(int id) async {
    final addition = await findById(id);
    if (addition == null) return [];

    final completed = <String>[];
    final json = addition.toJson();

    for (final step in stepNames) {
      if (step == 'inspection') {
        if (json['inspection_date'] != null) {
          completed.add(step);
        }
      } else {
        if (json[step] == true) {
          completed.add(step);
        }
      }
    }

    return completed;
  }

  /// Get list of pending step names
  Future<List<String>> getPendingSteps(int id) async {
    final addition = await findById(id);
    if (addition == null) return stepNames;

    final pending = <String>[];
    final json = addition.toJson();

    for (final step in stepNames) {
      if (step == 'inspection') {
        if (json['inspection_date'] == null) {
          pending.add(step);
        }
      } else {
        if (json[step] != true) {
          pending.add(step);
        }
      }
    }

    return pending;
  }

  /// Get step display name in Arabic
  String getStepDisplayName(String stepName) {
    return stepDisplayNames[stepName] ?? stepName;
  }

  /// Find by completion status
  Future<List<RooftopAddition>> findByCompletionStatus({
    required bool isComplete,
  }) async {
    final all = await findAll();
    return all.where((a) => a.isComplete == isComplete).toList();
  }
}
