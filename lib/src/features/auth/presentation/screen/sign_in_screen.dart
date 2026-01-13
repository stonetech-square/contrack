import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:contrack/src/features/auth/domain/usecase/sign_in_use_case.dart';
import 'package:contrack/src/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:contrack/src/features/auth/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(GetIt.I.get<SignInUseCase>()),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  var _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignInPressed() {
    setState(() {
      _autovalidateMode = AutovalidateMode.onUserInteraction;
    });
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<SignInBloc>(context).add(
        SignInSubmitted(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            context.toast.error(
              title: 'Sign In Failed',
              state.errorMessage ?? 'Authentication failed',
            );
          }
        },
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 400, maxWidth: 600),
              child: Card(
                elevation: 0,
                color: context.colors.card,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: context.colors.border),
                ),
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: _autovalidateMode,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: context.colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.article_outlined,
                            color: context.colors.white,
                            size: 32,
                          ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Constituency Project\nManagement System',
                          textAlign: TextAlign.center,
                          style: context.textStyles.headlineSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colors.onCard,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Sign in to your account',
                          textAlign: TextAlign.center,
                          style: context.textStyles.bodyMedium.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: 32),
                        SignInEmailField(controller: _emailController),
                        SizedBox(height: 16),
                        SignInPasswordField(controller: _passwordController),
                        SizedBox(height: 24),
                        SignInButton(onPressed: _onSignInPressed),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
