import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/sync/app_sync_status.dart';
import 'package:flutter/material.dart';

class OnlineIndicator extends StatelessWidget {
  const OnlineIndicator({super.key, required this.status, this.onTap});
  final AppSyncStatus status;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = _getForegroundColor(context, status);
    final backgroundColor = _getBackgroundColor(context, status);

    return InkWell(
      onTap: status == AppSyncStatus.syncing ? null : onTap,
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: foregroundColor.withValues(alpha: 0.1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _buildIcon(status, foregroundColor),
            ),
            const SizedBox(width: 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                _getLabel(status),
                key: ValueKey('text_${status.name}'),
                style: context.textStyles.bodySmall.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getForegroundColor(BuildContext context, AppSyncStatus status) {
    switch (status) {
      case AppSyncStatus.online:
        return context.colors.success;
      case AppSyncStatus.offline:
        return context.colors.error;
      case AppSyncStatus.syncing:
        return context.colors.warning;
    }
  }

  Color _getBackgroundColor(BuildContext context, AppSyncStatus status) {
    switch (status) {
      case AppSyncStatus.online:
        return context.colors.success.withValues(alpha: 0.1);
      case AppSyncStatus.offline:
        return context.colors.error.withValues(alpha: 0.1);
      case AppSyncStatus.syncing:
        return context.colors.warning.withValues(alpha: 0.1);
    }
  }

  String _getLabel(AppSyncStatus status) {
    switch (status) {
      case AppSyncStatus.online:
        return 'Online';
      case AppSyncStatus.offline:
        return 'Offline';
      case AppSyncStatus.syncing:
        return 'Syncing...';
    }
  }

  Widget _buildIcon(AppSyncStatus status, Color color) {
    if (status == AppSyncStatus.syncing) {
      return SizedBox(
        key: const ValueKey('icon_syncing'),
        width: 14,
        height: 14,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }
    return Icon(
      status == AppSyncStatus.online ? Icons.wifi : Icons.wifi_off,
      key: ValueKey('icon_${status.name}'),
      color: color,
      size: 16,
    );
  }
}
