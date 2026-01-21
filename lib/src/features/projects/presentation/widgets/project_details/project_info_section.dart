import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class ProjectInfoSection extends StatelessWidget {
  const ProjectInfoSection({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
    this.backgroundColor,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: backgroundColor == null
            ? null
            : Border.all(color: context.colors.info.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: context.colors.textHeading),
              const SizedBox(width: 8),
              Text(
                title,
                style: context.textStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colors.textHeading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.items});

  final List<InfoItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Expanded(child: item)).toList(),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.label,
    required this.value,
    this.valueWidget,
  });

  final String label;
  final String? value;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textSubtle,
          ),
        ),
        const SizedBox(height: 8),
        if (valueWidget != null)
          valueWidget!
        else
          Text(
            value ?? '-',
            style: context.textStyles.bodyLarge.copyWith(
              color: context.colors.textBody,
              height: 1.4,
            ),
          ),
      ],
    );
  }
}
