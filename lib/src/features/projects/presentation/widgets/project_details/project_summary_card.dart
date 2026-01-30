import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_status_badge.dart';
import 'package:flutter/material.dart';

class ProjectSummaryCard extends StatelessWidget {
  const ProjectSummaryCard({super.key, required this.project});

  final ProjectWithDetails project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Project Code',
                    style: context.textStyles.bodyMedium.copyWith(
                      color: context.colors.onPrimary.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project.code,
                    style: context.textStyles.headlineMedium.copyWith(
                      color: context.colors.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ProjectStatusBadge(status: project.inHouseStatus),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project Title',
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.onPrimary.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                project.title,
                style: context.textStyles.headlineMedium.copyWith(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
