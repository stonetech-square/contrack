import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:drift/drift.dart';

class Users extends Table {
  @override
  Set<Column> get primaryKey => {uid};
  TextColumn get uid => text()();
  TextColumn get username => text().withLength(min: 3, max: 50).unique()();
  TextColumn get fullName => text().withLength(min: 2, max: 100).nullable()();
  TextColumn get email => text().withLength(min: 5, max: 100).unique()();
  TextColumn get role => textEnum<UserRole>()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get remoteId => text().nullable()();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastLoginAt => dateTime().nullable()();
}
