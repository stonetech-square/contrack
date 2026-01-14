import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class RouteHeader extends StatelessWidget {
  const RouteHeader({super.key, required this.routePath, this.canPop = false});
  final List<String> routePath;
  final bool canPop;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (canPop)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => context.router.pop(),
              child: Icon(Icons.chevron_left, color: context.colors.textSubtle),
            ),
          ),
        Text(
          routePath.join(' / '),
          style: context.textStyles.titleMedium.copyWith(
            color: context.colors.textSubtle,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
