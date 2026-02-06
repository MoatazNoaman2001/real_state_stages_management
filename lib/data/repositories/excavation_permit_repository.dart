import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/excavation_permit.dart';

class ExcavationPermitRepository extends BaseRepository<ExcavationPermit> {
  final DatabaseService _db = DatabaseService.instance;

  // All 7 step names in order
  static const List<String> stepNames = [
    'supervision_certificate',     // 1
    'contract_agreement',          // 2
    'approve_contract_from_union', // 3
    'supply_to_union',             // 4 (has money field)
    'issue_excavation_permit',     // 5
    'army_permit',                 // 6
    'equipment_permit',            // 7
  ];

  // Arabic display names
  static const Map<String, String> stepDisplayNames = {
    'supervision_certificate': 'شهادة الإشراف',
    'contract_agreement': 'عقد الاتفاق',
    'approve_contract_from_union': 'اعتماد العقد من النقابة',
    'supply_to_union': 'التوريد للنقابة',
    'issue_excavation_permit': 'إصدار إذن الحفر',
    'army_permit': 'تصريح الجيش',
    'equipment_permit': 'تصريح المعدات',
  };

  @override
  String get tableName => 'excavation_permits';

  @override
  ExcavationPermit fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    // Convert string amounts to double
    if (processedMap['union_supply_amount'] != null && processedMap['union_supply_amount'] is String) {
      processedMap['union_supply_amount'] = double.tryParse(processedMap['union_supply_amount'] as String);
    }

    return ExcavationPermit.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(ExcavationPermit permit) {
    final map = permit.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find permit by customer ID
  Future<ExcavationPermit?> findByCustomerId(int customerId) async {
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
    final permit = await findById(id);
    if (permit == null) return 0.0;

    return permit.progress;
  }

  /// Update a specific step with auto-timestamp
  Future<bool> updateStep({
    required int permitId,
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
      parameters: {'id': permitId, 'value': value},
    );

    return result.affectedRows > 0;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int permitId,
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
      parameters: {'id': permitId, 'notes': notes},
    );

    return result.affectedRows > 0;
  }

  /// Update supply amount
  Future<bool> updateSupplyAmount({
    required int permitId,
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
      parameters: {'id': permitId, 'amount': amount},
    );

    return result.affectedRows > 0;
  }

  /// Get list of completed step names
  Future<List<String>> getCompletedSteps(int id) async {
    final permit = await findById(id);
    if (permit == null) return [];

    final completed = <String>[];
    final json = permit.toJson();

    for (final step in stepNames) {
      if (json[step] == true) {
        completed.add(step);
      }
    }

    return completed;
  }

  /// Get list of pending step names
  Future<List<String>> getPendingSteps(int id) async {
    final permit = await findById(id);
    if (permit == null) return stepNames;

    final pending = <String>[];
    final json = permit.toJson();

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
  Future<List<ExcavationPermit>> findByCompletionStatus({
    required bool isComplete,
  }) async {
    final all = await findAll();
    return all.where((p) => p.isComplete == isComplete).toList();
  }
}
