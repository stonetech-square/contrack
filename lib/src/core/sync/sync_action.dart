import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/sync/delegates/metadata_sync_delegate.dart';
import 'package:contrack/src/core/sync/delegates/project_sync_delegate.dart';
import 'package:contrack/src/core/sync/delegates/user_sync_delegate.dart';
import 'package:contrack/src/core/sync/models/unsynced_project.dart';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:contrack/src/core/common/models/user_profile_model.dart';

/// Executor: Responsible for performing atomic sync operations on single entities.
///
/// Responsibilities:
/// 1. **Push**: Takes a local entity, pushes it to Remote (Supabase), and updates the Local 'synced' state.
/// 2. **Upsert (Pull)**: Takes remote data, validates/transforms it, compares with local data (via digests),
///    and inserts/updates the Local DB.
abstract class SyncAction {
  Future<void> pushProject(
    db.Project project,
    String? agencyRemoteId,
    String? ministryRemoteId,
    String? stateRemoteId,
    String? zoneRemoteId,
    String? createdByRemoteId,
    String? modifiedByRemoteId,
  );

  Future<void> pushUser(db.User user);
  Future<void> pushAgency(db.Agency agency);
  Future<void> pushMinistry(db.Ministry ministry);

  Future<void> upsertRemoteGeopoliticalZone(Map<String, dynamic> data);
  Future<void> upsertRemoteMinistry(Map<String, dynamic> data);
  Future<void> upsertRemoteState(Map<String, dynamic> data);
  Future<void> upsertRemoteAgency(Map<String, dynamic> data);
  Future<void> upsertRemoteProfile(UserProfileModel data);
  Future<void> upsertRemoteProject(
    Map<String, dynamic> data,
    String? currentUserId,
  );

  Future<List<Map<String, dynamic>>> fetchRemoteProjects();
  Future<List<Map<String, dynamic>>> fetchRemoteGeopoliticalZones();
  Future<List<Map<String, dynamic>>> fetchRemoteAgencies();
  Future<List<Map<String, dynamic>>> fetchRemoteMinistries();
  Future<List<Map<String, dynamic>>> fetchRemoteStates();
  Future<List<UserProfileModel>> fetchRemoteProfiles();

  Future<List<UnsyncedProject>> getUnsyncedProjects({required int limit});
  Future<List<db.User>> getUnsyncedUsers({required int limit});
  Future<List<db.Agency>> getUnsyncedAgencies({required int limit});
  Future<List<db.Ministry>> getUnsyncedMinistries({required int limit});
  Future<db.User?> getActiveSessionUser();
  Future<int> deleteLocalUsersNotInRemote(
    Set<String> remoteUserIds,
    String? currentUserId,
  );
}

@LazySingleton(as: SyncAction)
class SyncActionImpl implements SyncAction {
  final MetadataSyncDelegate _metadataDelegate;
  final UserSyncDelegate _userDelegate;
  final ProjectSyncDelegate _projectDelegate;

  SyncActionImpl(db.AppDatabase database, SupabaseClient supabase)
    : _metadataDelegate = MetadataSyncDelegate(database, supabase),
      _userDelegate = UserSyncDelegate(database, supabase),
      _projectDelegate = ProjectSyncDelegate(
        database,
        supabase,
        UserSyncDelegate(database, supabase),
      );

  @override
  Future<void> pushProject(
    db.Project project,
    String? agencyRemoteId,
    String? ministryRemoteId,
    String? stateRemoteId,
    String? zoneRemoteId,
    String? createdByRemoteId,
    String? modifiedByRemoteId,
  ) {
    return _projectDelegate.pushProject(
      project,
      agencyRemoteId,
      ministryRemoteId,
      stateRemoteId,
      zoneRemoteId,
      createdByRemoteId,
      modifiedByRemoteId,
    );
  }

  @override
  Future<void> pushUser(db.User user) {
    return _userDelegate.pushUser(user);
  }

  @override
  Future<void> pushAgency(db.Agency agency) {
    return _metadataDelegate.pushAgency(agency);
  }

  @override
  Future<void> pushMinistry(db.Ministry ministry) {
    return _metadataDelegate.pushMinistry(ministry);
  }

  @override
  Future<void> upsertRemoteGeopoliticalZone(Map<String, dynamic> data) {
    return _metadataDelegate.upsertRemoteGeopoliticalZone(data);
  }

  @override
  Future<void> upsertRemoteMinistry(Map<String, dynamic> data) {
    return _metadataDelegate.upsertRemoteMinistry(data);
  }

  @override
  Future<void> upsertRemoteState(Map<String, dynamic> data) {
    return _metadataDelegate.upsertRemoteState(data);
  }

  @override
  Future<void> upsertRemoteAgency(Map<String, dynamic> data) {
    return _metadataDelegate.upsertRemoteAgency(data);
  }

  @override
  Future<void> upsertRemoteProfile(UserProfileModel data) {
    return _userDelegate.upsertRemoteProfile(data);
  }

  @override
  Future<void> upsertRemoteProject(
    Map<String, dynamic> data,
    String? currentUserId,
  ) {
    return _projectDelegate.upsertRemoteProject(data, currentUserId);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchRemoteProjects() {
    return _projectDelegate.fetchRemoteProjects();
  }

  @override
  Future<List<Map<String, dynamic>>> fetchRemoteGeopoliticalZones() {
    return _metadataDelegate.fetchRemoteGeopoliticalZones();
  }

  @override
  Future<List<Map<String, dynamic>>> fetchRemoteAgencies() {
    return _metadataDelegate.fetchRemoteAgencies();
  }

  @override
  Future<List<Map<String, dynamic>>> fetchRemoteMinistries() {
    return _metadataDelegate.fetchRemoteMinistries();
  }

  @override
  Future<List<Map<String, dynamic>>> fetchRemoteStates() {
    return _metadataDelegate.fetchRemoteStates();
  }

  @override
  Future<List<UserProfileModel>> fetchRemoteProfiles() {
    return _userDelegate.fetchRemoteProfiles();
  }

  @override
  Future<List<UnsyncedProject>> getUnsyncedProjects({required int limit}) {
    return _projectDelegate.getUnsyncedProjects(limit: limit);
  }

  @override
  Future<List<db.User>> getUnsyncedUsers({required int limit}) {
    return _userDelegate.getUnsyncedUsers(limit: limit);
  }

  @override
  Future<List<db.Agency>> getUnsyncedAgencies({required int limit}) {
    return _metadataDelegate.getUnsyncedAgencies(limit: limit);
  }

  @override
  Future<List<db.Ministry>> getUnsyncedMinistries({required int limit}) {
    return _metadataDelegate.getUnsyncedMinistries(limit: limit);
  }

  @override
  Future<db.User?> getActiveSessionUser() {
    return _userDelegate.getActiveSessionUser();
  }

  @override
  Future<int> deleteLocalUsersNotInRemote(
    Set<String> remoteUserIds,
    String? currentUserId,
  ) {
    return _userDelegate.deleteLocalUsersNotInRemote(
      remoteUserIds,
      currentUserId,
    );
  }
}
