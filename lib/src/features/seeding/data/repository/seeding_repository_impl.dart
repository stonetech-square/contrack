import 'package:contrack/src/features/seeding/data/datasource/seeding_local_datasource.dart';
import 'package:contrack/src/features/seeding/data/datasource/seeding_remote_datasource.dart';
import 'package:contrack/src/features/seeding/domain/repository/seeding_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SeedingRepository)
class SeedingRepositoryImpl implements SeedingRepository {
  final SeedingLocalDataSource _localDataSource;
  final SeedingRemoteDataSource _remoteDataSource;

  SeedingRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Stream<double> seedAgencies() async* {
    yield 0.1;
    final existingAgencyIds = await _localDataSource.getExistingAgencyIds();
    final existingMinistryIds = await _localDataSource.getExistingMinistryIds();
    yield 0.2;

    int totalMinistries = existingMinistryIds.length;
    int processedMinistries = 0;

    for (final ministryId in existingMinistryIds) {
      final remoteData = await _remoteDataSource
          .getAgenciesByMinistryIdsNotInLocal(ministryId, existingAgencyIds);
      if (remoteData.isNotEmpty) {
        await _localDataSource.insertAgencies(remoteData);
      }
      processedMinistries++;
      yield 0.2 + (0.8 * (processedMinistries / totalMinistries));
    }
    yield 1.0;
  }

  @override
  Stream<double> seedMinistries() async* {
    yield 0.1;
    final existingIds = await _localDataSource.getExistingMinistryIds();
    yield 0.3;
    final remoteData = await _remoteDataSource.getMinistriesNotInLocal(
      existingIds,
    );
    yield 0.7;
    await _localDataSource.insertMinistries(remoteData);
    yield 1.0;
  }

  @override
  Stream<double> seedProjects() async* {
    yield 0.1;
    final existingIds = await _localDataSource.getExistingProjectIds();
    yield 0.3;
    final remoteData = await _remoteDataSource.getProjectsNotInLocal(
      existingIds,
    );
    yield 0.7;
    await _localDataSource.insertProjects(remoteData);
    yield 1.0;
  }

  @override
  Stream<double> seedUsers() async* {
    yield 0.1;
    final existingIds = await _localDataSource.getExistingUserIds();
    yield 0.3;
    final remoteData = await _remoteDataSource.getUsersNotInLocal(existingIds);
    yield 0.7;
    await _localDataSource.insertUsers(remoteData);
    yield 1.0;
  }

  @override
  Stream<int> watchAgenciesCount() => _localDataSource.watchAgenciesCount();

  @override
  Stream<int> watchMinistriesCount() => _localDataSource.watchMinistriesCount();

  @override
  Stream<int> watchProjectsCount() => _localDataSource.watchProjectsCount();

  @override
  Stream<int> watchUsersCount() => _localDataSource.watchUsersCount();

  @override
  Future<int> getRemoteUsersCount() => _remoteDataSource.getUsersCount();

  @override
  Future<int> getRemoteMinistriesCount() =>
      _remoteDataSource.getMinistriesCount();

  @override
  Future<int> getRemoteAgenciesCount() => _remoteDataSource.getAgenciesCount();

  @override
  Future<int> getRemoteProjectsCount() => _remoteDataSource.getProjectsCount();
}
