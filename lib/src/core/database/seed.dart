import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class DatabaseSeeder {
  final AppDatabase database;
  final SupabaseClient supabase;
  final Logger _logger = Logger('DatabaseSeeder');

  DatabaseSeeder(this.database, this.supabase);

  Future<void> seedAll() async {
    await seedGeopoliticalZones();
    await seedStates();
    await seedMinistries();
    await seedAgencies();
  }

  Future<void> seedGeopoliticalZones() async {
    try {
      final response = await supabase
          .from('geopolitical_zones')
          .select('id, name, code, created_at');

      final zones = (response as List).map((json) {
        return GeopoliticalZonesCompanion.insert(
          name: json['name'] as String,
          code: Value(json['code'] as String?),
          remoteId: Value(json['id'] as String),
        );
      }).toList();

      for (final zone in zones) {
        await database
            .into(database.geopoliticalZones)
            .insert(zone, mode: InsertMode.insertOrIgnore);
      }
      _logger.info('Seeded ${zones.length} Geopolitical Zones');
    } catch (e) {
      _logger.severe('Failed to seed Geopolitical Zones: $e');
    }
  }

  Future<void> seedStates() async {
    try {
      final response = await supabase
          .from('states')
          .select('id, name, code, zone_id, created_at');

      final states = await Future.wait(
        (response as List).map((json) async {
          final remoteZoneId = json['zone_id'] as String;
          final localZone =
              await (database.geopoliticalZones.select()
                    ..where((tbl) => tbl.remoteId.equals(remoteZoneId)))
                  .getSingleOrNull();

          if (localZone == null) {
            _logger.warning(
              'Skipping state ${json['name']}: referencing unknown zone $remoteZoneId',
            );
            return null;
          }

          return StatesCompanion.insert(
            name: json['name'] as String,
            code: Value(json['code'] as String?),
            zoneId: localZone.id,
            remoteId: Value(json['id'] as String),
          );
        }),
      );

      var count = 0;
      for (final state in states.whereType<StatesCompanion>()) {
        await database
            .into(database.states)
            .insert(state, mode: InsertMode.insertOrIgnore);
        count++;
      }
      _logger.info('Seeded $count States');
    } catch (e) {
      _logger.severe('Failed to seed States: $e');
    }
  }

  Future<void> seedMinistries() async {
    try {
      final response = await supabase
          .from('ministries')
          .select('id, name, code, is_active, created_at');

      final ministries = (response as List).map((json) {
        return MinistriesCompanion.insert(
          name: json['name'] as String,
          code: Value(json['code'] as String?),
          isActive: Value(json['is_active'] as bool? ?? true),
          remoteId: Value(json['id'] as String),
        );
      }).toList();

      for (final ministry in ministries) {
        await database
            .into(database.ministries)
            .insert(ministry, mode: InsertMode.insertOrIgnore);
      }
      _logger.info('Seeded ${ministries.length} Ministries');
    } catch (e) {
      _logger.severe('Failed to seed Ministries: $e');
    }
  }

  Future<void> seedAgencies() async {
    try {
      final response = await supabase
          .from('agencies')
          .select('id, name, code, ministry_id, is_active, created_at');

      final agencies = await Future.wait(
        (response as List).map((json) async {
          final remoteMinistryId = json['ministry_id'] as String;
          final localMinistry =
              await (database.ministries.select()
                    ..where((tbl) => tbl.remoteId.equals(remoteMinistryId)))
                  .getSingleOrNull();

          if (localMinistry == null) {
            _logger.warning(
              'Skipping agency ${json['name']}: referencing unknown ministry $remoteMinistryId',
            );
            return null;
          }

          return AgenciesCompanion.insert(
            name: json['name'] as String,
            code: Value(json['code'] as String?),
            ministryId: localMinistry.id,
            remoteId: Value(json['id'] as String),
            isActive: Value(json['is_active'] as bool? ?? true),
          );
        }),
      );

      var count = 0;
      for (final agency in agencies.whereType<AgenciesCompanion>()) {
        await database
            .into(database.agencies)
            .insert(agency, mode: InsertMode.insertOrIgnore);
        count++;
      }
      _logger.info('Seeded $count Agencies');
    } catch (e) {
      _logger.severe('Failed to seed Agencies: $e');
    }
  }

  Future<bool> isSeeded() async {
    try {
      final count = await database.geopoliticalZones.count().getSingle();
      return count > 0;
    } catch (e) {
      _logger.severe('Failed to check if seeded: $e');
      return false;
    }
  }
}
