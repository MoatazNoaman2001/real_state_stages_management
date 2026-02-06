import 'dart:developer';

import '../config/database_config.dart';
import 'package:postgres/postgres.dart';

class DatabaseService {
  static DatabaseService? _instance;
  Connection? _connection;

  //singleton Pattern
  DatabaseService._();

  static DatabaseService get instance{
    _instance??=DatabaseService._();
    return _instance!;
  }

  Future<Connection> get connection async{
    if (_connection == null || !_connection!.isOpen){
      await _connect();
    }
    return _connection!;
  }
  Future<void> _connect() async {
    try {
      // _connection = await Connection.openFromUrl(DatabaseConfig.connectionString);
      _connection = await Connection.open(
        Endpoint(
          host: DatabaseConfig.host,
          database: DatabaseConfig.database,
          port: DatabaseConfig.port,
          username: DatabaseConfig.username,
          password: DatabaseConfig.password,
        ),
        settings: ConnectionSettings(
          connectTimeout: DatabaseConfig.connectionTimeout,
          queryTimeout: DatabaseConfig.queryTimeout,
          sslMode: SslMode.disable, // For local development
        ),
      );
      log('Database connected successfully');
    } catch (e) {
      log('Failed to connect to database: ${e.toString()}');
      rethrow;
    }
  }

  Future<void> close() async {
    await _connection?.close();
    log('Database connection closed');
  }

  // Execute query (SELECT)
  Future<Result> query(
      String sql, {
        Map<String, dynamic>? parameters,
      }) async {
    try {
      final conn = await connection;
      return await conn.execute(
        Sql.named(sql),
        parameters: parameters,
      );
    } catch (e) {
      log('Query error: $e');
      rethrow;
    }
  }

  // Execute command (INSERT, UPDATE, DELETE)
  Future<Result> execute(
      String sql, {
        Map<String, dynamic>? parameters,
      }) async {
    try {
      final conn = await connection;
      return await conn.execute(
        Sql.named(sql),
        parameters: parameters,
      );
    } catch (e) {
      log('Execute error: $e');
      rethrow;
    }
  }

  // Run in transaction
  Future<T> runInTransaction<T>(Future<T> Function(TxSession) callback,) async {
    final conn = await connection;
    return await conn.runTx((session) async {
      return await callback(session);
    });
  }
}