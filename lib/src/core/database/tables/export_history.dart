import 'package:contrack/src/core/database/tables/projects.dart';
import 'package:contrack/src/core/database/tables/users.dart';
import 'package:drift/drift.dart';

class ExportHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  IntColumn get projectId => integer().references(Projects, #id)();
  TextColumn get format => textEnum<ExportFormat>()();
  IntColumn get recordCount => integer()();
  TextColumn get fileName => text()();
  TextColumn get filters =>
      text().nullable()(); // JSON string of applied filters
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

enum ExportFormat {
  excel,
  csv,
  pdf;

  String get displayName {
    switch (this) {
      case ExportFormat.excel:
        return 'Excel (.xlsx)';
      case ExportFormat.csv:
        return 'CSV';
      case ExportFormat.pdf:
        return 'PDF';
    }
  }

  String get fileExtension {
    switch (this) {
      case ExportFormat.excel:
        return '.xlsx';
      case ExportFormat.csv:
        return '.csv';
      case ExportFormat.pdf:
        return '.pdf';
    }
  }
}
