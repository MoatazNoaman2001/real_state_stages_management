import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/utility_meter.dart';

class UtilityMeterRepository extends BaseRepository<UtilityMeter> {
  final DatabaseService _db = DatabaseService.instance;

  // All 8 step names in order
  static const List<String> stepNames = [
    'receive_documents',  // 1
    'authorization',      // 2 (was authorizationd - typo fixed)
    'apply_for_meter',    // 3
    'inspection',         // 4 (has money field)
    'print_letters',      // 5 (NEW)
    'supply_to_meter',    // 6 (has money fields - 4 supplies)
    'contract_meter',     // 7
    'receive_meter',      // 8
  ];

  // Steps with date fields
  static const List<String> stepsWithDate = [
    'receive_documents',
    'authorization_var',
    'apply_for_meter',
    'inspection',
    'print_letters',
    'supply_to_meter',
    'contract_meter',
    'receive_meter',
  ];

  // Arabic display names
  static const Map<String, String> stepDisplayNames = {
    'receive_documents': 'استلام الأوراق',
    'authorization': 'التوكيل',
    'apply_for_meter': 'التقديم على العداد',
    'inspection': 'المعاينة',
    'print_letters': 'طباعة الجوابات',
    'supply_to_meter': 'توريد العداد',
    'contract_meter': 'التعاقد على العداد',
    'receive_meter': 'استلام العداد',
  };

  @override
  String get tableName => 'utility_meters';

  @override
  UtilityMeter fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    // Convert string amounts to double
    final amountFields = [
      'inspection_amount',
      'supply_amount_1',
      'supply_amount_2',
      'supply_amount_3',
      'supply_amount_4',
    ];
    for (final field in amountFields) {
      if (processedMap[field] != null && processedMap[field] is String) {
        processedMap[field] = double.tryParse(processedMap[field] as String);
      }
    }

    return UtilityMeter.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(UtilityMeter meter) {
    final map = meter.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find by customer ID
  Future<UtilityMeter?> findByCustomerId(int customerId) async {
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
    required int meterId,
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
      parameters: {'id': meterId, 'value': value},
    );

    return result.affectedRows > 0;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int meterId,
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
      parameters: {'id': meterId, 'notes': notes},
    );

    return result.affectedRows > 0;
  }

  /// Update supply amounts (4 separate supply amounts)
  Future<bool> updateSupplyAmounts({
    required int meterId,
    double? supplyAmount1,
    double? supplyAmount2,
    double? supplyAmount3,
    double? supplyAmount4,
  }) async {
    final setClauses = <String>[];
    final parameters = <String, dynamic>{'id': meterId};

    if (supplyAmount1 != null) {
      setClauses.add('supply_amount_1 = @supplyAmount1');
      parameters['supplyAmount1'] = supplyAmount1;
    }
    if (supplyAmount2 != null) {
      setClauses.add('supply_amount_2 = @supplyAmount2');
      parameters['supplyAmount2'] = supplyAmount2;
    }
    if (supplyAmount3 != null) {
      setClauses.add('supply_amount_3 = @supplyAmount3');
      parameters['supplyAmount3'] = supplyAmount3;
    }
    if (supplyAmount4 != null) {
      setClauses.add('supply_amount_4 = @supplyAmount4');
      parameters['supplyAmount4'] = supplyAmount4;
    }

    if (setClauses.isEmpty) return true;

    final sql = '''
      UPDATE $tableName
      SET ${setClauses.join(', ')},
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(sql, parameters: parameters);
    return result.affectedRows > 0;
  }

  /// Update inspection amount
  Future<bool> updateInspectionAmount({
    required int meterId,
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
      parameters: {'id': meterId, 'amount': amount},
    );

    return result.affectedRows > 0;
  }

  /// Update inspection date
  Future<bool> updateInspectionDate({
    required int meterId,
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
      parameters: {'id': meterId, 'inspectionDate': inspectionDate},
    );

    return result.affectedRows > 0;
  }

  /// Update a specific supply amount by index (1-4)
  Future<bool> updateSupplyAmount({
    required int meterId,
    required int amountIndex,
    required double? amount,
  }) async {
    if (amountIndex < 1 || amountIndex > 4) {
      throw ArgumentError('Amount index must be between 1 and 4');
    }

    final sql = '''
      UPDATE $tableName
      SET supply_amount_$amountIndex = @amount,
          updated_at = NOW()
      WHERE id = @id
    ''';

    final result = await _db.execute(
      sql,
      parameters: {'id': meterId, 'amount': amount},
    );

    return result.affectedRows > 0;
  }

  /// Get total amount (sum of 5 amounts: inspection + 4 supply amounts)
  Future<double> getTotalAmount(int id) async {
    final meter = await findById(id);
    if (meter == null) return 0.0;

    return (meter.inspectionAmount ?? 0) + meter.totalSupplyAmount;
  }

  /// Get progress percentage
  Future<double> getProgress(int id) async {
    final meter = await findById(id);
    if (meter == null) return 0.0;
    return meter.progress;
  }

  /// Get list of completed step names
  Future<List<String>> getCompletedSteps(int id) async {
    final meter = await findById(id);
    if (meter == null) return [];

    final completed = <String>[];
    final json = meter.toJson();

    for (final step in stepNames) {
      if (json[step] == true) {
        completed.add(step);
      }
    }

    return completed;
  }

  /// Get list of pending step names
  Future<List<String>> getPendingSteps(int id) async {
    final meter = await findById(id);
    if (meter == null) return stepNames;

    final pending = <String>[];
    final json = meter.toJson();

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
  Future<List<UtilityMeter>> findByCompletionStatus({
    required bool isComplete,
  }) async {
    final all = await findAll();
    return all.where((m) => m.isComplete == isComplete).toList();
  }
}
