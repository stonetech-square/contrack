import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/app/presentation/widgets/user_profile_dialog.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({super.key, required this.user});
  // TODO: temp, should not use model in presentation (fix when refactor )
  final AppUserModel? user;

  @override
  Widget build(BuildContext context) {
    final name = user?.fullName ?? 'Guest';
    final role = user?.role ?? UserRole.regular;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),

        onTap: user != null
            ? () {
                UserProfileDialog.show(context, user: user!);
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: context.colors.secondary,
                child: Center(
                  child: Text(
                    name.initials,
                    style: context.textStyles.bodyMedium.copyWith(
                      fontSize: 12,
                      color: context.colors.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textStyles.bodyMedium.copyWith(fontSize: 12),
                  ),
                  Text(
                    role.displayName,
                    style: context.textStyles.bodySmall.copyWith(
                      fontSize: 10,
                      color: context.colors.onCardSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
