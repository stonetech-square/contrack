import 'package:contrack/src/app/data/datasource/app_local_datasource.dart';
import 'package:contrack/src/app/data/datasource/app_remote_datasource.dart';
import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/app/domain/repository/app_repository.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/sync/app_sync_status.dart';
import 'package:contrack/src/core/sync/sync_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource _localDataSource;
  final AppRemoteDatasource _remoteDataSource;
  final SyncService _syncService;

  AppRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._syncService,
  );

  @override
  Stream<AppUserModel?> watchUser() {
    return _localDataSource
        .watchUser()
        .map((user) {
          if (user == null) {
            return null;
          }
          return AppUserModel.fromDrift(user);
        })
        .handleError((error, stackTrace) {
          throw AppFailure.fromException(error, stackTrace);
        });
  }

  @override
  Future<void> setUser(String userId) async {
    try {
      await _localDataSource.setUser(userId);
    } catch (e, stackTrace) {
      throw AppFailure.fromException(e, stackTrace);
    }
  }

  @override
  Future<void> syncNow() async {
    try {
      await _syncService.syncNow();
    } catch (e, stackTrace) {
      throw AppFailure.fromException(e, stackTrace);
    }
  }

  @override
  Stream<AppSyncStatus> get syncStatus => _syncService.status;

  @override
  Future<void> logOut() async {
    try {
      await _remoteDataSource.logOut();
      await _localDataSource.clearSession();
    } catch (e, stackTrace) {
      throw AppFailure.fromException(e, stackTrace);
    }
  }

  @override
  Future<void> updateUser(AppUserModel user) async {
    try {
      await _localDataSource.updateUser(user);
      await _remoteDataSource.updateUser(user);
    } catch (e, stackTrace) {
      throw AppFailure.fromException(e, stackTrace);
    }
  }
}
