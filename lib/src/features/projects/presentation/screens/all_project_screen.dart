import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/projects/presentation/bloc/all_projects_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<AllProjectsBloc>()..add(const AllProjectsWatchStarted()),
      child: const AllProjectsView(),
    );
  }
}

class AllProjectsView extends StatelessWidget {
  const AllProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        RouteHeader(routePath: ['Projects'], canPop: false),
        SizedBox(height: 23),
        //TODO replace all below with actual UI
        AppTextField(
          controller: TextEditingController(),
          onChanged: (value) {
            context.read<AllProjectsBloc>().add(
              AllProjectsWatchStarted(query: value),
            );
          },
        ),
        BlocBuilder<AllProjectsBloc, AllProjectsState>(
          buildWhen: (previous, current) =>
              previous.projects != current.projects,
          builder: (context, state) {
            return Column(
              children: [
                if (state.isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (state.errorMessage != null) Text(state.errorMessage!),
                if (state.projects.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.projects.length,
                    itemBuilder: (context, index) {
                      final project = state.projects[index];
                      return ListTile(
                        title: Text(project.title),
                        subtitle: Text(project.code),
                      );
                    },
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
