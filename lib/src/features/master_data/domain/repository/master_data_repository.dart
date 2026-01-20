import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';

abstract class MasterDataRepository {
  Stream<List<Agency>> watchAgencies({String? query});
  Stream<List<MinistryWithAgency>> watchMinistries({String? query, int? agencyId});
  Future<void> addAgency(Agency agency);
  Future<void> addMinistry(Ministry ministry);
  Future<void> updateAgency(Agency agency);
  Future<void> updateMinistry(Ministry ministry);
  Future<void> deleteAgency(Agency agency);
  Future<void> deleteMinistry(Ministry ministry);
}
