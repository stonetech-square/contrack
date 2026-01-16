import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        RouteHeader(routePath: ['Dashboard'], canPop: false),
        SizedBox(height: 23),
      ],
    );
  }
}
