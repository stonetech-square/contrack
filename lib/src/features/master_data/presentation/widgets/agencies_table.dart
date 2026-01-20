import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/master_data/presentation/bloc/master_data_bloc.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/agencies_table_header.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/agencies_table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgenciesTable extends StatelessWidget {
  const AgenciesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: 0,
      child: Column(
        children: [
          const AgenciesTableHeader(),
          Expanded(
            child: BlocBuilder<MasterDataBloc, MasterDataState>(
              builder: (context, state) {
                if (state.isLoadingAgencies) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.agencies.isEmpty) {
                  return Center(
                    child: Text(
                      'No agencies found',
                      style: context.textStyles.bodyMedium.copyWith(
                        color: context.colors.textSubtle,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.agencies.length,
                  itemBuilder: (context, index) {
                    final agency = state.agencies[index];
                    return AgenciesTableRow(agency: agency);
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
