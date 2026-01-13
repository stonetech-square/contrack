import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/utils/string_extensions.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const LogoutDialog(),
    );
  }

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  bool _isLoading = false;

  void _onLogoutPressed() {
    setState(() {
      _isLoading = true;
    });
    context.read<AppBloc>().add(const AppLogedOut());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        if (state.user == null) {
          Navigator.of(context).pop();
        }
        if (state.error != null) {
          setState(() {
            _isLoading = false;
          });
          context.toast.error(
            title: 'Logout Failed',
            state.error ?? 'Something went wrong',
          );
        }
      },
      builder: (context, state) => PopScope(
        canPop: !_isLoading,
        child: Dialog(
          backgroundColor: context.colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400, minWidth: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _LogoutHeader(user: state.user),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Are you sure you want to logout this user?',
                        style: context.textStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 64),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: _isLoading
                                  ? null
                                  : () => Navigator.of(context).pop(),
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    context.colors.onSurfaceVariant,
                                backgroundColor: context.colors.surfaceVariant,
                                minimumSize: Size.fromHeight(54),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: FilledButton(
                              onPressed: _isLoading ? null : _onLogoutPressed,
                              style: FilledButton.styleFrom(
                                backgroundColor: context.colors.error,
                                foregroundColor: context.colors.onError,
                                minimumSize: Size.fromHeight(54),
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: _isLoading
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              context.colors.onError,
                                            ),
                                      ),
                                    )
                                  : const Text('Logout'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoutHeader extends StatelessWidget {
  const _LogoutHeader({required this.user});

  final AppUserModel? user;

  @override
  Widget build(BuildContext context) {
    final fullName = user?.fullName ?? 'Guest';
    final email = user?.email ?? '--';
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: context.colors.primary.withValues(alpha: 0.1),
            child: Text(
              fullName.initials,
              style: context.textStyles.titleMedium.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: context.textStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  email,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
