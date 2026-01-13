import 'package:contrack/src/core/database/tables/state_agencies.dart';
import 'package:contrack/src/core/database/tables/users.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:drift/drift.dart';

class Projects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().withLength(min: 1, max: 100).unique()();
  TextColumn get status => textEnum<ProjectStatus>()();
  IntColumn get agencyId => integer().references(Agencies, #id)();
  IntColumn get ministryId => integer().references(Ministries, #id)();
  IntColumn get stateId => integer().references(States, #id)();
  IntColumn get zoneId => integer().references(GeopoliticalZones, #id)();
  @ReferenceName('createdProjects')
  IntColumn get createdBy => integer().references(Users, #id)();
  @ReferenceName('modifiedProjects')
  IntColumn get modifiedBy => integer().references(Users, #id).nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  BoolColumn get isSynced => boolean().withDefault(Constant(false))();
  TextColumn get constituency => text()();
  RealColumn get amount => real()();
  TextColumn get title => text()();
  TextColumn get sponsor => text().nullable()();
  TextColumn get remoteId => text().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
}
