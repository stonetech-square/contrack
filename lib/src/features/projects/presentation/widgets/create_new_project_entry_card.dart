import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CreatNewProjectEntryCard extends StatelessWidget {
  const CreatNewProjectEntryCard({
    super.key,
    required this.headerText,
    required this.headerIcon,
    required this.children,
  });
  final String headerText;
  final IconData headerIcon;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      constraints: BoxConstraints(minWidth: 360, maxWidth: 390),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                decoration: BoxDecoration(
                  color: context.colors.bgGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(headerIcon, color: context.colors.neutral),
              ),
              SizedBox(width: 12),
              Text(
                headerText,
                style: context.textStyles.titleLarge.copyWith(
                  color: context.colors.textHeading,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }
}
