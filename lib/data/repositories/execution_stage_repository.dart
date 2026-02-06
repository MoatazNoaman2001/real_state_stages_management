import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/execution_stage.dart';

class ExecutionStageRepository extends BaseRepository<ExecutionStage> {
  final DatabaseService _db = DatabaseService.instance;

  // All 20 step names in order
  static const List<String> stepNames = [
    'survey_1',            // 1 - مساحة
    'excavation',          // 2 - حفر
    'replacement',         // 3 - إحلال
    'survey_2',            // 4 - مساحة
    'plain_concrete',      // 5 - خرسانة عادية
    'reinforced_concrete', // 6 - خرسانة مسلحة
    'basement_columns',    // 7 - أعمدة البدروم
    'basement_ceiling',    // 8 - سقف البدروم
    'ground_columns',      // 9 - أعمدة الارضي
    'ground_ceiling',      // 10 - سقف الارضي
    'first_columns',       // 11 - أعمدة الأول علوي
    'first_ceiling',       // 12 - سقف الأول علوي
    'second_columns',      // 13 - أعمدة الثاني علوي
    'second_ceiling',      // 14 - سقف الثاني علوي
    'third_columns',       // 15 - أعمدة الثالث علوي
    'third_ceiling',       // 16 - سقف الثالث علوي
    'fourth_columns',      // 17 - أعمدة الرابع علوي
    'fourth_ceiling',      // 18 - سقف الرابع علوي
    'fifth_columns',       // 19 - أعمدة الخامس علوي
    'fifth_ceiling',       // 20 - سقف الخامس علوي
  ];

  // Arabic display names
  static const Map<String, String> stepDisplayNames = {
    'survey_1': 'مساحة',
    'excavation': 'حفر',
    'replacement': 'إحلال',
    'survey_2': 'مساحة',
    'plain_concrete': 'خرسانة عادية',
    'reinforced_concrete': 'خرسانة مسلحة',
    'basement_columns': 'أعمدة البدروم',
    'basement_ceiling': 'سقف البدروم',
    'ground_columns': 'أعمدة الارضي',
    'ground_ceiling': 'سقف الارضي',
    'first_columns': 'أعمدة الأول علوي',
    'first_ceiling': 'سقف الأول علوي',
    'second_columns': 'أعمدة الثاني علوي',
    'second_ceiling': 'سقف الثاني علوي',
    'third_columns': 'أعمدة الثالث علوي',
    'third_ceiling': 'سقف الثالث علوي',
    'fourth_columns': 'أعمدة الرابع علوي',
    'fourth_ceiling': 'سقف الرابع علوي',
    'fifth_columns': 'أعمدة الخامس علوي',
    'fifth_ceiling': 'سقف الخامس علوي',
  };

  @override
  String get tableName => 'execution_stages';

  @override
  ExecutionStage fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    return ExecutionStage.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(ExecutionStage stage) {
    final map = stage.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find execution stage by customer ID
  Future<ExecutionStage?> findByCustomerId(int customerId) async {
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

  /// Get progress percentage (0.0 to 100.0)
  Future<double> getProgress(int id) async {
    final stage = await findById(id);
    if (stage == null) return 0.0;

    return stage.progress;
  }

  /// Get current stage name (last completed or first pending)
  Future<String?> getCurrentStage(int id) async {
    final stage = await findById(id);
    if (stage == null) return null;

    final json = stage.toJson();

    // Find the last completed stage or first pending
    String? lastCompleted;
    for (final stepName in stepNames) {
      if (json[stepName] == true) {
        lastCompleted = stepName;
      } else {
        // Return first pending stage
        return stepName;
      }
    }

    // All completed
    if (lastCompleted != null && stage.isComplete) {
      return 'completed';
    }

    return lastCompleted;
  }

  /// Update a specific step with auto-timestamp
  Future<bool> updateStep({
    required int stageId,
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
      parameters: {'id': stageId, 'value': value},
    );

    return result.affectedRows > 0;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int stageId,
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
      parameters: {'id': stageId, 'notes': notes},
    );

    return result.affectedRows > 0;
  }

  /// Get list of completed step names
  Future<List<String>> getCompletedSteps(int id) async {
    final stage = await findById(id);
    if (stage == null) return [];

    final completed = <String>[];
    final json = stage.toJson();

    for (final step in stepNames) {
      if (json[step] == true) {
        completed.add(step);
      }
    }

    return completed;
  }

  /// Get list of pending step names
  Future<List<String>> getPendingSteps(int id) async {
    final stage = await findById(id);
    if (stage == null) return stepNames;

    final pending = <String>[];
    final json = stage.toJson();

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

  /// Find stages by completion status
  Future<List<ExecutionStage>> findByCompletionStatus({
    required bool isComplete,
  }) async {
    final all = await findAll();
    return all.where((s) => s.isComplete == isComplete).toList();
  }

  /// Bulk update multiple steps at once
  Future<bool> updateMultipleSteps({
    required int stageId,
    required Map<String, bool> steps,
  }) async {
    if (steps.isEmpty) return true;

    final setClauses = <String>[];
    final parameters = <String, dynamic>{'id': stageId};

    for (final entry in steps.entries) {
      final stepName = entry.key;
      final value = entry.value;

      if (!stepNames.contains(stepName)) {
        throw ArgumentError('Invalid step name: $stepName');
      }

      final dateColumn = '${stepName}_date';
      setClauses.add('$stepName = @$stepName');
      setClauses.add(
        '$dateColumn = CASE WHEN @$stepName THEN NOW() ELSE NULL END',
      );
      parameters[stepName] = value;
    }

    final sql = '''
      UPDATE $tableName
      SET ${setClauses.join(', ')},
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(sql, parameters: parameters);
    return result.affectedRows > 0;
  }
}
