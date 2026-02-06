import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/supervision_certificate.dart';

class SupervisionCertificateRepository
    extends BaseRepository<SupervisionCertificate> {
  final DatabaseService _db = DatabaseService.instance;

  @override
  String get tableName => 'supervision_certificates';

  @override
  SupervisionCertificate fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    return SupervisionCertificate.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(SupervisionCertificate certificate) {
    final map = certificate.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find by customer ID
  Future<SupervisionCertificate?> findByCustomerId(int customerId) async {
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

  /// Find by engineer name (case insensitive)
  Future<List<SupervisionCertificate>> findByEngineer(
    String engineerName,
  ) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE engineer_name ILIKE @engineerName
      ORDER BY certificate_date DESC
    ''';

    final result = await _db.query(
      sql,
      parameters: {'engineerName': '%$engineerName%'},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Get all unique engineer names
  Future<List<String>> getAllEngineers() async {
    final sql = '''
      SELECT DISTINCT engineer_name
      FROM $tableName
      WHERE engineer_name IS NOT NULL
      ORDER BY engineer_name
    ''';

    final result = await _db.query(sql);
    if (result.isEmpty) return [];

    return result.map((row) => row[0] as String).toList();
  }
}
