import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignInButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SignInButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return FilledButton(
          onPressed: state.status.isInProgress ? null : onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: context.colors.black,
            foregroundColor: context.colors.white,
            disabledBackgroundColor: context.colors.black.withValues(
              alpha: 0.5,
            ),
            disabledForegroundColor: context.colors.white.withValues(
              alpha: 0.5,
            ),
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: state.status.isInProgress
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      context.colors.white,
                    ),
                  ),
                )
              : Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        );
      },
    );
  }
}
