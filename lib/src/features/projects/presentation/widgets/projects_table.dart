import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:contrack/src/features/projects/presentation/bloc/all_projects_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProjectsTable extends StatelessWidget {
  const ProjectsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: 0,
      child: BlocBuilder<AllProjectsBloc, AllProjectsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state.projects.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  'No projects found',
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textSubtle,
                  ),
                ),
              ),
            );
          }

          return Column(
            children: [
              const _ProjectsTableHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: state.paginatedProjects.asMap().entries.map((
                      entry,
                    ) {
                      return _ProjectsTableRow(
                        project: entry.value,
                        index:
                            (state.page - 1) * state.pageSize + entry.key + 1,
                      );
                    }).toList(),
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

class _ProjectsTableHeader extends StatelessWidget {
  const _ProjectsTableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        border: Border(
          bottom: BorderSide(color: context.colors.border, width: 0.8),
        ),
      ),
      child: const Row(
        children: [
          _HeaderCell('S/N', flex: 1),
          _HeaderCell('CODE', flex: 2),
          _HeaderCell('AGENCY', flex: 2),
          _HeaderCell('STATE', flex: 1),
          _HeaderCell('STATUS', flex: 1),
          _HeaderCell('DATE', flex: 2),
          _HeaderCell('Actions', flex: 1),
        ],
      ),
    );
  }
}

class _ProjectsTableRow extends StatelessWidget {
  const _ProjectsTableRow({required this.project, required this.index});

  final ProjectWithDetails project;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(
          ShellProjectRoute(
            children: [ProjectRoute(projectCode: project.code)],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: context.colors.border, width: 0.8),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DataCell('$index', flex: 1),
            _DataCell(
              project.code,
              flex: 2,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textHeading,
                fontWeight: FontWeight.w600,
              ),
            ),
            _DataCell(project.agencyName, flex: 2),
            _DataCell(project.stateName, flex: 1),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ProjectStatusBadge(status: project.status),
              ),
            ),
            _DataCell(
              DateFormat('d MMM yyyy').format(project.updatedAt),
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _ActionButton(
                    icon: Icons.edit_outlined,
                    tooltip: 'Edit Project',
                    onTap: () {
                      context.router.push(
                        CreateNewProjectRoute(projects: [project.toProject()]),
                      );
                    },
                  ),
                  const SizedBox(width: 2),
                  _ActionButton(
                    icon: Icons.delete_outline,
                    tooltip: 'Delete Project',
                    color: context.colors.error,
                    onTap: () async {
                      final confirmed = await DeleteConfirmationDialog.show(
                        context,
                        title: 'Delete Project',
                        itemName: project.title,
                        message:
                            'Are you sure you want to delete project with code "${project.code}"?',
                      );

                      if (confirmed == true && context.mounted) {
                        context.read<AllProjectsBloc>().add(
                          AllProjectsProjectDeleted(project.code),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.text, {required this.flex});

  final String text;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: context.textStyles.labelMedium.copyWith(
          color: context.colors.textSubtle,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  const _DataCell(this.text, {required this.flex, this.style});

  final String text;
  final int flex;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Text(
          text,
          style:
              style ??
              context.textStyles.bodyMedium.copyWith(
                color: context.colors.textBody,
              ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.onTap,
    this.color,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      icon: Icon(icon, size: 18, color: color ?? context.colors.textSubtle),
    );
  }
}
