import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:contrack/src/features/dashboard/domain/entities/status_info.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class WatchDashboardStatsUseCase
    implements UseCase<Stream<DashboardStats>, NoParams> {
  final DashboardRepository _repository;

  WatchDashboardStatsUseCase(this._repository);

  @override
  Stream<DashboardStats> call(NoParams params) {
    return Rx.combineLatest2(
      _repository.watchUnsyncedProjectCount(),
      _repository.watchProjectCountsByStatus(),
      (unsyncedCount, statusCounts) {
        final totalCount = statusCounts.values.fold<int>(
          0,
          (sum, count) => sum + count,
        );

        final statusDistribution = _calculateStatusDistribution(
          statusCounts,
          totalCount,
        );

        return DashboardStats(
          totalProjectCount: totalCount,
          unsyncedProjectCount: unsyncedCount,
          statusDistribution: statusDistribution,
        );
      },
    );
  }

  Map<ProjectStatus, StatusInfo> _calculateStatusDistribution(
    Map<ProjectStatus, int> statusCounts,
    int totalCount,
  ) {
    return statusCounts.map((status, count) {
      final percentage = totalCount > 0 ? (count / totalCount) * 100 : 0.0;
      return MapEntry(status, StatusInfo(count: count, percentage: percentage));
    });
  }
}
