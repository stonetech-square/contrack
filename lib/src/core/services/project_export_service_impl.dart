import 'dart:io';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/core/errors/exeptions.dart';
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
  Future<Directory> _getExportDirectory() async {
    if (Platform.isMacOS || Platform.isLinux) {
      // TODO: confirm save dir works linux
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
    var projectsToExport = projects;
    if (type == ExportType.preferred) {
      projectsToExport = projects
          .where(
            (p) =>
                p.inHouseStatus != InHouseStatus.cancelled &&
                p.inHouseStatus != InHouseStatus.suspended,
          )
          .toList();
    }

    if (projectsToExport.isEmpty) {
      throw NoProjectsToExportException();
    }

    switch (format) {
      case ExportFormat.csv:
        return await _exportMultipleToCsv(projectsToExport, type);
      case ExportFormat.excel:
        return await _exportMultipleToExcel(projectsToExport, type);
      case ExportFormat.pdf:
        return await _exportMultipleToPdf(projectsToExport, type);
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
          'AMOUNT (NAIRA)',
          'AGENCY',
          'MINISTRY',
        ];
      case ExportType.extra:
        return [
          'S/NO',
          'CODE',
          'PROJECT TITLE',
          'PROJECT STATUS',
          'IN-HOUSE STATUS',
          'AMOUNT (NAIRA)',
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

  List<dynamic> _getRowData(
    ProjectWithDetails project,
    int index,
    ExportType type,
  ) {
    final baseData = [
      (index + 1),
      project.code,
      project.title,
      project.projectStatus.displayName,
      if (type == ExportType.extra) project.inHouseStatus.displayName,
      project.amount.toInt(),
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
    final rows = <List<dynamic>>[];
    rows.add(_getHeaders(type));
    rows.add(_getRowData(project, 0, type));

    // Add total row
    final totalRow = List<dynamic>.filled(_getHeaders(type).length, '');
    totalRow[0] = 'TOTAL';
    final amountIndex = type == ExportType.preferred ? 4 : 5;
    totalRow[amountIndex] = project.amount.toInt();
    rows.add(totalRow);

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
    final defaultSheet = excel.getDefaultSheet();
    if (defaultSheet != null) {
      excel.rename(defaultSheet, 'Project Export');
    }
    final sheet = excel['Project Export'];

    final headers = _getHeaders(type);

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    final data = _getRowData(project, 0, type)
        .map((d) => d is int ? IntCellValue(d) : TextCellValue(d.toString()))
        .toList();
    sheet.appendRow(data);

    final totalRow = List<CellValue>.filled(headers.length, TextCellValue(''));
    totalRow[0] = TextCellValue('TOTAL');
    final amountIndex = type == ExportType.preferred ? 4 : 5;
    final colName = type == ExportType.preferred ? 'E' : 'F';
    totalRow[amountIndex] = FormulaCellValue('SUM(${colName}2:${colName}2)');
    sheet.appendRow(totalRow);

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
    final rows = <List<dynamic>>[];
    rows.add(_getHeaders(type));

    double totalAmount = 0;
    for (var i = 0; i < projects.length; i++) {
      totalAmount += projects[i].amount;
      rows.add(_getRowData(projects[i], i, type));
    }

    // Add total row
    final totalRow = List<dynamic>.filled(_getHeaders(type).length, '');
    totalRow[0] = 'TOTAL';
    final amountIndex = type == ExportType.preferred ? 4 : 5;
    totalRow[amountIndex] = totalAmount.toInt();
    rows.add(totalRow);

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
    final defaultSheet = excel.getDefaultSheet();
    if (defaultSheet != null) {
      excel.rename(defaultSheet, 'Projects Export');
    }
    final sheet = excel['Projects Export'];

    final headers = _getHeaders(type);

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    for (var i = 0; i < projects.length; i++) {
      final data = _getRowData(projects[i], i, type)
          .map((d) => d is int ? IntCellValue(d) : TextCellValue(d.toString()))
          .toList();
      sheet.appendRow(data);
    }

    final totalRow = List<CellValue>.filled(headers.length, TextCellValue(''));
    totalRow[0] = TextCellValue('TOTAL');
    final amountIndex = type == ExportType.preferred ? 4 : 5;
    final colName = type == ExportType.preferred ? 'E' : 'F';
    final lastRow = projects.length + 1;
    totalRow[amountIndex] = FormulaCellValue(
      'SUM(${colName}2:$colName$lastRow)',
    );
    sheet.appendRow(totalRow);

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
