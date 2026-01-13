import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/utils/project_code_generator.dart';
import 'package:drift/drift.dart';

/// Utility class for creating test projects for development purposes (TODO: delete after)
class TestProjectCreator {
  final AppDatabase database;
  final ProjectCodeGenerator codeGenerator;

  TestProjectCreator(this.database, this.codeGenerator);

  Future<int> createTestProject({
    required int userId,
    required String userUid,
    int? agencyId,
    int? ministryId,
    int? stateId,
    int? zoneId,
  }) async {
    final effectiveAgencyId = agencyId ?? await _getFirstAgencyId();
    final effectiveMinistryId = ministryId ?? await _getFirstMinistryId();
    final effectiveStateId = stateId ?? await _getFirstStateId();
    final effectiveZoneId = zoneId ?? await _getFirstZoneId();

    if (effectiveAgencyId == null ||
        effectiveMinistryId == null ||
        effectiveStateId == null ||
        effectiveZoneId == null) {
      throw Exception(
        'Cannot create test project: Missing required reference data (agencies, ministries, states, or zones)',
      );
    }

    final timestamp = DateTime.now();
    final projectCode = codeGenerator.generate(userUid, timestamp);

    final companion = ProjectsCompanion.insert(
      code: projectCode,
      status: ProjectStatus.ongoing,
      agencyId: effectiveAgencyId,
      ministryId: effectiveMinistryId,
      stateId: effectiveStateId,
      zoneId: effectiveZoneId,
      constituency:
          'Test Constituency ${timestamp.millisecondsSinceEpoch % 100}',
      amount: 5000000.0 + (timestamp.millisecondsSinceEpoch % 10000000),
      title: 'Test Project - ${timestamp.toIso8601String().split('T').first}',
      createdBy: userId,
      sponsor: const Value('Test Sponsor'),
      createdAt: Value(timestamp),
      updatedAt: Value(timestamp),
    );

    return await database.into(database.projects).insert(companion);
  }

  Future<int?> _getFirstAgencyId() async {
    final query = database.select(database.agencies)..limit(1);
    final result = await query.getSingleOrNull();
    return result?.id;
  }

  Future<int?> _getFirstMinistryId() async {
    final query = database.select(database.ministries)..limit(1);
    final result = await query.getSingleOrNull();
    return result?.id;
  }

  Future<int?> _getFirstStateId() async {
    final query = database.select(database.states)..limit(1);
    final result = await query.getSingleOrNull();
    return result?.id;
  }

  Future<int?> _getFirstZoneId() async {
    final query = database.select(database.geopoliticalZones)..limit(1);
    final result = await query.getSingleOrNull();
    return result?.id;
  }

  Future<void> seedReferenceDataIfNeeded() async {
    final agencyCount =
        await (database.selectOnly(database.agencies)
              ..addColumns([database.agencies.id.count()]))
            .getSingle()
            .then((row) => row.read(database.agencies.id.count()) ?? 0);

    if (agencyCount == 0) {
      await _seedReferenceData();
    }
  }

  Future<void> _seedReferenceData() async {
    final zoneId1 = await database
        .into(database.geopoliticalZones)
        .insert(
          GeopoliticalZonesCompanion.insert(
            name: 'South South',
            code: const Value('SS'),
          ),
        );

    final zoneId2 = await database
        .into(database.geopoliticalZones)
        .insert(
          GeopoliticalZonesCompanion.insert(
            name: 'North West',
            code: const Value('NW'),
          ),
        );

    await database
        .into(database.states)
        .insert(
          StatesCompanion.insert(
            name: 'Enugu',
            zoneId: zoneId1,
            code: const Value('EN'),
          ),
        );

    await database
        .into(database.states)
        .insert(
          StatesCompanion.insert(
            name: 'Kaduna',
            zoneId: zoneId2,
            code: const Value('KD'),
          ),
        );

    await database
        .into(database.states)
        .insert(
          StatesCompanion.insert(
            name: 'Rivers',
            zoneId: zoneId1,
            code: const Value('RV'),
          ),
        );

    await database
        .into(database.states)
        .insert(
          StatesCompanion.insert(
            name: 'FCT',
            zoneId: zoneId2,
            code: const Value('FCT'),
          ),
        );

    final agencyId1 = await database
        .into(database.agencies)
        .insert(
          AgenciesCompanion.insert(
            name: 'Federal Roads Maintenance Agency (FERMA)',
            code: const Value('FERMA'),
          ),
        );

    final agencyId2 = await database
        .into(database.agencies)
        .insert(
          AgenciesCompanion.insert(
            name: 'Rural Electrification Agency (REA)',
            code: const Value('REA'),
          ),
        );

    final agencyId3 = await database
        .into(database.agencies)
        .insert(
          AgenciesCompanion.insert(
            name: 'Small and Medium Enterprises Development Agency (SMEDAN)',
            code: const Value('SMEDAN'),
          ),
        );

    final agencyId4 = await database
        .into(database.agencies)
        .insert(
          AgenciesCompanion.insert(
            name: 'Federal Housing Authority',
            code: const Value('FHA'),
          ),
        );

    await database
        .into(database.ministries)
        .insert(
          MinistriesCompanion.insert(
            name: 'Ministry of Works',
            agencyId: agencyId1,
            code: const Value('MOW'),
          ),
        );

    await database
        .into(database.ministries)
        .insert(
          MinistriesCompanion.insert(
            name: 'Ministry of Power',
            agencyId: agencyId2,
            code: const Value('MOP'),
          ),
        );

    await database
        .into(database.ministries)
        .insert(
          MinistriesCompanion.insert(
            name: 'Ministry of Trade and Investment',
            agencyId: agencyId3,
            code: const Value('MTI'),
          ),
        );

    await database
        .into(database.ministries)
        .insert(
          MinistriesCompanion.insert(
            name: 'Ministry of Housing',
            agencyId: agencyId4,
            code: const Value('MOH'),
          ),
        );
  }
}
