import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            RouteHeader(routePath: ['Dashboard'], canPop: false),
            const Spacer(),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(150, 45),
                maximumSize: const Size(200, 45),
              ),
              onPressed: () {},
              child: const Text('Export Projects'),
            ),
          ],
        ),
        SizedBox(height: 23),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: ProjectsStats()),
            SizedBox(width: 24),
            Expanded(flex: 1, child: QuickActionCard()),
          ],
        ),
        SizedBox(height: 24),
        Expanded(child: RecentProjects(isAdmin: true)),
        SizedBox(height: 24),
      ],
    );
  }
}
