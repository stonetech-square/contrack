import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/project_status_badge.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/sync_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentProjectsTableRow extends StatelessWidget {
  const RecentProjectsTableRow({
    super.key,
    required this.project,
    required this.index,
  });

  final ProjectWithDetails project;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: ValueKey(project.code),
        onTap: () => context.router.navigate(
          AllProjectRoute(children: [ProjectRoute(projectCode: project.code)]),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: context.colors.border, width: 0.8),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DataCell(
                '$index',
                flex: 1,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textHeading,
                ),
              ),
              _DataCell(
                project.code,
                flex: 2,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textHeading,
                  fontWeight: FontWeight.w600,
                ),
              ),
              _DataCell(
                project.agencyName,
                flex: 4,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textBody,
                ),
              ),
              _DataCell(
                project.stateName,
                flex: 2,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textHeading,
                ),
              ),
              Expanded(
                flex: 2,
                child: ProjectStatusBadge(status: project.status),
              ),
              _DataCell(
                _formatDate(project.updatedAt),
                flex: 2,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textHeading,
                ),
              ),
              Expanded(
                flex: 2,
                child: SyncStatusBadge(isSynced: project.isSynced),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
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
        padding: const EdgeInsets.only(right: 16),
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
