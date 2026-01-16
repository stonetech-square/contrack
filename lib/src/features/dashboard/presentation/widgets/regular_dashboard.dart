import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_event.dart';



class RegularDashboard extends StatelessWidget {
  const RegularDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        RouteHeader(routePath: ['Dashboard'], canPop: false),
        SizedBox(height: 23),
        RegularDashboardOverView(),
        SizedBox(height: 44),
        Row(
          children: [
            FilledButton.icon(
              onPressed: () => context.router.navigate(
                ShellProjectRoute(children: [CreateNewProjectRoute()]),
              ),
              style: FilledButton.styleFrom(
                maximumSize: const Size(230, 56),
                minimumSize: const Size(200, 56),
              ),

              icon: const Icon(Icons.add_circle_outline_rounded),
              label: const Text('Add New Project Entry'),
            ),
            const SizedBox(width: 16),
            FilledButton.icon(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['csv'],
                );

                if (result != null && result.files.single.path != null) {
                  if (context.mounted) {
                    context.read<DashboardBloc>().add(
                      DashboardProjectImported(result.files.single.path!),
                    );
                  }
                }
              },
              style: FilledButton.styleFrom(
                maximumSize: const Size(250, 56),
                minimumSize: const Size(220, 56),
                backgroundColor: context.colors.neutralInverted.withValues(
                  alpha: 0.5,
                ),

                foregroundColor: context.colors.neutral,
              ),
              icon: const Icon(Icons.file_upload_rounded),
              label: const Text('Import New Project Entry'),
            ),
          ],
        ),
        SizedBox(height: 32),
        Expanded(flex: 20, child: RecentProjects()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}


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
