import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/user_management_bloc.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_management_search_field.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_management_stats_and_actions.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_management_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<UserManagementBloc>()..add(const UserWatchStarted()),
      child: const _UserManagementView(),
    );
  }
}

class _UserManagementView extends StatelessWidget {
  const _UserManagementView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const RouteHeader(routePath: ['User Management'], canPop: false),
        const SizedBox(height: 24),
        const UserManagementStatsAndActions(),
        const SizedBox(height: 24),
        UserManagementSearchField(),
        const SizedBox(height: 24),
        const Expanded(child: UserManagementTable()),
        const SizedBox(height: 24),
      ],
    );
  }
}
