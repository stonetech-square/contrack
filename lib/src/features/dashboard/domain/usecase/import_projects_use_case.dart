import 'dart:io';

import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImportProjectsUseCase implements UseCase<Future<List<Project>>, File> {
  final DashboardRepository _dashboardRepository;

  ImportProjectsUseCase(this._dashboardRepository);

  @override
  Future<List<Project>> call(File file) async {
    return _dashboardRepository.importProjects(file);
  }
}
