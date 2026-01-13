import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.constraints,
  });
  final Widget child;
  final double? padding;
  final BoxConstraints? constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 24),
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.border, width: 0.8),
        color: context.colors.card,
      ),
      child: child,
    );
  }
}
