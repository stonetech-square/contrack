import 'package:contrack/src/core/audit/audit_service.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/database/tables/audit_logs.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuditService)
class AuditServiceImpl implements AuditService {
  final AppDatabase _database;

  AuditServiceImpl(this._database);

  @override
  Future<void> logExport({
    required int userId,
    required int projectId,
    required String fileName,
  }) async {
    await _database.into(_database.auditLogs).insert(
          AuditLogsCompanion.insert(
            userId: userId,
            tableNameRef: 'projects',
            recordId: Value(projectId),
            action: AuditAction.export,
            newValues: Value(fileName),
          ),
        );
  }
}
