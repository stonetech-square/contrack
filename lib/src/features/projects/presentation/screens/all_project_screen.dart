import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/presentation/bloc/all_projects_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AllProjectsBloc>()
        ..add(
          const AllProjectsWatchStarted(
            filter: ProjectFilter(sortField: ProjectSortField.updatedAt),
          ),
        ),
      child: const AllProjectsView(),
    );
  }
}

class AllProjectsView extends StatelessWidget {
  const AllProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllProjectsBloc, AllProjectsState>(
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
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const RouteHeader(routePath: ['Projects']),

            const SizedBox(height: 24),
            const ProjectsHeader(),
            const SizedBox(height: 24),
            const ProjectsFilters(),
            const SizedBox(height: 16),
            const Expanded(child: ProjectsTable()),
            const ProjectsPagination(),
          ],
        ),
      ),
    );
  }
}
