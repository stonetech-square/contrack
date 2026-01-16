import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';

import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<DashboardBloc>()..add(DashboardStarted()),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        RouteHeader(routePath: ['Dashboard'], canPop: false),
        SizedBox(height: 23),
        DashboardOverView(),
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
              onPressed: () {},
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
