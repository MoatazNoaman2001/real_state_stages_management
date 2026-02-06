import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/license.dart';

class LicenseRepository extends BaseRepository<License> {
  final DatabaseService _db = DatabaseService.instance;

  // All 22 step names in order
  static const List<String> stepNames = [
    'receive_documents',        // 1
    'receive_authorization',    // 2
    'site_validity',            // 3
    'executive_status',         // 4
    'show_to_owner',            // 5 (NEW)
    'review_with_agency',       // 6
    'civil_defense',            // 7
    'prepare_structural',       // 8
    'prepare_structural_reports', // 9
    'submit_to_complex',        // 10
    'supply_to_complex',        // 11
    'do_complex_notes',         // 12
    'issue_document',           // 13
    'prepare_facade_boards',    // 14 (NEW)
    'apply_online_for_license', // 15
    'request_number',           // 16 (string field)
    'agency_review',            // 17 (NEW)
    'determine_fees',           // 18
    'pay_fees',                 // 19
    'issue_license',            // 20
    'apply_for_structural_meter', // 21
    'give_board_copy_to_owner', // 22
  ];

  // Steps with date fields (all except request_number)
  static const List<String> stepsWithDate = [
    'receive_documents',
    'receive_authorization',
    'site_validity',
    'executive_status',
    'show_to_owner',
    'review_with_agency',
    'civil_defense',
    'prepare_structural',
    'prepare_structural_reports',
    'submit_to_complex',
    'supply_to_complex',
    'do_complex_notes',
    'issue_document',
    'prepare_facade_boards',
    'apply_online_for_license',
    'agency_review',
    'determine_fees',
    'pay_fees',
    'issue_license',
    'apply_for_structural_meter',
    'give_board_copy_to_owner',
  ];

  // Steps with money fields
  static const List<String> stepsWithMoney = [
    'supply_to_complex',  // complex_supply_amount
    'pay_fees',           // fees_amount
  ];

  // Arabic display names
  static const Map<String, String> stepDisplayNames = {
    'receive_documents': 'استلام الأوراق',
    'receive_authorization': 'استلام التوكيل',
    'site_validity': 'صلاحية موقع',
    'executive_status': 'موقف تنفيذي',
    'show_to_owner': 'عرض على المالك',
    'review_with_agency': 'مراجعة مع الجهاز',
    'civil_defense': 'دفاع مدني',
    'prepare_structural': 'تجهيز الانشائي',
    'prepare_structural_reports': 'تجهيز تقارير الانشائي',
    'submit_to_complex': 'تقديم المجمعة',
    'supply_to_complex': 'توريد المجمعة',
    'do_complex_notes': 'عمل ملاحظات المجمعة',
    'issue_document': 'اصدار الوثيقة',
    'prepare_facade_boards': 'تجهيز لوحات الواجهات والصحى والكهرباء',
    'apply_online_for_license': 'التقديم علي الموقع لاصدار الترخيص',
    'request_number': 'رقم الطلب',
    'agency_review': 'مراجعة الجهاز',
    'determine_fees': 'تحديد الرسوم',
    'pay_fees': 'سداد الرسوم',
    'issue_license': 'اصدار الرخصة',
    'apply_for_structural_meter': 'تقديم علي عداد انشائي',
    'give_board_copy_to_owner': 'إعطاء نسخة اللوحات للمالك',
  };

  @override
  String get tableName => 'licenses';

  @override
  License fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    processedMap['complex_supply_amount'] =
        _parseOptionalDouble(processedMap['complex_supply_amount']);
    processedMap['fees_amount'] =
        _parseOptionalDouble(processedMap['fees_amount']);

    return License.fromJson(processedMap);
  }

  double? _parseOptionalDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) return null;
      return double.tryParse(trimmed);
    }
    return null;
  }

  @override
  Map<String, dynamic> toMap(License license) {
    final map = license.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find license by customer ID
  Future<License?> findByCustomerId(int customerId) async {
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
    required int licenseId,
    required String stepName,
    required bool value,
  }) async {
    if (!stepNames.contains(stepName)) {
      throw ArgumentError('Invalid step name: $stepName');
    }

    if (stepName == 'request_number') {
      throw ArgumentError(
        'Use updateRequestNumber() for request_number field',
      );
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
      parameters: {'id': licenseId, 'value': value},
    );

    return result.affectedRows > 0;
  }

  /// Update step notes
  Future<bool> updateStepNotes({
    required int licenseId,
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
      parameters: {'id': licenseId, 'notes': notes},
    );

    return result.affectedRows > 0;
  }

  /// Update request number (step 16)
  Future<bool> updateRequestNumber({
    required int licenseId,
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
      parameters: {'id': licenseId, 'requestNumber': requestNumber},
    );

    return result.affectedRows > 0;
  }

  /// Update amount fields
  Future<bool> updateAmounts({
    required int licenseId,
    double? complexSupplyAmount,
    double? feesAmount,
  }) async {
    final setClauses = <String>[];
    final parameters = <String, dynamic>{'id': licenseId};

    if (complexSupplyAmount != null) {
      setClauses.add('complex_supply_amount = @complexSupplyAmount');
      parameters['complexSupplyAmount'] = complexSupplyAmount;
    }

    if (feesAmount != null) {
      setClauses.add('fees_amount = @feesAmount');
      parameters['feesAmount'] = feesAmount;
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

  /// Get progress percentage (0.0 to 100.0)
  Future<double> getProgress(int licenseId) async {
    final license = await findById(licenseId);
    if (license == null) return 0.0;
    return license.progress;
  }

  /// Get list of completed step names
  Future<List<String>> getCompletedSteps(int licenseId) async {
    final license = await findById(licenseId);
    if (license == null) return [];

    final completed = <String>[];
    final json = license.toJson();

    for (final step in stepNames) {
      if (step == 'request_number') {
        final value = json[step] as String?;
        if (value != null && value.isNotEmpty) {
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
  Future<List<String>> getPendingSteps(int licenseId) async {
    final license = await findById(licenseId);
    if (license == null) return stepNames;

    final pending = <String>[];
    final json = license.toJson();

    for (final step in stepNames) {
      if (step == 'request_number') {
        final value = json[step] as String?;
        if (value == null || value.isEmpty) {
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

  /// Get licenses by completion status
  Future<List<License>> findByCompletionStatus({
    required bool isComplete,
  }) async {
    final all = await findAll();
    return all.where((l) => l.isComplete == isComplete).toList();
  }

  /// Bulk update multiple steps at once
  Future<bool> updateMultipleSteps({
    required int licenseId,
    required Map<String, bool> steps,
  }) async {
    if (steps.isEmpty) return true;

    final setClauses = <String>[];
    final parameters = <String, dynamic>{'id': licenseId};

    for (final entry in steps.entries) {
      final stepName = entry.key;
      final value = entry.value;

      if (!stepsWithDate.contains(stepName)) {
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

  /// Get step display name in Arabic
  String getStepDisplayName(String stepName) {
    return stepDisplayNames[stepName] ?? stepName;
  }
}
