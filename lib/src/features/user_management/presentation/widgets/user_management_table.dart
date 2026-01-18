import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/user_management_bloc.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_management_table_header.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_management_table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagementTable extends StatelessWidget {
  const UserManagementTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: 0,
      child: Column(
        children: [
          const UserManagementTableHeader(),
          Expanded(
            child: BlocBuilder<UserManagementBloc, UserManagementState>(
              builder: (context, state) {
                if (state.isLoadingUsers) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.users.isEmpty) {
                  return Center(
                    child: Text(
                      'No users found',
                      style: context.textStyles.bodyMedium.copyWith(
                        color: context.colors.textSubtle,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return UserManagementTableRow(user: state.users[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
