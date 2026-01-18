import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/recent_projects_table_body.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/recent_projects_table_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentProjects extends StatelessWidget {
  const RecentProjects({super.key, this.isAdmin = false});
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ).copyWith(top: 24),
            child: Row(
              children: [
                Text(
                  'Recent Entries',
                  style: context.textStyles.titleLarge.copyWith(
                    color: context.colors.textHeading,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => context.navigateTo(AllProjectRoute()),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View all',
                        style: context.textStyles.bodyMedium.copyWith(
                          color: context.colors.info,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: context.colors.info,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<DashboardBloc, DashboardState>(
              buildWhen: (previous, current) =>
                  previous.recentProjects != current.recentProjects,
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state.recentProjects.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Text(
                        'No recent projects',
                        style: context.textStyles.bodyMedium.copyWith(
                          color: context.colors.textSubtle,
                        ),
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    RecentProjectsTableHeader(isAdmin: isAdmin),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: RecentProjectsTableBody(
                          projects: state.recentProjects,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
