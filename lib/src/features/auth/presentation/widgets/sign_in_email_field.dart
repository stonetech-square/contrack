import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInEmailField extends StatelessWidget {
  final TextEditingController controller;

  const SignInEmailField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: 'Email Address',
      hintText: 'your.email@cpms.gov.ng',
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}
