import 'package:sentry_flutter/sentry_flutter.dart';

/// Utility class for Sentry error tracking throughout the app.
class SentryUtils {
  SentryUtils._();

  /// Captures an exception with optional stack trace and context.
  static Future<void> captureException(
    Object exception, {
    StackTrace? stackTrace,
    Map<String, dynamic>? extras,
  }) async {
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace ?? StackTrace.current,
      hint: extras != null ? Hint.withMap(extras) : null,
    );
  }

  /// Captures a message with optional level and context.
  static Future<void> captureMessage(
    String message, {
    SentryLevel level = SentryLevel.info,
    Map<String, dynamic>? extras,
  }) async {
    await Sentry.captureMessage(
      message,
      level: level,
      hint: extras != null ? Hint.withMap(extras) : null,
    );
  }

  /// Wraps an async operation and captures any exceptions.
  static Future<T> captureAsync<T>(
    Future<T> Function() operation, {
    Map<String, dynamic>? extras,
  }) async {
    try {
      return await operation();
    } catch (e, stackTrace) {
      await captureException(e, stackTrace: stackTrace, extras: extras);
      rethrow;
    }
  }

  /// Adds breadcrumb for tracking user actions.
  static Future<void> addBreadcrumb(
    String message, {
    String? category,
    Map<String, dynamic>? data,
    SentryLevel level = SentryLevel.info,
  }) async {
    await Sentry.addBreadcrumb(
      Breadcrumb(
        message: message,
        category: category,
        data: data,
        level: level,
      ),
    );
  }

  /// Sets user context for error tracking.
  static Future<void> setUser({
    required String id,
    String? email,
    String? username,
    Map<String, dynamic>? extras,
  }) async {
    await Sentry.configureScope((scope) {
      scope.setUser(
        SentryUser(id: id, email: email, username: username, data: extras),
      );
    });
  }

  /// Clears user context (e.g., on logout).
  static Future<void> clearUser() async {
    await Sentry.configureScope((scope) {
      scope.setUser(null);
    });
  }

  /// Sets a tag for filtering in Sentry dashboard.
  static Future<void> setTag(String key, String value) async {
    await Sentry.configureScope((scope) {
      scope.setTag(key, value);
    });
  }

  /// Sets context data for structured filtering.
  static Future<void> setContext(String key, Map<String, dynamic> value) async {
    await Sentry.configureScope((scope) {
      scope.setContexts(key, value);
    });
  }
}
