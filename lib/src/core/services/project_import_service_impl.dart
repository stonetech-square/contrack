import 'dart:io';

import 'package:contrack/src/core/services/project_import_service.dart';
import 'package:csv/csv.dart';
import 'package:injectable/injectable.dart';

import 'package:excel/excel.dart';
import 'package:path/path.dart' as p;

@LazySingleton(as: ProjectImportService)
class ProjectImportServiceImpl implements ProjectImportService {
  @override
  Future<List<ProjectImportDto>> importProjectsDto(File file) async {
    final extension = p.extension(file.path).toLowerCase();
    List<List<dynamic>> rows = [];

    if (extension == '.csv') {
      final input = await file.readAsString();
      rows = const CsvToListConverter().convert(input);
    } else if (extension == '.xlsx' || extension == '.xls') {
      final bytes = await file.readAsBytes();
      final excel = Excel.decodeBytes(bytes);
      if (excel.tables.isNotEmpty) {
        final table = excel.tables[excel.tables.keys.first];
        if (table != null) {
          rows = table.rows.map((row) {
            return row.map((cell) => cell?.value?.toString() ?? '').toList();
          }).toList();
        }
      }
    }

    if (rows.isEmpty) return [];

    final projects = <ProjectImportDto>[];

    for (var i = 1; i < rows.length; i++) {
      final row = rows[i];
      if (row.length < 7) continue;

      try {
        final code = row[1].toString();
        final title = row[2].toString();
        final status = row[3].toString();
        final amountStr = row[4].toString();
        final agency = row[5].toString();
        final ministry = row[6].toString();

        final amount = _parseAmount(amountStr);

        final state = row.length > 7 ? row[7].toString() : '';
        final zone = row.length > 8 ? row[8].toString() : '';
        final constituency = row.length > 9 ? row[9].toString() : '';
        final sponsor = row.length > 10 ? row[10].toString() : null;
        final startDate = row.length > 11 ? row[11].toString() : null;
        final endDate = row.length > 12 ? row[12].toString() : null;
        final inHouseStatus = row.length > 13 ? row[13].toString() : null;

        projects.add(
          ProjectImportDto(
            code: code,
            title: title,
            projectStatus: status,
            inHouseStatus: inHouseStatus,
            amount: amount,
            agency: agency,
            ministry: ministry,
            state: state,
            zone: zone,
            constituency: constituency,
            sponsor: sponsor,
            startDate: startDate,
            endDate: endDate,
          ),
        );
      } catch (e) {
        continue;
      }
    }

    return projects;
  }

  double _parseAmount(String amountStr) {
    if (amountStr.isEmpty) return 0.0;
    final cleaned = amountStr.replaceAll('₦', '').replaceAll(',', '').trim();
    return double.tryParse(cleaned) ?? 0.0;
  }
}
