import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/domain/entities/status_info.dart';

class DashboardStats {
  final int totalProjectCount;
  final double totalBudget;
  final int unsyncedProjectCount;
  final Map<InHouseStatus, StatusInfo> statusDistribution;

  const DashboardStats({
    required this.totalProjectCount,
    required this.totalBudget,
    required this.unsyncedProjectCount,
    required this.statusDistribution,
  });

  DashboardStats copyWith({
    int? totalProjectCount,
    double? totalBudget,
    int? unsyncedProjectCount,
    Map<InHouseStatus, StatusInfo>? statusDistribution,
  }) {
    return DashboardStats(
      totalProjectCount: totalProjectCount ?? this.totalProjectCount,
      totalBudget: totalBudget ?? this.totalBudget,
      unsyncedProjectCount: unsyncedProjectCount ?? this.unsyncedProjectCount,
      statusDistribution: statusDistribution ?? this.statusDistribution,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardStats &&
          runtimeType == other.runtimeType &&
          totalProjectCount == other.totalProjectCount &&
          totalBudget == other.totalBudget &&
          unsyncedProjectCount == other.unsyncedProjectCount &&
          statusDistribution == other.statusDistribution;

  @override
  int get hashCode =>
      totalProjectCount.hashCode ^
      totalBudget.hashCode ^
      unsyncedProjectCount.hashCode ^
      statusDistribution.hashCode;

  @override
  String toString() =>
      'DashboardStats('
      'totalProjects: $totalProjectCount, '
      'totalBudget: $totalBudget, '
      'unsynced: $unsyncedProjectCount, '
      'statuses: ${statusDistribution.length})';

  factory DashboardStats.empty() => DashboardStats(
    totalProjectCount: 0,
    totalBudget: 0,
    unsyncedProjectCount: 0,
    statusDistribution: {
      InHouseStatus.notStarted: StatusInfo(count: 0, percentage: 0),
      InHouseStatus.ongoing: StatusInfo(count: 0, percentage: 0),
      InHouseStatus.completed: StatusInfo(count: 0, percentage: 0),
      InHouseStatus.suspended: StatusInfo(count: 0, percentage: 0),
      InHouseStatus.cancelled: StatusInfo(count: 0, percentage: 0),
    },
  );
}
