import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/dashboard_regular_overview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegularDashboardOverView extends StatelessWidget {
  const RegularDashboardOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) => previous.stats != current.stats,
      builder: (context, state) {
        return Wrap(
          spacing: 26,
          runSpacing: 26,
          children: [
            DashboardRegularOverViewCard(
              title: 'My Total Projects',
              count: state.stats.totalProjectCount,
              icon: Icons.folder,
            ),

            DashboardRegularOverViewCard(
              title: 'Not Started',
              count:
                  state
                      .stats
                      .statusDistribution[ProjectStatus.notStarted]
                      ?.count ??
                  0,
              icon: Icons.file_copy_sharp,
              iconBackgroundColor: context.colors.bgGray,
              iconForegroundColor: context.colors.textSubtle,
            ),
            DashboardRegularOverViewCard(
              title: 'Ongoing',
              count:
                  state
                      .stats
                      .statusDistribution[ProjectStatus.ongoing]
                      ?.count ??
                  0,
              icon: Icons.schedule,
              iconBackgroundColor: context.colors.bgOrange,
              iconForegroundColor: context.colors.warning,
            ),
            DashboardRegularOverViewCard(
              title: 'Completed',
              count:
                  state
                      .stats
                      .statusDistribution[ProjectStatus.completed]
                      ?.count ??
                  0,
              icon: Icons.file_open_outlined,
              iconBackgroundColor: context.colors.bgGreen,
              iconForegroundColor: context.colors.success,
            ),
          ],
        );
      },
    );
  }
}
