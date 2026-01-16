import 'package:logging/logging.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure &&
        other.runtimeType == runtimeType &&
        other.message == message;
  }

  @override
  int get hashCode => message.hashCode ^ runtimeType.hashCode;
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message])
    : super(message ?? 'Please check your internet connection and try again.');
}

class AppFailure extends Failure {
  static final Logger _logger = Logger('AppFailure');

  const AppFailure([String? message])
    : super(message ?? 'Something went wrong. Please try again later.');

  factory AppFailure.fromException(Object error, [StackTrace? stackTrace]) {
    _logger.severe(
      'Error occurred: $error\nStack: $stackTrace',
      error,
      stackTrace,
    );

    if (error is AppFailure) {
      return error;
    }

    if (error is Failure) {
      return AppFailure(error.message);
    }

    final errorMessage = error.toString().toLowerCase();

    if (_isNetworkError(errorMessage)) {
      return const AppFailure(
        'Please check your internet connection and try again.',
      );
    }

    if (_isAuthError(errorMessage)) {
      return _mapAuthError(errorMessage);
    }

    if (_isServerError(errorMessage)) {
      return const AppFailure('An error occurred. Please try again later.');
    }

    if (_isSqlError(errorMessage)) {
      return _mapSqlError(errorMessage);
    }

    return const AppFailure();
  }

  static bool _isNetworkError(String error) {
    return error.contains('socketexception') ||
        error.contains('network') ||
        error.contains('connection') ||
        error.contains('timeout') ||
        error.contains('failed host lookup');
  }

  static bool _isAuthError(String error) {
    return error.contains('invalid login') ||
        error.contains('invalid_credentials') ||
        error.contains('invalid credentials') ||
        error.contains('authentication') ||
        error.contains('unauthorized') ||
        error.contains('user not found') ||
        error.contains('wrong password');
  }

  static bool _isServerError(String error) {
    return error.contains('500') ||
        error.contains('502') ||
        error.contains('503') ||
        error.contains('server error');
  }

  static AppFailure _mapAuthError(String error) {
    if (error.contains('invalid login') ||
        error.contains('invalid_credentials') ||
        error.contains('invalid credentials')) {
      return const AppFailure('Invalid email or password');
    }
    if (error.contains('user not found')) {
      return const AppFailure('Account not found');
    }
    if (error.contains('email not confirmed')) {
      return const AppFailure('Please verify your email address');
    }
    return const AppFailure('Authentication failed. Please try again.');
  }

  static bool _isSqlError(String error) {
    return error.contains('sqliteexception') ||
        error.contains('sql error') ||
        error.contains('databaseexception');
  }

  static AppFailure _mapSqlError(String error) {
    if (error.contains('foreign key constraint failed')) {
      return const AppFailure(
        'Data mismatch: Some referenced categories (Zone, State, etc.) are missing. Please sync your data.',
      );
    }
    if (error.contains('unique constraint failed')) {
      return const AppFailure('Duplicate entry. This record already exists.');
    }
    return const AppFailure('Database operation failed. Please try again.');
  }
}
