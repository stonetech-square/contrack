import 'package:contrack/src/core/common/models/user_profile_model.dart';
import 'package:contrack/src/features/seeding/data/models/seed_agency_model.dart';
import 'package:contrack/src/features/seeding/data/models/seed_ministry_model.dart';
import 'package:contrack/src/features/seeding/data/models/seed_project_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SeedingRemoteDataSource {
  Future<List<UserProfileModel>> getUsersNotInLocal(
    List<String> usersInLocalIds,
  );

  Future<List<SeedMinistryModel>> getMinistriesNotInLocal(
    List<String> ministriesInLocalIds,
  );
  Future<List<SeedAgencyModel>> getAgenciesByMinistryIdsNotInLocal(
    String ministryId,
    List<String> agenciesInLocalIds,
  );
  Future<List<SeedProjectModel>> getProjectsNotInLocal(
    List<String> projectsInLocalIds,
  );

  Future<int> getUsersCount();
  Future<int> getMinistriesCount();
  Future<int> getAgenciesCount();
  Future<int> getProjectsCount();
}

@LazySingleton(as: SeedingRemoteDataSource)
class SeedingRemoteDataSourceImpl implements SeedingRemoteDataSource {
  final SupabaseClient _supabase;
  SeedingRemoteDataSourceImpl(this._supabase);
  @override
  Future<List<UserProfileModel>> getUsersNotInLocal(
    List<String> usersInLocalIds,
  ) async {
    var query = _supabase
        .from('profiles')
        .select('*, user_roles!profile_id(role, is_active)');

    if (usersInLocalIds.isNotEmpty && usersInLocalIds.length <= 20) {
      query = query.not('id', 'in', '(${usersInLocalIds.join(',')})');
    }
    return query
        .order('created_at', ascending: false)
        .withConverter(
          (data) =>
              (data as List).map((e) => UserProfileModel.fromJson(e)).toList(),
        );
  }

  @override
  Future<List<SeedMinistryModel>> getMinistriesNotInLocal(
    List<String> ministriesInLocalIds,
  ) async {
    var query = _supabase.from('ministries').select();

    if (ministriesInLocalIds.isNotEmpty && ministriesInLocalIds.length <= 20) {
      query = query.not('id', 'in', '(${ministriesInLocalIds.join(',')})');
    }

    return query
        .order('created_at', ascending: false)
        .withConverter(
          (data) =>
              (data as List).map((e) => SeedMinistryModel.fromJson(e)).toList(),
        );
  }

  @override
  Future<List<SeedAgencyModel>> getAgenciesByMinistryIdsNotInLocal(
    String ministryId,
    List<String> agenciesInLocalIds,
  ) async {
    var query = _supabase
        .from('agencies')
        .select()
        .eq('ministry_id', ministryId);

    if (agenciesInLocalIds.isNotEmpty && agenciesInLocalIds.length <= 20) {
      query = query.not('id', 'in', '(${agenciesInLocalIds.join(',')})');
    }
    return query
        .order('created_at', ascending: false)
        .withConverter(
          (data) =>
              (data as List).map((e) => SeedAgencyModel.fromJson(e)).toList(),
        );
  }

  @override
  Future<List<SeedProjectModel>> getProjectsNotInLocal(
    List<String> projectsInLocalIds,
  ) async {
    var query = _supabase.from('projects').select();

    if (projectsInLocalIds.isNotEmpty && projectsInLocalIds.length <= 20) {
      query = query.not('id', 'in', '(${projectsInLocalIds.join(',')})');
    }

    return query
        .order('created_at', ascending: false)
        .limit(10)
        .withConverter(
          (data) =>
              (data as List).map((e) => SeedProjectModel.fromJson(e)).toList(),
        );
  }

  @override
  Future<int> getUsersCount() async {
    return _supabase.from('profiles').count(CountOption.exact);
  }

  @override
  Future<int> getMinistriesCount() async {
    return _supabase.from('ministries').count(CountOption.exact);
  }

  @override
  Future<int> getAgenciesCount() async {
    return _supabase.from('agencies').count(CountOption.exact);
  }

  @override
  Future<int> getProjectsCount() async {
    return _supabase.from('projects').count(CountOption.exact);
  }
}
