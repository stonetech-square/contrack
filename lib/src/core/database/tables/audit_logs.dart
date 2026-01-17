import 'package:contrack/src/core/database/tables/users.dart';
import 'package:drift/drift.dart';

class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get tableNameRef => text().withLength(min: 1, max: 50)();
  TextColumn get recordId => text().nullable()();
  TextColumn get action => textEnum<AuditAction>()();
  TextColumn get oldValues => text().nullable()(); // JSON string
  TextColumn get newValues => text().nullable()(); // JSON string
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get ipAddress => text().nullable()();
}

enum AuditAction {
  create,
  update,
  delete,
  export,
  login,
  logout;

  String get displayName {
    switch (this) {
      case AuditAction.create:
        return 'Created';
      case AuditAction.update:
        return 'Updated';
      case AuditAction.delete:
        return 'Deleted';
      case AuditAction.export:
        return 'Exported';
      case AuditAction.login:
        return 'Logged In';
      case AuditAction.logout:
        return 'Logged Out';
    }
  }
}
