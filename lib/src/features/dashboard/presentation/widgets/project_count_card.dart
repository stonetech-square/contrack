import 'package:contrack/src/app/presentation/widgets/app_card.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class DashboardCountCard extends StatelessWidget {
  const DashboardCountCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    this.iconForegroundColor,
    this.iconBackgroundColor,
  });
  final String title;
  final int count;
  final IconData icon;
  final Color? iconForegroundColor;
  final Color? iconBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      constraints: BoxConstraints(maxWidth: 281, minWidth: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: iconBackgroundColor ?? context.colors.bgBlue,
            ),
            child: Center(
              child: Icon(
                icon,
                size: 19,
                color: iconForegroundColor ?? context.colors.black,
              ),
            ),
          ),
          SizedBox(height: 9),
          Text(
            title,
            style: context.textStyles.titleMedium.copyWith(
              color: context.colors.textBody,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 9),
          Text(
            '$count',
            style: context.textStyles.titleMedium.copyWith(
              color: context.colors.textHeading,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
