import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MasterDataRemoteDatasource {
  Future<String> addMinistry(Ministry ministry);
  Future<String> addAgency(AgencyWithMinistry agencyWithMinistry);
  Future<void> updateMinistry(Ministry ministry);
  Future<void> updateAgency(AgencyWithMinistry agencyWithMinistry);
  Future<void> deleteMinistry(Ministry ministry);
  Future<void> deleteAgency(Agency agency);
  Future<String?> getMinistryRemoteIdByCode(String? code);
}

@LazySingleton(as: MasterDataRemoteDatasource)
class MasterDataRemoteDatasourceImpl implements MasterDataRemoteDatasource {
  final SupabaseClient _supabase;

  MasterDataRemoteDatasourceImpl(this._supabase);

  @override
  Future<String> addMinistry(Ministry ministry) async {
    final data = {
      if (ministry.remoteId != null) 'id': ministry.remoteId,
      'name': ministry.name,
      'code': ministry.code,
      'is_active': ministry.isActive,
    };
    final result = await _supabase
        .from('ministries')
        .insert(data)
        .select('id')
        .single();
    return result['id'];
  }

  @override
  Future<String> addAgency(AgencyWithMinistry agencyWithMinistry) async {
    final agency = agencyWithMinistry.agency;
    final ministry = agencyWithMinistry.ministry;
    final ministryRemoteId = ministry.remoteId;

    if (ministryRemoteId == null) {
      throw Exception('Cannot add agency: Ministry has no remote ID');
    }

    final data = {
      if (agency.remoteId != null) 'id': agency.remoteId,
      'name': agency.name,
      'code': agency.code,
      'is_active': agency.isActive,
      'ministry_id': ministryRemoteId,
    };
    final result = await _supabase
        .from('agencies')
        .insert(data)
        .select('id')
        .single();
    return result['id'];
  }

  @override
  Future<void> updateMinistry(Ministry ministry) async {
    if (ministry.remoteId == null) return;
    await _supabase
        .from('ministries')
        .update({
          'name': ministry.name,
          'code': ministry.code,
          'is_active': ministry.isActive,
        })
        .eq('id', ministry.remoteId!);
  }

  @override
  Future<void> updateAgency(AgencyWithMinistry agencyWithMinistry) async {
    final agency = agencyWithMinistry.agency;
    final ministry = agencyWithMinistry.ministry;
    final ministryRemoteId = ministry.remoteId;

    if (agency.remoteId == null) return;
    if (ministryRemoteId == null) {
      throw Exception('Cannot sync agency update: Ministry has no remote ID');
    }

    await _supabase
        .from('agencies')
        .update({
          'name': agency.name,
          'code': agency.code,
          'is_active': agency.isActive,
          'ministry_id': ministryRemoteId,
        })
        .eq('id', agency.remoteId!);
  }

  @override
  Future<void> deleteMinistry(Ministry ministry) async {
    if (ministry.remoteId == null) return;
    await _supabase.from('ministries').delete().eq('id', ministry.remoteId!);
  }

  @override
  Future<void> deleteAgency(Agency agency) async {
    if (agency.remoteId == null) return;
    await _supabase.from('agencies').delete().eq('id', agency.remoteId!);
  }

  @override
  Future<String?> getMinistryRemoteIdByCode(String? code) async {
    if (code == null || code.isEmpty) return null;
    final result = await _supabase
        .from('ministries')
        .select('id')
        .eq('code', code)
        .maybeSingle();
    return result?['id'] as String?;
  }
}
