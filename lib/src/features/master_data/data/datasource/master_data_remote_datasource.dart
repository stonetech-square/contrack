import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MasterDataRemoteDatasource {
  Future<void> addAgency(Agency agency);
  Future<void> addMinistry(MinistryWithAgency ministryWithAgency);
  Future<void> updateAgency(Agency agency);
  Future<void> updateMinistry(MinistryWithAgency ministryWithAgency);
  Future<void> deleteAgency(Agency agency);
  Future<void> deleteMinistry(Ministry ministry);
}

@LazySingleton(as: MasterDataRemoteDatasource)
class MasterDataRemoteDatasourceImpl implements MasterDataRemoteDatasource {
  final SupabaseClient _supabase;

  MasterDataRemoteDatasourceImpl(this._supabase);

  @override
  Future<void> addAgency(Agency agency) async {
    final data = {
      if (agency.remoteId != null) 'id': agency.remoteId,
      'name': agency.name,
      'code': agency.code,
      'is_active': agency.isActive,
    };
    await _supabase.from('agencies').insert(data);
  }

  @override
  Future<void> addMinistry(MinistryWithAgency ministryWithAgency) async {
    final ministry = ministryWithAgency.ministry;
    final agency = ministryWithAgency.agency;
    final agencyRemoteId = agency.remoteId;

    if (agencyRemoteId == null) {
      throw Exception('Cannot add ministry: Agency has no remote ID');
    }

    final data = {
      if (ministry.remoteId != null) 'id': ministry.remoteId,
      'name': ministry.name,
      'code': ministry.code,
      'is_active': ministry.isActive,
      'agency_id': agencyRemoteId,
    };
    await _supabase.from('ministries').insert(data);
  }

  @override
  Future<void> updateAgency(Agency agency) async {
    if (agency.remoteId == null) return;
    await _supabase
        .from('agencies')
        .update({
          'name': agency.name,
          'code': agency.code,
          'is_active': agency.isActive,
        })
        .eq('id', agency.remoteId!);
  }

  @override
  Future<void> updateMinistry(MinistryWithAgency ministryWithAgency) async {
    final ministry = ministryWithAgency.ministry;
    final agency = ministryWithAgency.agency;
    final agencyRemoteId = agency.remoteId;

    if (ministry.remoteId == null) return;
    if (agencyRemoteId == null) {
      throw Exception('Cannot sync ministry update: Agency has no remote ID');
    }

    await _supabase
        .from('ministries')
        .update({
          'name': ministry.name,
          'code': ministry.code,
          'is_active': ministry.isActive,
          'agency_id': agencyRemoteId,
        })
        .eq('id', ministry.remoteId!);
  }

  @override
  Future<void> deleteAgency(Agency agency) async {
    if (agency.remoteId == null) return;
    await _supabase.from('agencies').delete().eq('id', agency.remoteId!);
  }

  @override
  Future<void> deleteMinistry(Ministry ministry) async {
    if (ministry.remoteId == null) return;
    await _supabase.from('ministries').delete().eq('id', ministry.remoteId!);
  }
}
