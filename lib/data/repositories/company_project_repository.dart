import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/company_project.dart';

class CompanyProjectRepository extends BaseRepository<CompanyProject> {
  final DatabaseService _db = DatabaseService.instance;

  @override
  String get tableName => 'company_projects';

  @override
  CompanyProject fromMap(Map<String, dynamic> map) {
    final processedMap = Map<String, dynamic>.from(map);

    for (final key in processedMap.keys.toList()) {
      if (processedMap[key] is DateTime) {
        processedMap[key] = (processedMap[key] as DateTime).toIso8601String();
      }
    }

    return CompanyProject.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(CompanyProject project) {
    final map = project.toJson();
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Find projects by status
  Future<List<CompanyProject>> findByStatus(String status) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE current_status = @status
      ORDER BY project_name
    ''';

    final result = await _db.query(
      sql,
      parameters: {'status': status},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Search by project name
  Future<List<CompanyProject>> search(String query) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE project_name ILIKE @query
      ORDER BY project_name
    ''';

    final result = await _db.query(
      sql,
      parameters: {'query': '%$query%'},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Get all unique statuses
  Future<List<String>> getAllStatuses() async {
    final sql = '''
      SELECT DISTINCT current_status
      FROM $tableName
      WHERE current_status IS NOT NULL
      ORDER BY current_status
    ''';

    final result = await _db.query(sql);
    if (result.isEmpty) return [];

    return result.map((row) => row[0] as String).toList();
  }
}
