import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key, required this.projectId});
  final int projectId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        RouteHeader(routePath: ['Projects', '$projectId'], canPop: true),
      ],
    );
  }
}
