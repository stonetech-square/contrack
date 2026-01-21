import 'dart:io';

import 'package:contrack/src/core/services/project_import_service.dart';
import 'package:csv/csv.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProjectImportService)
class ProjectImportServiceImpl implements ProjectImportService {
  @override
  Future<List<ProjectImportDto>> importProjectsDto(File file) async {
    final input = await file.readAsString();
    final rows = const CsvToListConverter().convert(input);

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

        projects.add(
          ProjectImportDto(
            code: code,
            title: title,
            status: status,
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
    final cleaned = amountStr.replaceAll('₦', '').replaceAll(',', '').trim();
    return double.tryParse(cleaned) ?? 0.0;
  }
}
