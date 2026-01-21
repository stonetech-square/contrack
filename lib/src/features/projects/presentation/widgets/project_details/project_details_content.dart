import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_details/project_info_section.dart';
import 'package:contrack/src/features/projects/presentation/widgets/sync_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ProjectDetailsContent extends StatelessWidget {
  const ProjectDetailsContent({super.key, required this.project});

  final ProjectWithDetails project;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          ProjectInfoSection(
            title: 'Agency & Ministry',
            icon: Icons.business_outlined,
            children: [
              InfoRow(
                items: [
                  InfoItem(
                    label: 'Agency/Department',
                    value: project.agencyName,
                  ),
                  InfoItem(label: 'Ministry', value: project.ministryName),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          ProjectInfoSection(
            title: 'Project Timeline & Budget',
            icon: Icons.access_time,
            children: [
              InfoRow(
                items: [
                  InfoItem(
                    label: 'Start Date',
                    value: project.startDate != null
                        ? DateFormat('d MMMM yyyy').format(project.startDate!)
                        : 'Not set',
                  ),
                  InfoItem(
                    label: 'End Date',
                    value: project.endDate != null
                        ? DateFormat('d MMMM yyyy').format(project.endDate!)
                        : 'Not set',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              InfoRow(
                items: [
                  InfoItem(
                    label: 'Budget Allocation',
                    value: NumberFormat.currency(
                      symbol: '₦',
                      decimalDigits: 2,
                    ).format(project.amount),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          ProjectInfoSection(
            title: 'Location',
            icon: Icons.location_on_outlined,
            children: [
              InfoRow(
                items: [
                  InfoItem(label: 'State', value: project.stateName),
                  InfoItem(label: 'Geopolitical Zone', value: project.zoneName),
                ],
              ),
            ],
          ),

          ProjectInfoSection(
            title: 'Entry Metadata',
            icon: Icons.calendar_today_outlined,
            children: [
              Builder(
                builder: (context) {
                  final currentUser = GetIt.I<UserSession>().currentUser;
                  final currentUserId = currentUser?.uid;

                  var creatorName =
                      project.createdByName ??
                      'User ${project.createdBy.substring(0, 4)}...';
                  if (project.createdBy == currentUserId) {
                    creatorName = '$creatorName (You)';
                  }

                  final modifiedBy = project.modifiedBy;
                  var modifierName =
                      project.modifiedByName ??
                      (modifiedBy != null
                          ? 'User ${modifiedBy.substring(0, 4)}...'
                          : '--');

                  if (modifiedBy == currentUserId) {
                    modifierName = '$modifierName (You)';
                  }

                  return Column(
                    children: [
                      InfoRow(
                        items: [
                          InfoItem(label: 'Created By', value: creatorName),
                          InfoItem(
                            label: 'Created Date',
                            value: DateFormat(
                              'd MMMM yyyy a HH:mm',
                            ).format(project.createdAt),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      InfoRow(
                        items: [
                          InfoItem(label: 'Modified By', value: modifierName),
                          InfoItem(
                            label: 'Modified At',
                            value: modifiedBy != null
                                ? DateFormat(
                                    'd MMMM yyyy a HH:mm',
                                  ).format(project.updatedAt)
                                : '--',
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
          ProjectInfoSection(
            title: 'Local Database Information',
            icon: Icons.storage_outlined,
            backgroundColor: context.colors.info.withValues(alpha: 0.2),
            children: [
              InfoItem(
                label: 'Sync Status',
                value: null,
                valueWidget: Align(
                  alignment: Alignment.centerLeft,
                  child: SyncStatusBadge(isSynced: project.isSynced),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
