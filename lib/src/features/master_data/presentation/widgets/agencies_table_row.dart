import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/presentation/bloc/master_data_bloc.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgenciesTableRow extends StatelessWidget {
  final Agency agency;

  const AgenciesTableRow({super.key, required this.agency});

  Future<void> _onDeletePressed(BuildContext context) async {
    final confirmed = await DeleteConfirmationDialog.show(
      context,
      title: 'Delete Agency',
      itemName: agency.name,
    );
    if (confirmed == true && context.mounted) {
      context.read<MasterDataBloc>().add(AgencyDeleted(agency));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: context.colors.border)),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  agency.name,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textBody,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  agency.code ?? '',
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textSubtle,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      tooltip: 'Edit',
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 20,
                        color: context.colors.textSubtle,
                      ),
                    ),
                    IconButton(
                      onPressed: () => _onDeletePressed(context),
                      tooltip: 'Delete',
                      icon: Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: context.colors.error,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
