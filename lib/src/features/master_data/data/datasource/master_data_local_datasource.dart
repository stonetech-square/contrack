import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';
import 'package:injectable/injectable.dart';

abstract class MasterDataLocalDatasource {
  Stream<List<Ministry>> watchMinistries({String? query});
  Stream<List<AgencyWithMinistry>> watchAgencies({
    String? query,
    int? ministryId,
  });
  Future<Ministry> addMinistry({required String name, required String code});
  Future<Agency> addAgency({
    required String name,
    required String code,
    required int ministryId,
  });
  Future<void> updateMinistry(Ministry ministry);
  Future<void> updateAgency(Agency agency);
  Future<void> deleteMinistry(Ministry ministry);
  Future<void> deleteAgency(Agency agency);
  Future<Ministry?> getMinistryById(int id);
}

@LazySingleton(as: MasterDataLocalDatasource)
class MasterDataLocalDatasourceImpl implements MasterDataLocalDatasource {
  MasterDataLocalDatasourceImpl(this._database);
  final AppDatabase _database;

  @override
  Future<Ministry> addMinistry({
    required String name,
    required String code,
  }) async {
    final companion = MinistriesCompanion.insert(
      name: name,
      code: Value(code.toUpperCase()),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
      isActive: const Value(true),
      isSynced: const Value(false),
    );
    final id = await _database.into(_database.ministries).insert(companion);
    return (await (_database.select(
      _database.ministries,
    )..where((t) => t.id.equals(id))).getSingle());
  }

  @override
  Future<Agency> addAgency({
    required String name,
    required String code,
    required int ministryId,
  }) async {
    final companion = AgenciesCompanion.insert(
      name: name,
      code: Value(code.toUpperCase()),
      ministryId: ministryId,
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
      isSynced: const Value(false),
      isActive: const Value(true),
    );
    final id = await _database.into(_database.agencies).insert(companion);
    return (await (_database.select(
      _database.agencies,
    )..where((t) => t.id.equals(id))).getSingle());
  }

  @override
  Future<void> deleteMinistry(Ministry ministry) async {
    await _database.delete(_database.ministries).delete(ministry);
  }

  @override
  Future<void> deleteAgency(Agency agency) async {
    await _database.delete(_database.agencies).delete(agency);
  }

  @override
  Future<void> updateMinistry(Ministry ministry) async {
    final updatedMinistry = ministry.copyWith(
      isSynced: false,
      updatedAt: DateTime.now(),
    );
    await _database.update(_database.ministries).replace(updatedMinistry);
  }

  @override
  Future<void> updateAgency(Agency agency) async {
    final updatedAgency = agency.copyWith(
      isSynced: false,
      updatedAt: DateTime.now(),
    );
    await _database.update(_database.agencies).replace(updatedAgency);
  }

  @override
  Future<Ministry?> getMinistryById(int id) async {
    return (_database.select(
      _database.ministries,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  @override
  Stream<List<Ministry>> watchMinistries({String? query}) {
    final normalizedQuery = query?.trim().toLowerCase() ?? '';
    final baseQuery = _database.select(_database.ministries);
    if (normalizedQuery.isNotEmpty) {
      baseQuery.where(
        (tbl) =>
            tbl.name.lower().contains(normalizedQuery) |
            tbl.code.lower().contains(normalizedQuery),
      );
    }

    baseQuery.orderBy([
      (tbl) => OrderingTerm(expression: tbl.updatedAt, mode: OrderingMode.desc),
    ]);

    return baseQuery.watch();
  }

  @override
  Stream<List<AgencyWithMinistry>> watchAgencies({
    String? query,
    int? ministryId,
  }) {
    final normalizedQuery = query?.trim().toLowerCase() ?? '';

    final baseQuery = _database.select(_database.agencies).join([
      innerJoin(
        _database.ministries,
        _database.ministries.id.equalsExp(_database.agencies.ministryId),
      ),
    ]);

    if (normalizedQuery.isNotEmpty) {
      baseQuery.where(
        _database.agencies.name.lower().contains(normalizedQuery) |
            _database.agencies.code.lower().contains(normalizedQuery) |
            _database.ministries.name.lower().contains(normalizedQuery),
      );
    }

    if (ministryId != null) {
      baseQuery.where(_database.agencies.ministryId.equals(ministryId));
    }

    baseQuery.orderBy([
      OrderingTerm(
        expression: _database.agencies.updatedAt,
        mode: OrderingMode.desc,
      ),
    ]);

    return baseQuery.watch().map((rows) {
      return rows.map((row) {
        final agency = row.readTable(_database.agencies);
        final ministry = row.readTable(_database.ministries);

        return AgencyWithMinistry(agency: agency, ministry: ministry);
      }).toList();
    });
  }
}
