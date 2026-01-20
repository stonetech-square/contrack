import 'package:contrack/src/core/database/database.dart' as db;
import 'package:drift/drift.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MetadataSyncDelegate {
  final db.AppDatabase _database;
  final SupabaseClient _supabase;
  final Logger _logger = Logger('MetadataSyncDelegate');

  MetadataSyncDelegate(this._database, this._supabase);

  Future<List<Map<String, dynamic>>> fetchRemoteGeopoliticalZones() async {
    final response = await _supabase.from('geopolitical_zones').select();
    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> fetchRemoteAgencies() async {
    final response = await _supabase.from('agencies').select();
    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> fetchRemoteMinistries() async {
    final response = await _supabase.from('ministries').select();
    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> fetchRemoteStates() async {
    final response = await _supabase.from('states').select();
    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> upsertRemoteGeopoliticalZone(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final createdAt = DateTime.parse(data['created_at'] as String);

    final localRecord = await (_database.select(
      _database.geopoliticalZones,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeGeopoliticalZoneDigest(
        localRecord.name,
        localRecord.code,
        localRecord.createdAt,
      );
      final remoteDigest = _computeGeopoliticalZoneDigest(
        name,
        code,
        createdAt,
      );

      if (localDigest == remoteDigest) return;
    }

    final companion = db.GeopoliticalZonesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      createdAt: Value(createdAt),
    );

    await _database
        .into(_database.geopoliticalZones)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.geopoliticalZones.name],
          ),
        );
  }

  Future<void> upsertRemoteMinistry(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final isActive = data['is_active'] as bool?;
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);

    final localRecord = await (_database.select(
      _database.ministries,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeMinistryDigest(
        localRecord.name,
        localRecord.code,
        localRecord.isActive,
        localRecord.createdAt,
        localRecord.updatedAt,
      );
      final remoteDigest = _computeMinistryDigest(
        name,
        code,
        isActive ?? true,
        createdAt,
        updatedAt,
      );

      if (localDigest == remoteDigest) return;
    }

    final companion = db.MinistriesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      isActive: Value(isActive ?? true),
      isSynced: const Value(true),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastSyncedAt: Value(DateTime.now()),
    );

    await _database
        .into(_database.ministries)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.ministries.name],
          ),
        );
  }

  Future<void> upsertRemoteState(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final zoneIdStr = data['zone_id'] as String;
    final createdAt = DateTime.parse(data['created_at'] as String);

    final zone = await (_database.select(
      _database.geopoliticalZones,
    )..where((t) => t.remoteId.equals(zoneIdStr))).getSingleOrNull();

    if (zone == null) {
      _logger.warning(
        'Cannot sync state $name: Zone $zoneIdStr not found locally',
      );
      return;
    }

    final localRecord = await (_database.select(
      _database.states,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeStateDigest(
        localRecord.name,
        localRecord.code,
        localRecord.zoneId,
        localRecord.createdAt,
      );
      final remoteDigest = _computeStateDigest(name, code, zone.id, createdAt);

      if (localDigest == remoteDigest) return;
    }

    final companion = db.StatesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      zoneId: Value(zone.id),
      createdAt: Value(createdAt),
    );

    await _database
        .into(_database.states)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.states.name],
          ),
        );
  }

  Future<void> upsertRemoteAgency(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final isActive = data['is_active'] as bool?;
    final ministryIdStr = data['ministry_id'] as String;
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);

    final ministry = await (_database.select(
      _database.ministries,
    )..where((t) => t.remoteId.equals(ministryIdStr))).getSingleOrNull();

    if (ministry == null) {
      _logger.warning(
        'Cannot sync agency $name: Ministry $ministryIdStr not found locally',
      );
      return;
    }

    final localRecord = await (_database.select(
      _database.agencies,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeAgencyDigest(
        localRecord.name,
        localRecord.code,
        localRecord.isActive,
        localRecord.ministryId,
        localRecord.createdAt,
        localRecord.updatedAt,
      );
      final remoteDigest = _computeAgencyDigest(
        name,
        code,
        isActive ?? true,
        ministry.id,
        createdAt,
        updatedAt,
      );

      if (localDigest == remoteDigest) return;
    }

    final companion = db.AgenciesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      isActive: Value(isActive ?? true),
      ministryId: Value(ministry.id),
      isSynced: const Value(true),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastSyncedAt: Value(DateTime.now()),
    );

    await _database
        .into(_database.agencies)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.agencies.name],
          ),
        );
  }

  int _computeGeopoliticalZoneDigest(
    String? name,
    String? code,
    DateTime createdAt,
  ) {
    return Object.hash(name, code, createdAt);
  }

  int _computeMinistryDigest(
    String? name,
    String? code,
    bool? isActive,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    return Object.hash(name, code, isActive, createdAt, updatedAt);
  }

  int _computeStateDigest(
    String? name,
    String? code,
    int? zoneId,
    DateTime createdAt,
  ) {
    return Object.hash(name, code, zoneId, createdAt);
  }

  int _computeAgencyDigest(
    String? name,
    String? code,
    bool? isActive,
    int? ministryId,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    return Object.hash(name, code, isActive, ministryId, createdAt, updatedAt);
  }

  // Push methods for local-to-remote sync

  Future<List<db.Agency>> getUnsyncedAgencies({required int limit}) async {
    return (_database.select(_database.agencies)
          ..where((t) => t.isSynced.equals(false))
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ])
          ..limit(limit))
        .get();
  }

  Future<List<db.Ministry>> getUnsyncedMinistries({required int limit}) async {
    return (_database.select(_database.ministries)
          ..where((t) => t.isSynced.equals(false))
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ])
          ..limit(limit))
        .get();
  }

  Future<void> pushAgency(db.Agency agency) async {
    // Get the ministry's remoteId for the foreign key reference
    final ministry = await (_database.select(_database.ministries)
          ..where((t) => t.id.equals(agency.ministryId)))
        .getSingleOrNull();

    if (ministry == null || ministry.remoteId == null) {
      _logger.warning(
        'Cannot push agency ${agency.name}: Ministry not found or not synced',
      );
      return;
    }

    if (agency.remoteId == null) {
      await _insertAgency(agency, ministry.remoteId!);
    } else {
      await _updateAgency(agency, ministry.remoteId!);
    }
  }

  Future<void> _insertAgency(db.Agency agency, String ministryRemoteId) async {
    final response = await _supabase
        .from('agencies')
        .insert({
          'name': agency.name,
          'code': agency.code,
          'ministry_id': ministryRemoteId,
          'is_active': agency.isActive,
          'created_at': agency.createdAt.toIso8601String(),
          'updated_at': agency.updatedAt.toIso8601String(),
        })
        .select('id')
        .single();

    final remoteId = response['id'] as String;

    await (_database.update(_database.agencies)
          ..where((t) => t.id.equals(agency.id)))
        .write(db.AgenciesCompanion(
          remoteId: Value(remoteId),
          isSynced: const Value(true),
          lastSyncedAt: Value(DateTime.now()),
        ));

    _logger.info('Inserted agency ${agency.name} with remoteId $remoteId');
  }

  Future<void> _updateAgency(db.Agency agency, String ministryRemoteId) async {
    await _supabase
        .from('agencies')
        .update({
          'name': agency.name,
          'code': agency.code,
          'ministry_id': ministryRemoteId,
          'is_active': agency.isActive,
          'updated_at': agency.updatedAt.toIso8601String(),
        })
        .eq('id', agency.remoteId!);

    await (_database.update(_database.agencies)
          ..where((t) => t.id.equals(agency.id)))
        .write(db.AgenciesCompanion(
          isSynced: const Value(true),
          lastSyncedAt: Value(DateTime.now()),
        ));

    _logger.info('Updated agency ${agency.name}');
  }

  Future<void> pushMinistry(db.Ministry ministry) async {
    if (ministry.remoteId == null) {
      await _insertMinistry(ministry);
    } else {
      await _updateMinistry(ministry);
    }
  }

  Future<void> _insertMinistry(db.Ministry ministry) async {
    final response = await _supabase
        .from('ministries')
        .insert({
          'name': ministry.name,
          'code': ministry.code,
          'is_active': ministry.isActive,
          'created_at': ministry.createdAt.toIso8601String(),
          'updated_at': ministry.updatedAt.toIso8601String(),
        })
        .select('id')
        .single();

    final remoteId = response['id'] as String;

    await (_database.update(_database.ministries)
          ..where((t) => t.id.equals(ministry.id)))
        .write(db.MinistriesCompanion(
          remoteId: Value(remoteId),
          isSynced: const Value(true),
          lastSyncedAt: Value(DateTime.now()),
        ));

    _logger.info('Inserted ministry ${ministry.name} with remoteId $remoteId');
  }

  Future<void> _updateMinistry(db.Ministry ministry) async {
    await _supabase
        .from('ministries')
        .update({
          'name': ministry.name,
          'code': ministry.code,
          'is_active': ministry.isActive,
          'updated_at': ministry.updatedAt.toIso8601String(),
        })
        .eq('id', ministry.remoteId!);

    await (_database.update(_database.ministries)
          ..where((t) => t.id.equals(ministry.id)))
        .write(db.MinistriesCompanion(
          isSynced: const Value(true),
          lastSyncedAt: Value(DateTime.now()),
        ));

    _logger.info('Updated ministry ${ministry.name}');
  }
}
