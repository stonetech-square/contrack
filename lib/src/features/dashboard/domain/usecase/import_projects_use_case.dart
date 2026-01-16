import 'dart:io';

import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/import_result.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImportProjectsUseCase implements UseCase<Future<ImportResult>, File> {
  final DashboardRepository _dashboardRepository;

  ImportProjectsUseCase(this._dashboardRepository);

  @override
  Future<ImportResult> call(File file) async {
    return _dashboardRepository.importProjects(file);
  }
}
