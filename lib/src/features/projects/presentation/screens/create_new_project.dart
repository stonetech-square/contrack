import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';

import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_action.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_form.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CreateNewProjectScreen extends StatelessWidget {
  const CreateNewProjectScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<CreateNewProjectBloc>()..add(CreateNewProjectStartedEvent()),
      child: const CreateNewProjectView(),
    );
  }
}

class CreateNewProjectView extends StatelessWidget {
  const CreateNewProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNewProjectBloc, CreateNewProjectState>(
      listener: (context, state) {
        if (state.viewStatus == CreateProjectViewStatus.success) {
          context.toast.success(
            'Project created successfully',
            title: 'New Entry',
          );
          context.pop();
        }
        if (state.viewStatus == CreateProjectViewStatus.cancelled) {
          context.pop();
        }
        if (state.viewStatus == CreateProjectViewStatus.failure) {
          context.toast.error(
            state.errorMessage,
            title: 'Failed to create project',
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteHeader(routePath: ['Projects', 'New Project'], canPop: true),
            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [CreatNewProjectHeader(), CreateNewProjectAction()],
            ),
            SizedBox(height: 23),
            CreateNewProjectForm(),
          ],
        ),
      ),
    );
  }
}
