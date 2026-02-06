import '../../core/database/base_repository.dart';
import '../../core/database/database_service.dart';
import '../../domain/models/customer.dart';

class CustomerRepository extends BaseRepository<Customer> {
  final DatabaseService _db = DatabaseService.instance;

  @override
  String get tableName => 'customers';

  @override
  Customer fromMap(Map<String, dynamic> map) {
    // Handle DateTime parsing from PostgreSQL
    final processedMap = Map<String, dynamic>.from(map);

    if (processedMap['created_at'] is DateTime) {
      processedMap['created_at'] =
          (processedMap['created_at'] as DateTime).toIso8601String();
    }
    if (processedMap['updated_at'] is DateTime) {
      processedMap['updated_at'] =
          (processedMap['updated_at'] as DateTime).toIso8601String();
    }

    return Customer.fromJson(processedMap);
  }

  @override
  Map<String, dynamic> toMap(Customer customer) {
    final map = customer.toJson();
    // Remove auto-generated fields
    map.remove('id');
    map.remove('created_at');
    map.remove('updated_at');
    return map;
  }

  /// Search in customer_name, owner_name, plot_number (case insensitive)
  Future<List<Customer>> search(String query) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE customer_name ILIKE @query
         OR owner_name ILIKE @query
         OR plot_number ILIKE @query
      ORDER BY customer_name
    ''';

    final result = await _db.query(
      sql,
      parameters: {'query': '%$query%'},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find customer by exact plot number
  Future<Customer?> findByPlotNumber(String plotNumber) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE plot_number = @plotNumber
    ''';

    final result = await _db.query(
      sql,
      parameters: {'plotNumber': plotNumber},
    );

    if (result.isEmpty) return null;

    final rows = resultToList(result);
    return fromMap(rows.first);
  }

  /// Find customers by current stage
  Future<List<Customer>> findByStage(String stage) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE current_stage = @stage
      ORDER BY customer_name
    ''';

    final result = await _db.query(
      sql,
      parameters: {'stage': stage},
    );

    if (result.isEmpty) return [];

    final rows = resultToList(result);
    return rows.map((row) => fromMap(row)).toList();
  }

  /// Find customer by phone number
  Future<Customer?> findByPhone(String phone) async {
    final sql = '''
      SELECT * FROM $tableName
      WHERE phone = @phone
    ''';

    final result = await _db.query(
      sql,
      parameters: {'phone': phone},
    );

    if (result.isEmpty) return null;

    final rows = resultToList(result);
    return fromMap(rows.first);
  }

}
