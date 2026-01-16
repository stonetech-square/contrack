import 'dart:io';
import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/services/project_export_service.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

@LazySingleton(as: ProjectExportService)
class ProjectExportServiceImpl implements ProjectExportService {
  final _currencyFormat = NumberFormat.currency(symbol: '₦', decimalDigits: 2);

  Future<Directory> _getExportDirectory() async {
    if (Platform.isMacOS || Platform.isLinux) {
      // TODO: confirm save dir works on windows and linux
      return await getDownloadsDirectory() ??
          await getApplicationDocumentsDirectory();
    } else if (Platform.isWindows) {
      try {
        final downloadsDir = await getDownloadsDirectory();
        if (downloadsDir != null) return downloadsDir;
      } catch (_) {}
      return await getApplicationDocumentsDirectory();
    } else {
      return await getApplicationDocumentsDirectory();
    }
  }

  @override
  Future<String> exportProject(
    ProjectWithDetails project,
    ExportFormat format,
  ) async {
    switch (format) {
      case ExportFormat.csv:
        return await _exportToCsv(project);
      case ExportFormat.excel:
        return await _exportToExcel(project);
      case ExportFormat.pdf:
        return await _exportToPdf(project);
    }
  }

  @override
  Future<String> exportProjects(
    List<ProjectWithDetails> projects,
    ExportFormat format,
  ) async {
    switch (format) {
      case ExportFormat.csv:
        return await _exportMultipleToCsv(projects);
      case ExportFormat.excel:
        return await _exportMultipleToExcel(projects);
      case ExportFormat.pdf:
        return await _exportMultipleToPdf(projects);
    }
  }

  Future<String> _exportToCsv(ProjectWithDetails project) async {
    final rows = [
      [
        'S/NO',
        'CODE',
        'PROJECT TITLE',
        'STATUS',
        'AMOUNT (₦)',
        'AGENCY',
        'MINISTRY',
        'STATE',
        'ZONE',
        'CONSTITUENCY',
        'SPONSOR',
      ],
      [
        '1',
        project.code,
        project.title,
        project.status.displayName,
        _currencyFormat.format(project.amount),
        project.agencyName,
        project.ministryName,
        project.stateName,
        project.zoneName,
        project.constituency,
        project.sponsor ?? '',
      ],
    ];

    final csv = const ListToCsvConverter().convert(rows);

    final directory = await _getExportDirectory();
    final fileName =
        'project_${project.code}_${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(csv);
    return file.path;
  }

  Future<String> _exportToExcel(ProjectWithDetails project) async {
    final excel = Excel.createExcel();
    final sheet = excel['Project Export'];

    final headers = [
      'S/NO',
      'CODE',
      'PROJECT TITLE',
      'STATUS',
      'AMOUNT (₦)',
      'AGENCY',
      'MINISTRY',
      'STATE',
      'ZONE',
      'CONSTITUENCY',
      'SPONSOR',
    ];

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    final data = [
      TextCellValue('1'),
      TextCellValue(project.code),
      TextCellValue(project.title),
      TextCellValue(project.status.displayName),
      TextCellValue(_currencyFormat.format(project.amount)),
      TextCellValue(project.agencyName),
      TextCellValue(project.ministryName),
      TextCellValue(project.stateName),
      TextCellValue(project.zoneName),
      TextCellValue(project.constituency),
      TextCellValue(project.sponsor ?? ''),
    ];
    sheet.appendRow(data);

    for (var i = 0; i < headers.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
          .cellStyle = CellStyle(
        bold: true,
      );
    }

    final directory = await _getExportDirectory();
    final fileName =
        'project_${project.code}_${DateTime.now().millisecondsSinceEpoch}.xlsx';
    final filePath = '${directory.path}/$fileName';
    final fileBytes = excel.save();
    final file = File(filePath);
    await file.writeAsBytes(fileBytes!);
    return file.path;
  }

