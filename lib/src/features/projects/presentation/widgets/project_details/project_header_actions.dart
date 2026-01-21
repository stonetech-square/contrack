import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/tables/export_history.dart';

import 'package:contrack/src/features/projects/presentation/bloc/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectHeaderActions extends StatelessWidget {
  const ProjectHeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return Row(
          children: [
            FilledButton.icon(
              onPressed: state.isExporting
                  ? null
                  : () {
                      context.read<ProjectBloc>().add(
                        ProjectExportRequestedEvent(ExportFormat.csv),
                      );
                    },
              style: FilledButton.styleFrom(
                backgroundColor: context.colors.neutralInverted,
                side: BorderSide(color: context.colors.border),
                minimumSize: const Size(130, 44.28),
                maximumSize: const Size(140, 44.28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: state.isExporting
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.colors.primary,
                      ),
                    )
                  : Icon(
                      Icons.file_download,
                      size: 20,
                      color: context.colors.primary,
                    ),
              label: Text(
                'Export',
                style: context.textStyles.labelLarge.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: () {
                if (state.project == null) return;
                final project = state.project!;
                final projectEntity = project.toProject();
                context.router.push(
                  CreateNewProjectRoute(projects: [projectEntity]),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(130, 44.28),
                maximumSize: const Size(140, 44.28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(
                Icons.edit_outlined,
                size: 20,
                color: context.colors.onPrimary,
              ),
              label: Text(
                'Edit Entry',
                style: context.textStyles.labelLarge.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
