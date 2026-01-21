import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/projects/presentation/bloc/all_projects_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsPagination extends StatelessWidget {
  const ProjectsPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProjectsBloc, AllProjectsState>(
      builder: (context, state) {
        if (state.projects.isEmpty) return const SizedBox.shrink();

        final totalProjects = state.projects.length;
        final currentPage = state.page;
        final pageSize = state.pageSize;
        final totalPages = (totalProjects / pageSize).ceil();

        final startItem = (currentPage - 1) * pageSize + 1;
        final endItem = (currentPage * pageSize) > totalProjects
            ? totalProjects
            : (currentPage * pageSize);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Text(
                'Showing $startItem to $endItem of $totalProjects results',
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textSubtle,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: context.colors.border),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: currentPage > 1
                          ? () {
                              context.read<AllProjectsBloc>().add(
                                AllProjectsPageChanged(currentPage - 1),
                              );
                            }
                          : null,
                      icon: const Icon(Icons.chevron_left),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 1,
                      color: context.colors.border,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Page $currentPage of $totalPages',
                        style: context.textStyles.bodyMedium,
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 1,
                      color: context.colors.border,
                    ),
                    IconButton(
                      onPressed: currentPage < totalPages
                          ? () {
                              context.read<AllProjectsBloc>().add(
                                AllProjectsPageChanged(currentPage + 1),
                              );
                            }
                          : null,
                      icon: const Icon(Icons.chevron_right),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
