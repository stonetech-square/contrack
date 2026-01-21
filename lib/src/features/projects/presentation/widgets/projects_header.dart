import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/tables/tables.dart';
import 'package:contrack/src/features/projects/presentation/bloc/all_projects_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/export_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsHeader extends StatelessWidget {
  const ProjectsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProjectsBloc, AllProjectsState>(
      buildWhen: (previous, current) =>
          previous.projects.length != current.projects.length ||
          previous.isExporting != current.isExporting,
      builder: (context, state) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Management',
                  style: context.textStyles.headlineSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colors.textHeading,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${state.projects.length} projects found',
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textSubtle,
                  ),
                ),
              ],
            ),
            const Spacer(),
            FilledButton.icon(
              onPressed: state.isExporting
                  ? null
                  : () async {
                      final result = await ExportTypeDialog.show(context);
                      if (result != null && context.mounted) {
                        context.read<AllProjectsBloc>().add(
                          AllProjectsExportRequested(
                            ExportFormat.csv,
                            type: result,
                          ),
                        );
                      }
                    },
              style: FilledButton.styleFrom(
                minimumSize: const Size(120, 45),
                backgroundColor: context.colors.surfaceVariant,
                side: BorderSide(color: context.colors.border),

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
                      Icons.download_rounded,
                      size: 20,
                      color: context.colors.primary,
                    ),
              label: Text(
                'Export Data',
                style: context.textStyles.labelLarge.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            FilledButton.icon(
              icon: Icon(Icons.upload_rounded),
              style: FilledButton.styleFrom(
                minimumSize: const Size(130, 45),
                maximumSize: const Size(180, 45),
                backgroundColor: context.colors.neutralInverted,
                foregroundColor: context.colors.neutral,
              ),
              onPressed: () {
                context.read<AllProjectsBloc>().add(
                  const AllProjectsImportRequested(),
                );
              },
              label: const Text('Import Projects'),
            ),
            const SizedBox(width: 16),
            FilledButton.icon(
              onPressed: () {
                context.router.push(CreateNewProjectRoute());
              },
              style: FilledButton.styleFrom(
                backgroundColor: context.colors.primary,
                minimumSize: const Size(120, 45),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(Icons.add, size: 20, color: context.colors.onPrimary),
              label: Text(
                'Add Project',
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
