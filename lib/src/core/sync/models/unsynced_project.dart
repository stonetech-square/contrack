import 'package:contrack/src/core/database/database.dart' as db;

class UnsyncedProject {
  final db.Project project;
  final String? agencyRemoteId;
  final String? ministryRemoteId;
  final String? stateRemoteId;
  final String? zoneRemoteId;
  final String? createdByRemoteId;
  final String? modifiedByRemoteId;

  UnsyncedProject({
    required this.project,
    this.agencyRemoteId,
    this.ministryRemoteId,
    this.stateRemoteId,
    this.zoneRemoteId,
    this.createdByRemoteId,
    this.modifiedByRemoteId,
  });
}
