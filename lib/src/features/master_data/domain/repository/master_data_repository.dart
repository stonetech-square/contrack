import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';

abstract class MasterDataRepository {
  Stream<List<Agency>> watchAgencies({String? query});
  Stream<List<MinistryWithAgency>> watchMinistries({
    String? query,
    int? agencyId,
  });
  Future<void> addAgency({required String name, required String code});
  Future<void> addMinistry({
    required String name,
    required String code,
    required int agencyId,
    String? agencyRemoteId,
  });
  Future<void> updateAgency(Agency agency);
  Future<void> updateMinistry(Ministry ministry);
  Future<void> deleteAgency(Agency agency);
  Future<void> deleteMinistry(Ministry ministry);
}
