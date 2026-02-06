class DatabaseConfig {
  // PostgreSQL Connection Details
  static const String host = 'localhost';
  static const int port = 5432;
  static const String database = 'real_state_db';
  static const String username = 'real_state_user';
  static const String password = 'Alemam252520';

  // Connection Settings
  static const int connectionTimeoutSeconds = 30;
  static const int queryTimeoutSeconds = 60;

  // Retry Settings
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  // Get connection string (basic format for postgres package)
  static String get connectionString {
    return 'postgres://$username:$password@$host:$port/$database';
        // 'connection_timeout=${connectionTimeout.toString()}&'
        // 'max_connection_count=10';
  }


  // Get connection timeout as Duration
  static Duration get connectionTimeout =>
      Duration(seconds: connectionTimeoutSeconds);

  // Get query timeout as Duration
  static Duration get queryTimeout => Duration(seconds: queryTimeoutSeconds);
}