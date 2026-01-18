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
    final agencyIdStr = data['agency_id'] as String;
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);

    final agency = await (_database.select(
      _database.agencies,
    )..where((t) => t.remoteId.equals(agencyIdStr))).getSingleOrNull();

    if (agency == null) {
      _logger.warning(
        'Cannot sync ministry $name: Agency $agencyIdStr not found locally',
      );
      return;
    }

    final localRecord = await (_database.select(
      _database.ministries,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeMinistryDigest(
        localRecord.name,
        localRecord.code,
        localRecord.isActive,
        localRecord.agencyId,
        localRecord.createdAt,
        localRecord.updatedAt,
      );
      final remoteDigest = _computeMinistryDigest(
        name,
        code,
        isActive ?? true,
        agency.id,
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
      agencyId: Value(agency.id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
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
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);

    final companion = db.AgenciesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      isActive: Value(isActive ?? true),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );

    final localRecord = await (_database.select(
      _database.agencies,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeAgencyDigest(
        localRecord.name,
        localRecord.code,
        localRecord.isActive,
        localRecord.createdAt,
        localRecord.updatedAt,
      );
      final remoteDigest = _computeAgencyDigest(
        name,
        code,
        isActive ?? true,
        createdAt,
        updatedAt,
      );

      if (localDigest == remoteDigest) return;
    }

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
    int? agencyId,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    return Object.hash(name, code, isActive, agencyId, createdAt, updatedAt);
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
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    return Object.hash(name, code, isActive, createdAt, updatedAt);
  }
}
