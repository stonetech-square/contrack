class ImportResult {
  final int successCount;
  final int failureCount;
  final List<String> errors;

  ImportResult({
    required this.successCount,
    required this.failureCount,
    required this.errors,
  });

  @override
  String toString() {
    return 'ImportResult(successCount: $successCount, failureCount: $failureCount, errors: $errors)';
  }
}
