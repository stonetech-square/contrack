import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/recent_projects_table_row.dart';
import 'package:flutter/material.dart';

class RecentProjectsTableBody extends StatelessWidget {
  const RecentProjectsTableBody({super.key, required this.projects});

  final List<ProjectWithDetails> projects;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        projects.length,
        (index) => RecentProjectsTableRow(
          project: projects[index],
          index: index + 1,
        ),
      ),
    );
  }
}
