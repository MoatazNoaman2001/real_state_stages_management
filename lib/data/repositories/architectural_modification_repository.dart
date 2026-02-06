import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/architectural_modification.dart';

class ArchitecturalModificationRepository
    extends BaseRepository<ArchitecturalModification> {
  final DatabaseService _db = DatabaseService.instance;

  // All 10 step names in order
  static const List<String> stepNames = [
    'draw_boards',            // 1
    'field_inspection',       // 2
    'draw_modifications',     // 3
    'submit_request',         // 4
    'request_number',         // 5 (string field)
    'inspection',             // 6 (date field + money field)
    'inspection_from_agency', // 7
    'review_with_agency',     // 8
    'approve_boards',         // 9
    'give_copy_to_owner',     // 10
  ];

  // Steps with boolean + date fields
  static const List<String> stepsWithDate = [
    'draw_boards',
    'field_inspection',
    'draw_modifications',
    'submit_request',
    'inspection_from_agency',
    'review_with_agency',
    'approve_boards',
    'give_copy_to_owner',
  ];

  // Arabic display names
  static const Map<String, String> stepDisplayNames = {
    'draw_boards': 'رسم اللوحات',
    'field_inspection': 'المعاينة علي الطبيعة',
    'draw_modifications': 'رسم التعديلات المعمارية',
    'submit_request': 'تقديم الطلب',
    'request_number': 'رقم الطلب',
    'inspection': 'ميعاد المعاينة من الجهاز',
    'inspection_from_agency': 'المعاينة من الجهاز',
    'review_with_agency': 'مراجعة مع الجهاز',
    'approve_boards': 'اعتماد اللوحات',
    'give_copy_to_owner': 'إعطاء النسخة للمالك',
  };

  @override
  String get tableName => 'architectural_modifications';

  @override
  ArchitecturalModification fromMap(Map<String, dynamic> map) {
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

    return ArchitecturalModification.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(ArchitecturalModification modification) {
    final map = modification.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find by customer ID
  Future<ArchitecturalModification?> findByCustomerId(int customerId) async {
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
    required int modificationId,
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
      parameters: {'id': modificationId, 'value': value},
    );

    return result.affectedRows > 0;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int modificationId,
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
      parameters: {'id': modificationId, 'notes': notes},
    );

    return result.affectedRows > 0;
  }

  /// Update request number (step 5)
  Future<bool> updateRequestNumber({
    required int modificationId,
    required String? requestNumber,
  }) async {
    final sql = '''
      UPDATE $tableName
      SET request_number = @requestNumber,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': modificationId, 'requestNumber': requestNumber},
    );

    return result.affectedRows > 0;
  }

  /// Update inspection date (step 6)
  Future<bool> updateInspectionDate({
    required int modificationId,
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
      parameters: {'id': modificationId, 'inspectionDate': inspectionDate},
    );

    return result.affectedRows > 0;
  }

  /// Update inspection amount (step 6)
  Future<bool> updateInspectionAmount({
    required int modificationId,
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
      parameters: {'id': modificationId, 'amount': amount},
    );

    return result.affectedRows > 0;
  }

  /// Find by inspection date
  Future<List<ArchitecturalModification>> findByInspectionDate(
    DateTime date,
  ) async {
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
    final modification = await findById(id);
    if (modification == null) return 0.0;
    return modification.progress;
  }

  /// Get list of completed step names
  Future<List<String>> getCompletedSteps(int id) async {
    final modification = await findById(id);
    if (modification == null) return [];

    final completed = <String>[];
    final json = modification.toJson();

    for (final step in stepNames) {
      if (step == 'request_number') {
        final value = json[step] as String?;
        if (value != null && value.isNotEmpty) {
          completed.add(step);
        }
      } else if (step == 'inspection') {
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
    final modification = await findById(id);
    if (modification == null) return stepNames;

    final pending = <String>[];
    final json = modification.toJson();

    for (final step in stepNames) {
      if (step == 'request_number') {
        final value = json[step] as String?;
        if (value == null || value.isEmpty) {
          pending.add(step);
        }
      } else if (step == 'inspection') {
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
  Future<List<ArchitecturalModification>> findByCompletionStatus({
    required bool isComplete,
  }) async {
    final all = await findAll();
    return all.where((m) => m.isComplete == isComplete).toList();
  }
}
