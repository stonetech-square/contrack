import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SignInPasswordField extends StatefulWidget {
  final TextEditingController controller;

  const SignInPasswordField({required this.controller, super.key});

  @override
  State<SignInPasswordField> createState() => _SignInPasswordFieldState();
}

class _SignInPasswordFieldState extends State<SignInPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'Password',
      hintText: 'Enter your password',
      obscureText: _obscureText,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: context.colors.onSurfaceVariant,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
