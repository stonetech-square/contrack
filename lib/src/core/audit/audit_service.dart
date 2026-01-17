abstract class AuditService {
  Future<void> logExport({
    required int userId,
    required String projectCode,
    required String fileName,
  });
}
