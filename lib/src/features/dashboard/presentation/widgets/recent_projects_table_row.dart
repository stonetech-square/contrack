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
    this.isAdmin = false,
    this.currentUserId,
  });

  final ProjectWithDetails project;
  final int index;
  final bool isAdmin;
  final int? currentUserId;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: ValueKey(project.code),
        onTap: () => context.router.navigate(
          ShellProjectRoute(
            children: [ProjectRoute(projectCode: project.code)],
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
                flex: 3,
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
              if (isAdmin)
                _DataCell(
                  _getUpdatedByDisplayName(),
                  flex: 2,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textHeading,
                  ),
                ),
              _DataCell(
                isAdmin
                    ? _formatRelativeDate(project.updatedAt)
                    : _formatDate(project.updatedAt),
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

  String _getUpdatedByDisplayName() {
    final modifiedById = project.modifiedBy;
    final createdById = project.createdBy;

    if (modifiedById != null) {
      if (currentUserId != null && modifiedById == currentUserId) {
        return 'You';
      }
      return project.modifiedByName ?? 'Unknown';
    }

    if (currentUserId != null && createdById == currentUserId) {
      return 'You';
    }
    return project.createdByName ?? 'Unknown';
  }

  String _formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  String _formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 14) {
      return '1 week ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks weeks ago';
    } else if (difference.inDays < 60) {
      return '1 month ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months months ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return years == 1 ? '1 year ago' : '$years years ago';
    }
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
