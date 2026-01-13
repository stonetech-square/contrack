class AppException implements Exception {
  final String message;
  AppException([this.message = 'App error occurred']);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'Network error occurred']);
}
