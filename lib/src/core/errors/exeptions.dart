class AppException implements Exception {
  final String message;
  AppException([this.message = 'App error occurred']);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'Network error occurred']);
}

class NoProjectsToExportException extends AppException {
  NoProjectsToExportException([super.message = 'No active projects to export']);
}
