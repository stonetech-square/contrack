import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';
import 'package:contrack/src/features/master_data/presentation/bloc/master_data_bloc.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/edit_agency_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgenciesTableRow extends StatelessWidget {
  final AgencyWithMinistry agencyWithMinistry;
  final List<Ministry> ministries;

  const AgenciesTableRow({
    super.key,
    required this.agencyWithMinistry,
    required this.ministries,
  });

  Future<void> _onEditPressed(BuildContext context) async {
    final updatedAgencyWithMinistry = await EditAgencyDialog.show(
      context,
      agencyWithMinistry: agencyWithMinistry,
      ministries: ministries,
    );
    if (updatedAgencyWithMinistry != null && context.mounted) {
      context.read<MasterDataBloc>().add(AgencyUpdated(updatedAgencyWithMinistry));
    }
  }

  Future<void> _onDeletePressed(BuildContext context) async {
    final agency = agencyWithMinistry.agency;
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
    final agency = agencyWithMinistry.agency;
    final ministry = agencyWithMinistry.ministry;

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
                flex: 2,
                child: Text(
                  ministry.name,
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
                      onPressed: () => _onEditPressed(context),
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
