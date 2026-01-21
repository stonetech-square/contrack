import 'dart:io';
import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/core/services/project_export_service.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:contrack/src/features/projects/domain/entities/export_type.dart';

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
    ExportFormat format, {
    ExportType type = ExportType.preferred,
  }) async {
    switch (format) {
      case ExportFormat.csv:
        return await _exportToCsv(project, type);
      case ExportFormat.excel:
        return await _exportToExcel(project, type);
      case ExportFormat.pdf:
        return await _exportToPdf(project, type);
    }
  }

  @override
  Future<String> exportProjects(
    List<ProjectWithDetails> projects,
    ExportFormat format, {
    ExportType type = ExportType.preferred,
  }) async {
    switch (format) {
      case ExportFormat.csv:
        return await _exportMultipleToCsv(projects, type);
      case ExportFormat.excel:
        return await _exportMultipleToExcel(projects, type);
      case ExportFormat.pdf:
        return await _exportMultipleToPdf(projects, type);
    }
  }

  List<String> _getHeaders(ExportType type) {
    switch (type) {
      case ExportType.preferred:
        return [
          'S/NO',
          'CODE',
          'PROJECT TITLE',
          'STATUS',
          'AMOUNT (₦)',
          'AGENCY',
          'MINISTRY',
        ];
      case ExportType.extra:
        return [
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
          'START DATE',
          'END DATE',
          'CREATED BY',
          'MODIFIED BY',
          'CREATED AT',
          'UPDATED AT',
        ];
    }
  }

  List<String> _getRowData(
    ProjectWithDetails project,
    int index,
    ExportType type,
  ) {
    final baseData = [
      (index + 1).toString(),
      project.code,
      project.title,
      project.status.displayName,
      _currencyFormat.format(project.amount),
      project.agencyName,
      project.ministryName,
    ];

    if (type == ExportType.preferred) return baseData;

    return [
      ...baseData,
      project.stateName,
      project.zoneName,
      project.constituency,
      project.sponsor ?? '',
      project.startDate != null
          ? DateFormat('yyyy-MM-dd').format(project.startDate!)
          : '',
      project.endDate != null
          ? DateFormat('yyyy-MM-dd').format(project.endDate!)
          : '',
      project.createdByName ?? project.createdBy,
      project.modifiedByName ?? project.modifiedBy ?? '',
      DateFormat('yyyy-MM-dd HH:mm').format(project.createdAt),
      DateFormat('yyyy-MM-dd HH:mm').format(project.updatedAt),
    ];
  }

  Future<String> _exportToCsv(
    ProjectWithDetails project,
    ExportType type,
  ) async {
    final rows = [_getHeaders(type), _getRowData(project, 0, type)];

    final csv = const ListToCsvConverter().convert(rows);

    final directory = await _getExportDirectory();
    final fileName =
        'project_${project.code}_${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(csv);
    return file.path;
  }

  Future<String> _exportToExcel(
    ProjectWithDetails project,
    ExportType type,
  ) async {
    final excel = Excel.createExcel();
    final sheet = excel['Project Export'];

    final headers = _getHeaders(type);

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    final data = _getRowData(
      project,
      0,
      type,
    ).map((d) => TextCellValue(d)).toList();
    sheet.appendRow(data);

    for (var i = 0; i < headers.length; i++) {
      var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0),
      );
      cell.cellStyle = CellStyle(bold: true);
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

  Future<String> _exportToPdf(
    ProjectWithDetails project,
    ExportType type,
  ) async {
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
                headers: _getHeaders(type),
                data: [_getRowData(project, 0, type)],
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

  Future<String> _exportMultipleToCsv(
    List<ProjectWithDetails> projects,
    ExportType type,
  ) async {
    final rows = [_getHeaders(type)];

    for (var i = 0; i < projects.length; i++) {
      rows.add(_getRowData(projects[i], i, type));
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
    ExportType type,
  ) async {
    final excel = Excel.createExcel();
    final sheet = excel['Projects Export'];

    final headers = _getHeaders(type);

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    for (var i = 0; i < projects.length; i++) {
      final data = _getRowData(
        projects[i],
        i,
        type,
      ).map((d) => TextCellValue(d)).toList();
      sheet.appendRow(data);
    }

    for (var i = 0; i < headers.length; i++) {
      var cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0),
      );
      cell.cellStyle = CellStyle(bold: true);
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

  Future<String> _exportMultipleToPdf(
    List<ProjectWithDetails> projects,
    ExportType type,
  ) async {
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
                headers: _getHeaders(type),
                data: projects
                    .asMap()
                    .entries
                    .map((entry) => _getRowData(entry.value, entry.key, type))
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
