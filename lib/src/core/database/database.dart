import 'dart:io';

import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/tables/tables.dart';
import 'package:contrack/src/core/utils/constants.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Projects,
    States,
    Ministries,
    Agencies,
    GeopoliticalZones,
    AuditLogs,
    ExportHistory,
    Sessions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 4;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationSupportDirectory();
      final file = File(p.join(dbFolder.path, 'contrack_dev.sqlite'));

      return NativeDatabase.createInBackground(
        file,
        setup: (rawDb) {
          final isCipherAvailable = rawDb
              .select('PRAGMA cipher_version;')
              .isNotEmpty;
          if (isCipherAvailable) {
            rawDb.execute("PRAGMA key = '${AppConstants.localDbKey}';");
          } else {
            debugPrint(
              'Warning: SQLCipher not available, falling back to plain text',
            );
          }
          rawDb.config.doubleQuotedStringLiterals = false;
        },
      );
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await _createWithIndexes(m);
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        // Add isSynced and lastSyncedAt columns to agencies table
        await customStatement(
          'ALTER TABLE agencies ADD COLUMN is_synced INTEGER NOT NULL DEFAULT 0',
        );
        await customStatement(
          'ALTER TABLE agencies ADD COLUMN last_synced_at INTEGER',
        );
        // Add isSynced and lastSyncedAt columns to ministries table
        await customStatement(
          'ALTER TABLE ministries ADD COLUMN is_synced INTEGER NOT NULL DEFAULT 0',
        );
        await customStatement(
          'ALTER TABLE ministries ADD COLUMN last_synced_at INTEGER',
        );
        // Mark existing records with remoteId as synced
        await customStatement(
          'UPDATE agencies SET is_synced = 1 WHERE remote_id IS NOT NULL',
        );
        await customStatement(
          'UPDATE ministries SET is_synced = 1 WHERE remote_id IS NOT NULL',
        );
      }
      if (from < 4) {
        // Major refactor: Ministry now comes before Agency (Ministry has many Agencies)
        // Drop old tables and recreate with correct relationship
        await customStatement('PRAGMA foreign_keys = OFF');
        await customStatement('DROP TABLE IF EXISTS ministries');
        await customStatement('DROP TABLE IF EXISTS agencies');

        // Create ministries table first (parent table)
        await customStatement('''
          CREATE TABLE ministries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE,
            code TEXT,
            remote_id TEXT,
            is_active INTEGER NOT NULL DEFAULT 1,
            is_synced INTEGER NOT NULL DEFAULT 0,
            created_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
            updated_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
            last_synced_at INTEGER
          )
        ''');

        // Create agencies table with ministry_id foreign key
        await customStatement('''
          CREATE TABLE agencies (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE,
            code TEXT,
            remote_id TEXT,
            ministry_id INTEGER NOT NULL REFERENCES ministries(id) ON DELETE CASCADE,
            is_active INTEGER NOT NULL DEFAULT 1,
            is_synced INTEGER NOT NULL DEFAULT 0,
            created_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
            updated_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
            last_synced_at INTEGER
          )
        ''');
        await customStatement('PRAGMA foreign_keys = ON');
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
      if (details.wasCreated) {
        debugPrint('Database created');
      } else if (details.hadUpgrade) {
        debugPrint('Database upgraded');
      }
    },
  );

  Future<void> _createWithIndexes(Migrator m) async {
    await m.createAll();

    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_projects_created_by ON projects(created_by)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_projects_synced ON projects(last_synced_at)',
    );
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_projects_updated_at ON projects(updated_at)',
    );
  }

  Future<void> clear() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      await transaction(() async {
        for (final table in allTables) {
          await delete(table).go();
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }
}
