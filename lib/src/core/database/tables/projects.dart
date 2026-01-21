import 'package:contrack/src/core/database/tables/state_agencies.dart';
import 'package:contrack/src/core/database/tables/users.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:drift/drift.dart';

class Projects extends Table {
  @override
  Set<Column> get primaryKey => {code};
  TextColumn get code => text().withLength(min: 1, max: 100)();
  TextColumn get status => textEnum<ProjectStatus>()();
  IntColumn get agencyId => integer().references(Agencies, #id)();
  IntColumn get ministryId => integer().references(Ministries, #id)();
  IntColumn get stateId => integer().references(States, #id)();
  IntColumn get zoneId => integer().references(GeopoliticalZones, #id)();
  @ReferenceName('createdProjects')
  TextColumn get createdBy => text().references(Users, #uid)();
  @ReferenceName('modifiedProjects')
  TextColumn get modifiedBy => text().references(Users, #uid).nullable()();
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
  BoolColumn get isDeleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
