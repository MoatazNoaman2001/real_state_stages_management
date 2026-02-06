/// Base exception for all app exceptions
abstract class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() => message;
}

/// Validation errors
class ValidationException extends AppException {
  ValidationException(super.message, {super.code});
}

/// Not found errors
class NotFoundException extends AppException {
  NotFoundException(super.message, {super.code});
}

/// Duplicate entry errors
class DuplicateException extends AppException {
  DuplicateException(super.message, {super.code});
}

/// Business rule violations
class BusinessRuleException extends AppException {
  BusinessRuleException(super.message, {super.code});
}

/// Database errors
class DatabaseException extends AppException {
  DatabaseException(super.message, {super.code});
}
