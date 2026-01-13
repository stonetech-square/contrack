import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/domain/entities/status_info.dart';

class DashboardStats {
  final int totalProjectCount;
  final int unsyncedProjectCount;
  final Map<ProjectStatus, StatusInfo> statusDistribution;

  const DashboardStats({
    required this.totalProjectCount,
    required this.unsyncedProjectCount,
    required this.statusDistribution,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardStats &&
          runtimeType == other.runtimeType &&
          totalProjectCount == other.totalProjectCount &&
          unsyncedProjectCount == other.unsyncedProjectCount &&
          statusDistribution == other.statusDistribution;

  @override
  int get hashCode =>
      totalProjectCount.hashCode ^
      unsyncedProjectCount.hashCode ^
      statusDistribution.hashCode;

  @override
  String toString() =>
      'DashboardStats('
      'totalProjects: $totalProjectCount, '
      'unsynced: $unsyncedProjectCount, '
      'statuses: ${statusDistribution.length})';

  factory DashboardStats.empty() => DashboardStats(
    totalProjectCount: 0,
    unsyncedProjectCount: 0,
    statusDistribution: {
      ProjectStatus.notStarted: StatusInfo(count: 0, percentage: 0),
      ProjectStatus.ongoing: StatusInfo(count: 0, percentage: 0),
      ProjectStatus.completed: StatusInfo(count: 0, percentage: 0),
      ProjectStatus.cancelled: StatusInfo(count: 0, percentage: 0),
      ProjectStatus.suspended: StatusInfo(count: 0, percentage: 0),
    },
  );
}
