import 'package:contrack/src/core/database/tables/users.dart';
import 'package:drift/drift.dart';

class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get activeUserId => integer().nullable().references(Users, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
