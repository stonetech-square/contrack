import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:contrack/src/features/projects/presentation/bloc/project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_details/project_details_content.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_details/project_header_actions.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_details/project_summary_card.dart';
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
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.project == null && state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }
          if (state.project == null) {
            return const Center(child: Text('Project not found'));
          }

          final project = state.project!;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: RouteHeader(
                        routePath: ['Projects', project.code],
                        canPop: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const ProjectHeaderActions(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      ProjectSummaryCard(project: project),
                      const SizedBox(height: 24),
                      ProjectDetailsContent(project: project),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
