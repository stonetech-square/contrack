import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/user_management_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagementSearchField extends StatelessWidget {
  const UserManagementSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: 'Search by name or email...',
      prefixIcon: const Icon(Icons.search),
      onChanged: (value) {
        context.read<UserManagementBloc>().add(
          UserWatchStarted(searchQuery: value),
        );
      },
    );
  }
}
