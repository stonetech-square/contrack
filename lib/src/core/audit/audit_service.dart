abstract class AuditService {
  Future<void> logExport({
    required String userId,
    required String projectCode,
    required String fileName,
  });
}
