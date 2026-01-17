import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            RouteHeader(routePath: ['Dashboard'], canPop: false),
            const Spacer(),
            FilledButton.icon(
              icon: Icon(Icons.download_outlined),
              style: FilledButton.styleFrom(
                minimumSize: const Size(130, 45),
                maximumSize: const Size(180, 45),
                backgroundColor: context.colors.neutralInverted,
                foregroundColor: context.colors.neutral,
              ),
              onPressed: () {
                context.read<DashboardBloc>().add(DashboardImportRequested());
              },
              label: const Text('Import Projects'),
            ),
            SizedBox(width: 16),
            FilledButton.icon(
              icon: Icon(Icons.add),
              style: FilledButton.styleFrom(
                minimumSize: const Size(150, 45),
                maximumSize: const Size(200, 45),
              ),
              onPressed: () => context.router.navigate(
                ShellProjectRoute(children: [CreateNewProjectRoute()]),
              ),
              label: const Text('Add Projects'),
            ),
          ],
        ),
        SizedBox(height: 23),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: ProjectsStats()),
            SizedBox(width: 24),
            Expanded(flex: 1, child: QuickActionCard()),
          ],
        ),
        SizedBox(height: 24),
        Expanded(child: RecentProjects(isAdmin: true)),
        SizedBox(height: 24),
      ],
    );
  }
}
