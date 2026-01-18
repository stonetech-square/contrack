import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/create_user/create_user_bloc.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/create_user/header_actions.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/create_user/offline_warning.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/create_user/user_form_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<CreateUserBloc>(),
      child: const _CreateUserView(),
    );
  }
}

class _CreateUserView extends StatelessWidget {
  const _CreateUserView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUserBloc, CreateUserState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          context.toast.success(title: 'Success', 'User created successfully');
          context.router.back();
        } else if (state.status == FormzSubmissionStatus.failure) {
          context.toast.error(
            title: 'Error',
            state.errorMessage ?? 'Failed to create user',
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RouteHeader(routePath: ['User Management', 'Create User']),
            const SizedBox(height: 23),
            const HeaderActions(),
            const SizedBox(height: 23),
            const OfflineWarning(),
            const Expanded(child: UserFormContent()),
          ],
        ),
      ),
    );
  }
}
