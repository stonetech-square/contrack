import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';

abstract class MasterDataRepository {
  Stream<List<Ministry>> watchMinistries({String? query});
  Stream<List<AgencyWithMinistry>> watchAgencies({
    String? query,
    int? ministryId,
  });
  Future<void> addMinistry({required String name, required String code});
  Future<void> addAgency({
    required String name,
    required String code,
    required int ministryId,
    String? ministryRemoteId,
  });
  Future<void> updateMinistry(Ministry ministry);
  Future<void> updateAgency(Agency agency);
  Future<void> deleteMinistry(Ministry ministry);
  Future<void> deleteAgency(Agency agency);
}
