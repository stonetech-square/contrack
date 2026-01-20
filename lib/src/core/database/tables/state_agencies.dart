import 'package:drift/drift.dart';

class States extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 100).unique()();
  TextColumn get code => text().withLength(min: 2, max: 10).nullable()();
  IntColumn get zoneId => integer().references(GeopoliticalZones, #id)();
  TextColumn get remoteId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class GeopoliticalZones extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 5, max: 50).unique()();
  TextColumn get code => text().withLength(min: 2, max: 10).nullable()();
  TextColumn get remoteId => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Agencies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 200).unique()();
  TextColumn get code => text().withLength(min: 2, max: 50).nullable()();
  TextColumn get remoteId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
}

class Ministries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 200).unique()();
  TextColumn get code => text().withLength(min: 2, max: 50).nullable()();
  TextColumn get remoteId => text().nullable()();
  IntColumn get agencyId =>
      integer().references(Agencies, #id, onDelete: KeyAction.cascade)();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
}
