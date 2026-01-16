import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';

import 'package:contrack/src/features/dashboard/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DasboardOverview extends StatelessWidget {
  const DasboardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return state.user?.role.isAnyAdmin ?? false
            ? AdminDashboard()
            : RegularDashboard();
      },
    );
  }
}
