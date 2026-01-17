import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/recent_projects_table_row.dart';
import 'package:flutter/material.dart';

class RecentProjectsTableBody extends StatelessWidget {
  const RecentProjectsTableBody({
    super.key,
    required this.projects,
    this.isAdmin = false,
    this.currentUserId,
  });

  final List<ProjectWithDetails> projects;
  final bool isAdmin;
  final int? currentUserId;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        projects.length,
        (index) => RecentProjectsTableRow(
          project: projects[index],
          index: index + 1,
          isAdmin: isAdmin,
          currentUserId: currentUserId,
        ),
      ),
    );
  }
}
