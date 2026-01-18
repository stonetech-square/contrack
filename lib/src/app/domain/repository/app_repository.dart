import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/core/sync/app_sync_status.dart';

abstract class AppRepository {
  Stream<AppUserModel?> watchUser();
  Future<void> setUser(String uid);
  Future<void> logOut();
  Future<void> syncNow();
  Stream<AppSyncStatus> get syncStatus;
}
