import 'dart:io';

import 'package:contrack/src/features/dashboard/domain/entities/project.dart';

import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';

abstract class DashboardRepository {
  Stream<List<Project>> watchRecentProjects();
  Stream<List<ProjectWithDetails>> watchRecentProjectsWithDetails();
  Stream<int> watchUnsyncedProjectCount();
  Stream<Map<ProjectStatus, int>> watchProjectCountsByStatus();
  Future<List<Project>> importProjects(File file);
}
