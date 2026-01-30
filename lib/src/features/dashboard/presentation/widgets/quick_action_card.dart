import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/presentation/widgets/app_card.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/export_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      constraints: BoxConstraints(maxHeight: 335),
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.user != current.user ||
            previous.syncStatus != current.syncStatus,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Quick Actions',
                style: context.textStyles.titleMedium.copyWith(
                  color: context.colors.textHeading,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Common administrative tasks.',
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textSubtle,
                ),
              ),
              SizedBox(height: 16),
              _ActionItem(
                icon: Icons.description_outlined,
                title: 'Generate Report',
                subtitle: 'Export comprehensive data',
                onTap: () async {
                  final result = await ExportTypeDialog.show(context);
                  if (result != null && context.mounted) {
                    context.read<DashboardBloc>().add(
                      DashboardExportRequested(result.$1, type: result.$2),
                    );
                  }
                },
              ),
              SizedBox(height: 12),
              if (state.user?.role.isSuperAdmin ?? false) ...[
                _ActionItem(
                  icon: Icons.person_add_outlined,
                  title: 'Add Staff',
                  subtitle: 'Create new user account',
                  onTap: () => context.navigateTo(
                    const UserManagementRoute(children: [CreateUserRoute()]),
                  ),
                ),
                SizedBox(height: 12),
              ],

              _ActionItem(
                icon: Icons.download_outlined,
                title: 'Sync Data',
                subtitle: 'Force database sync',
                onTap: () => context.read<AppBloc>().add(AppSyncRequested()),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgGray,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colors.border.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: context.colors.textHeading, size: 20),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textStyles.bodyMedium.copyWith(
                      color: context.colors.textHeading,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textSubtle,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