  Future<String> _exportToPdf(ProjectWithDetails project) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Project Export',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.TableHelper.fromTextArray(
                headers: [
                  'S/NO',
                  'CODE',
                  'PROJECT TITLE',
                  'STATUS',
                  'AMOUNT (₦)',
                  'AGENCY',
                  'MINISTRY',
                  'STATE',
                  'ZONE',
                  'CONSTITUENCY',
                  'SPONSOR',
                ],
                data: [
                  [
                    '1',
                    project.code,
                    project.title,
                    project.status.displayName,
                    _currencyFormat.format(project.amount),
                    project.agencyName,
                    project.ministryName,
                    project.stateName,
                    project.zoneName,
                    project.constituency,
                    project.sponsor ?? '',
                  ],
                ],
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                cellAlignment: pw.Alignment.centerLeft,
                border: pw.TableBorder.all(),
              ),
            ],
          );
        },
      ),
    );

    final directory = await _getExportDirectory();
    final fileName =
        'project_${project.code}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }

  Future<String> _exportMultipleToCsv(List<ProjectWithDetails> projects) async {
    final rows = [
      [
        'S/NO',
        'CODE',
        'PROJECT TITLE',
        'STATUS',
        'AMOUNT (₦)',
        'AGENCY',
        'MINISTRY',
        'STATE',
        'ZONE',
        'CONSTITUENCY',
        'SPONSOR',
      ],
    ];

    for (var i = 0; i < projects.length; i++) {
      final project = projects[i];
      rows.add([
        (i + 1).toString(),
        project.code,
        project.title,
        project.status.displayName,
        _currencyFormat.format(project.amount),
        project.agencyName,
        project.ministryName,
        project.stateName,
        project.zoneName,
        project.constituency,
        project.sponsor ?? '',
      ]);
    }

    final csv = const ListToCsvConverter().convert(rows);

    final directory = await _getExportDirectory();
    final fileName =
        'projects_export_${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(csv);
    return file.path;
  }

  Future<String> _exportMultipleToExcel(
    List<ProjectWithDetails> projects,
  ) async {
    final excel = Excel.createExcel();
    final sheet = excel['Projects Export'];

    final headers = [
      'S/NO',
      'CODE',
      'PROJECT TITLE',
      'STATUS',
      'AMOUNT (₦)',
      'AGENCY',
      'MINISTRY',
      'STATE',
      'ZONE',
      'CONSTITUENCY',
      'SPONSOR',
    ];

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    for (var i = 0; i < projects.length; i++) {
      final project = projects[i];
      final data = [
        TextCellValue((i + 1).toString()),
        TextCellValue(project.code),
        TextCellValue(project.title),
        TextCellValue(project.status.displayName),
        TextCellValue(_currencyFormat.format(project.amount)),
        TextCellValue(project.agencyName),
        TextCellValue(project.ministryName),
        TextCellValue(project.stateName),
        TextCellValue(project.zoneName),
        TextCellValue(project.constituency),
        TextCellValue(project.sponsor ?? ''),
      ];
      sheet.appendRow(data);
    }

    for (var i = 0; i < headers.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
          .cellStyle = CellStyle(
        bold: true,
      );
    }

    final directory = await _getExportDirectory();
    final fileName =
        'projects_export_${DateTime.now().millisecondsSinceEpoch}.xlsx';
    final filePath = '${directory.path}/$fileName';
    final fileBytes = excel.save();
    final file = File(filePath);
    await file.writeAsBytes(fileBytes!);
    return file.path;
  }

  Future<String> _exportMultipleToPdf(List<ProjectWithDetails> projects) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Projects Export',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.TableHelper.fromTextArray(
                headers: [
                  'S/NO',
                  'CODE',
                  'PROJECT TITLE',
                  'STATUS',
                  'AMOUNT (₦)',
                  'AGENCY',
                  'MINISTRY',
                  'STATE',
                  'ZONE',
                  'CONSTITUENCY',
                  'SPONSOR',
                ],
                data: projects
                    .asMap()
                    .entries
                    .map(
                      (entry) => [
                        (entry.key + 1).toString(),
                        entry.value.code,
                        entry.value.title,
                        entry.value.status.displayName,
                        _currencyFormat.format(entry.value.amount),
                        entry.value.agencyName,
                        entry.value.ministryName,
                        entry.value.stateName,
                        entry.value.zoneName,
                        entry.value.constituency,
                        entry.value.sponsor ?? '',
                      ],
                    )
                    .toList(),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                cellAlignment: pw.Alignment.centerLeft,
                border: pw.TableBorder.all(),
              ),
            ],
          );
        },
      ),
    );

    final directory = await _getExportDirectory();
    final fileName =
        'projects_export_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }
}
