abstract class SeedingRepository {
  Stream<double> seedUsers();
  Stream<double> seedMinistries();
  Stream<double> seedAgencies();
  Stream<double> seedProjects();

  Stream<int> watchUsersCount();
  Stream<int> watchMinistriesCount();
  Stream<int> watchAgenciesCount();
  Stream<int> watchProjectsCount();

  Future<int> getRemoteUsersCount();
  Future<int> getRemoteMinistriesCount();
  Future<int> getRemoteAgenciesCount();
  Future<int> getRemoteProjectsCount();
}
