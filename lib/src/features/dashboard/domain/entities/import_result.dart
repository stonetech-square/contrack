class ImportResult {
  final int successCount;
  final int failureCount;
  final List<String> errors;

  ImportResult({
    required this.successCount,
    required this.failureCount,
    required this.errors,
  });
}
