import 'package:contrack/src/core/database/tables/users.dart';
import 'package:drift/drift.dart';

class Sessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get activeUserId => text().nullable().references(Users, #uid)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
