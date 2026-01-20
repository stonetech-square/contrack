import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';
import 'package:injectable/injectable.dart';

abstract class MasterDataLocalDatasource {
  Stream<List<Agency>> watchAgencies({String? query});
  Stream<List<MinistryWithAgency>> watchMinistries({
    String? query,
    int? agencyId,
  });
  Future<void> addAgency(Agency agency);
  Future<void> addMinistry(Ministry ministry);
  Future<void> updateAgency(Agency agency);
  Future<void> updateMinistry(Ministry ministry);
  Future<void> deleteAgency(Agency agency);
  Future<void> deleteMinistry(Ministry ministry);
  Future<Agency?> getAgencyById(int id);
}

@LazySingleton(as: MasterDataLocalDatasource)
class MasterDataLocalDatasourceImpl implements MasterDataLocalDatasource {
  MasterDataLocalDatasourceImpl(this._database);
  final AppDatabase _database;

  @override
  Future<void> addAgency(Agency agency) async {
    await _database
        .into(_database.agencies)
        .insert(agency, mode: InsertMode.insertOrIgnore);
  }

  @override
  Future<void> addMinistry(Ministry ministry) async {
    await _database
        .into(_database.ministries)
        .insert(ministry, mode: InsertMode.insertOrIgnore);
  }

  @override
  Future<void> deleteAgency(Agency agency) async {
    await _database.delete(_database.agencies).delete(agency);
  }

  @override
  Future<void> deleteMinistry(Ministry ministry) async {
    await _database.delete(_database.ministries).delete(ministry);
  }

  @override
  Future<void> updateAgency(Agency agency) async {
    await _database.update(_database.agencies).replace(agency);
  }

  @override
  Future<void> updateMinistry(Ministry ministry) async {
    await _database.update(_database.ministries).replace(ministry);
  }

  @override
  Future<Agency?> getAgencyById(int id) async {
    return (_database.select(
      _database.agencies,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  @override
  Stream<List<Agency>> watchAgencies({String? query}) {
    final normalizedQuery = query?.trim().toLowerCase() ?? '';
    final baseQuery = _database.select(_database.agencies);
    if (normalizedQuery.isNotEmpty) {
      baseQuery.where(
        (tbl) =>
            tbl.name.lower().contains(normalizedQuery) |
            tbl.code.lower().contains(normalizedQuery),
      );
    }

    return baseQuery.watch();
  }

  @override
  Stream<List<MinistryWithAgency>> watchMinistries({
    String? query,
    int? agencyId,
  }) {
    final normalizedQuery = query?.trim().toLowerCase() ?? '';

    final baseQuery = _database.select(_database.ministries).join([
      innerJoin(
        _database.agencies,
        _database.agencies.id.equalsExp(_database.ministries.agencyId),
      ),
    ]);

    if (normalizedQuery.isNotEmpty) {
      baseQuery.where(
        _database.ministries.name.lower().contains(normalizedQuery) |
            _database.ministries.code.lower().contains(normalizedQuery) |
            _database.agencies.name.lower().contains(normalizedQuery),
      );
    }

    if (agencyId != null) {
      baseQuery.where(_database.ministries.agencyId.equals(agencyId));
    }

    return baseQuery.watch().map((rows) {
      return rows.map((row) {
        final ministry = row.readTable(_database.ministries);
        final agency = row.readTable(_database.agencies);

        return MinistryWithAgency(ministry: ministry, agency: agency);
      }).toList();
    });
  }
}
