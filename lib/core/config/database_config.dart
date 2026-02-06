import 'package:flutter_dotenv/flutter_dotenv.dart';

class DatabaseConfig {
  static String get connectionString =>
      dotenv.env['DATABASE_URL'] ??
      'postgres://real_state_user:password@localhost:5432/real_state';

  // Parse individual components from DATABASE_URL
  static Uri get _uri => Uri.parse(connectionString);

  static String get host => _uri.host;
  static int get port => _uri.port;
  static String get database => _uri.path.substring(1); // remove leading '/'
  static String get username => _uri.userInfo.split(':').first;
  static String get password => _uri.userInfo.split(':').last;

  // Connection Settings
  static int get connectionTimeoutSeconds =>
      int.tryParse(dotenv.env['CONNECTION_TIMEOUT_SECONDS'] ?? '') ?? 30;

  static int get queryTimeoutSeconds =>
      int.tryParse(dotenv.env['QUERY_TIMEOUT_SECONDS'] ?? '') ?? 60;

  // Retry Settings
  static int get maxRetries =>
      int.tryParse(dotenv.env['MAX_RETRIES'] ?? '') ?? 3;

  static Duration get retryDelay => Duration(
        seconds:
            int.tryParse(dotenv.env['RETRY_DELAY_SECONDS'] ?? '') ?? 2,
      );

  // Get connection timeout as Duration
  static Duration get connectionTimeout =>
      Duration(seconds: connectionTimeoutSeconds);

  // Get query timeout as Duration
  static Duration get queryTimeout => Duration(seconds: queryTimeoutSeconds);
}
