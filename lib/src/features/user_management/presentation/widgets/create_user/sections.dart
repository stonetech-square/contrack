import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/create_user/create_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.title,
    required this.icon,
    required this.children,
    super.key,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      constraints: const BoxConstraints(minWidth: 360, maxWidth: 390),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: context.colors.bgGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: context.colors.neutral, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: context.textStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colors.textHeading,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }
}

class IdentityCard extends StatelessWidget {
  const IdentityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'User Identification',
      icon: Icons.person_outline,
      children: [
        BlocBuilder<CreateUserBloc, CreateUserState>(
          buildWhen: (p, c) => p.fullName != c.fullName,
          builder: (context, state) {
            return AppTextField(
              label: 'Full Name',
              hintText: 'Enter full name',
              onChanged: (value) => context.read<CreateUserBloc>().add(
                CreateUserFullNameChanged(value),
              ),
              errorText: state.fullName.isNotValid
                  ? 'Full name is required'
                  : null,
            );
          },
        ),
        const SizedBox(height: 16),
        BlocBuilder<CreateUserBloc, CreateUserState>(
          buildWhen: (p, c) => p.username != c.username,
          builder: (context, state) {
            return AppTextField(
              label: 'Username',
              hintText: 'Enter username',
              onChanged: (value) => context.read<CreateUserBloc>().add(
                CreateUserUsernameChanged(value),
              ),
              errorText: state.username.isNotValid
                  ? 'Username is required'
                  : null,
            );
          },
        ),
      ],
    );
  }
}

class AccessControlCard extends StatelessWidget {
  const AccessControlCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Access Control',
      icon: Icons.lock_outline,
      children: [
        BlocBuilder<CreateUserBloc, CreateUserState>(
          buildWhen: (p, c) => p.email != c.email,
          builder: (context, state) {
            return AppTextField(
              label: 'Email Address',
              hintText: 'Enter email address',
              onChanged: (value) => context.read<CreateUserBloc>().add(
                CreateUserEmailChanged(value),
              ),
              errorText: state.email.isNotValid
                  ? 'Valid email is required'
                  : null,
            );
          },
        ),
        const SizedBox(height: 16),
        BlocBuilder<CreateUserBloc, CreateUserState>(
          buildWhen: (p, c) => p.role != c.role,
          builder: (context, state) {
            return AppDropDownField<UserRole>(
              label: 'User Role',
              hintText: 'Select Role',
              value: state.role.value,
              items: UserRole.values.map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role.displayName),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  context.read<CreateUserBloc>().add(
                    CreateUserRoleChanged(value),
                  );
                }
              },
              errorText: state.role.isNotValid ? 'Role is required' : null,
            );
          },
        ),
      ],
    );
  }
}
