import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key, required this.projectId});
  final int projectId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: () => context.router.pop(), child: Text('Back')),
        Text('Projects/$projectId'),
      ],
    );
  }
}
