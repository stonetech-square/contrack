import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/recent_projects_table_body.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/recent_projects_table_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentProjects extends StatelessWidget {
  const RecentProjects({super.key});

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
            child: Text(
              'My Recent Entries',
              style: context.textStyles.titleLarge.copyWith(
                color: context.colors.textHeading,
                fontWeight: FontWeight.w600,
              ),
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
                    RecentProjectsTableHeader(),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: RecentProjectsTableBody(
                          projects: state.recentProjects,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ).copyWith(bottom: 16),
                        child: TextButton(
                          onPressed: () =>
                              context.navigateTo(AllProjectRoute()),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View all my projects',
                                style: context.textStyles.bodyMedium.copyWith(
                                  color: context.colors.textHeading,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: context.colors.textHeading,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
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
