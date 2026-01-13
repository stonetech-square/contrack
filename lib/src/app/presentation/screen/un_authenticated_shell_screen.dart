import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class UnAuthenticatedShellScreen extends StatelessWidget {
  const UnAuthenticatedShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
