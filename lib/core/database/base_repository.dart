import 'package:postgres/postgres.dart';
import 'database_service.dart';

abstract class BaseRepository<T> {
  final DatabaseService _db = DatabaseService.instance;

  String get tableName;
  T fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap(T object);


  List<Map<String, dynamic>> resultToList(Result result) {
    return result.map((row) {
      final map = <String, dynamic>{};
      for (var i = 0; i < result.schema.columns.length; i++) {
        final column = result.schema.columns[i];
        if (column.columnName != null) {
          map[column.columnName!] = row[i];
        }
      }
      return map;
    }).toList();
  }

  /// Create (INSERT)
  Future<int> insert(T entity) async {
    final data = toMap(entity);
    final columns = data.keys.join(', ');
    final placeholders = data.keys.map((k) => '@$k').join(', ');

    final sql = '''
      INSERT INTO $tableName ($columns)
      VALUES ($placeholders)
      RETURNING id
    ''';

    final result = await _db.execute(sql, parameters: data);
    return result.first[0] as int;
  }

  /// Read by ID
  Future<T?> findById(int id) async {
    final sql = 'SELECT * FROM $tableName WHERE id = @id';
    final result = await _db.query(sql, parameters: {'id': id});

    if (result.isEmpty) return null;

    final rows = resultToList(result);
    return fromMap(rows.first);
  }

  /// Read All
  Future<List<T>> findAll({
    String? orderBy,
    int? limit,
  }) async {
    var sql = 'SELECT * FROM $tableName';

    if (orderBy != null) {
      sql += ' ORDER BY $orderBy';
    }

    if (limit != null) {
      sql += ' LIMIT $limit';
    }

    final result = await _db.query(sql);
    final rows = resultToList(result);

    return rows.map((row) => fromMap(row)).toList();
  }

  /// Update
  Future<bool> update(int id, T entity) async {
    final data = toMap(entity);
    data.remove('id'); // Don't update ID
    data.remove('created_at'); // Don't update created_at

    final setClause = data.keys.map((k) => '$k = @$k').join(', ');

    final sql = '''
      UPDATE $tableName
      SET $setClause, updated_at = CURRENT_TIMESTAMP
      WHERE id = @id
    ''';

    final allParams = {...data, 'id': id};
    final result = await _db.execute(sql, parameters: allParams);

    return result.affectedRows > 0;
  }

  /// Delete
  Future<bool> delete(int id) async {
    final sql = 'DELETE FROM $tableName WHERE id = @id';
    final result = await _db.execute(sql, parameters: {'id': id});

    return result.affectedRows > 0;
  }

  /// Count
  Future<int> count({
    String? where,
    Map<String, dynamic>? parameters,
  }) async {
    var sql = 'SELECT COUNT(*) as count FROM $tableName';

    if (where != null) {
      sql += ' WHERE $where';
    }

    final result = await _db.query(sql, parameters: parameters);
    return result.first[0] as int;
  }

  /// Check if exists
  Future<bool> exists({
    required String where,
    Map<String, dynamic>? parameters,
  }) async {
    final count = await this.count(where: where, parameters: parameters);
    return count > 0;
  }
}