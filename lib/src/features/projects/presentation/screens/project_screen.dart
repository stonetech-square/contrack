import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/projects/presentation/bloc/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key, required this.projectCode});
  final String projectCode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey(projectCode),
      create: (context) =>
          GetIt.instance.get<ProjectBloc>()
            ..add(ProjectFetchByCodeEvent(projectCode)),
      lazy: false,
      child: ProjectView(projectCode: projectCode),
    );
  }
}

class ProjectView extends StatelessWidget {
  const ProjectView({super.key, required this.projectCode});

  final String projectCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        RouteHeader(routePath: ['Projects', projectCode], canPop: true),
        SizedBox(height: 32),
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            return Text(state.project?.title ?? 'No data');
          },
        ),
      ],
    );
  }
}
