abstract class AuditService {
  Future<void> logExport({
    required int userId,
    required int projectId,
    required String fileName,
  });
}
