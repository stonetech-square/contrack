import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:contrack/src/features/projects/presentation/bloc/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key, required this.projectCode});
  final String projectCode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey(projectCode),
      create: (context) =>
          GetIt.instance.get<ProjectBloc>()
            ..add(ProjectFetchByCodeEvent(projectCode)),
      lazy: false,
      child: ProjectView(projectCode: projectCode),
    );
  }
}

class ProjectView extends StatelessWidget {
  const ProjectView({super.key, required this.projectCode});

  final String projectCode;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectBloc, ProjectState>(
      listenWhen: (previous, current) =>
          previous.exportFilePath != current.exportFilePath ||
          previous.exportError != current.exportError,
      listener: (context, state) {
        if (state.exportFilePath != null) {
          context.toast.success(
            '/Downloads/${state.exportFilePath?.split('/').last ?? '/Downloads'}',
            title: 'Export Successful',
          );
        } else if (state.exportError != null) {
          context.toast.error(state.exportError!, title: 'Export Failed');
        }
      },
      child: Column(
        children: [
          SizedBox(height: 16),
          RouteHeader(routePath: ['Projects', projectCode], canPop: true),
          SizedBox(height: 32),
          BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              return FilledButton(
                style: FilledButton.styleFrom(minimumSize: const Size(230, 56)),
                onPressed: state.isExporting
                    ? null
                    : () {
                        context.read<ProjectBloc>().add(
                          ProjectExportRequestedEvent(ExportFormat.csv),
                        );
                      },
                child: state.isExporting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Export'),
              );
            },
          ),
          BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              return Text(state.project?.title ?? 'No data');
            },
          ),
        ],
      ),
    );
  }
}
