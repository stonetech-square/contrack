import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class MasterDataSectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final bool isExpanded;
  final VoidCallback onTap;

  const MasterDataSectionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isExpanded
              ? context.colors.primary
              : context.colors.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
          border: isExpanded ? Border.all(color: context.colors.primary) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: context.textStyles.titleMedium.copyWith(
                    color: isExpanded
                        ? context.colors.onPrimary
                        : context.colors.onSurfaceVariant,
                    fontWeight: isExpanded
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: isExpanded
                        ? context.colors.onPrimary.withValues(alpha: 0.2)
                        : context.colors.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    count.toString(),
                    style: context.textStyles.labelSmall.copyWith(
                      color: isExpanded
                          ? context.colors.onPrimary
                          : context.colors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: isExpanded
                  ? context.colors.onPrimary
                  : context.colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
