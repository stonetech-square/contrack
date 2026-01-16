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
      if (row.length < 11) continue;

      try {
        final code = row[1].toString();
        final title = row[2].toString();
        final status = row[3].toString();
        final amountStr = row[4].toString();
        final agency = row[5].toString();
        final ministry = row[6].toString();
        final state = row[7].toString();
        final zone = row[8].toString();
        final constituency = row[9].toString();
        final sponsor = row[10]?.toString();

        final amount = _parseAmount(amountStr);

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
