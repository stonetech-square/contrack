import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
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
    return BlocListener<DashboardBloc, DashboardState>(
      listenWhen: (previous, current) =>
          previous.importedProjects != current.importedProjects ||
          previous.exportFilePath != current.exportFilePath,
      listener: (context, state) {
        if (state.error != null && !state.isExporting) {
          context.toast.error(state.error!, title: 'Action Failed');
        }
        if (state.importedProjects != null &&
            state.importedProjects!.isNotEmpty) {
          context.router.navigate(
            ShellProjectRoute(
              children: [
                CreateNewProjectRoute(projects: state.importedProjects),
              ],
            ),
          );
        }
        if (state.exportFilePath != null) {
          context.toast.success(
            'Projects exported to ${state.exportFilePath!.split('/').last}',
            title: 'Export Success',
          );
        }
      },
      child: DasboardOverview(),
    );
  }
}
