import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/master_data/presentation/bloc/master_data_bloc.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/ministries_table_header.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/ministries_table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MinistriesTable extends StatelessWidget {
  const MinistriesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: 0,
      child: Column(
        children: [
          const MinistriesTableHeader(),
          Expanded(
            child: BlocBuilder<MasterDataBloc, MasterDataState>(
              builder: (context, state) {
                if (state.isLoadingMinistries) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.ministries.isEmpty) {
                  return Center(
                    child: Text(
                      'No ministries found',
                      style: context.textStyles.bodyMedium.copyWith(
                        color: context.colors.textSubtle,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.ministries.length,
                  itemBuilder: (context, index) {
                    final ministryWithAgency = state.ministries[index];
                    return MinistriesTableRow(
                      ministryWithAgency: ministryWithAgency,
                    );
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
