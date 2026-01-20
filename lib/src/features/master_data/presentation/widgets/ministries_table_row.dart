import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';
import 'package:flutter/material.dart';

class MinistriesTableRow extends StatelessWidget {
  final MinistryWithAgency ministryWithAgency;

  const MinistriesTableRow({super.key, required this.ministryWithAgency});

  @override
  Widget build(BuildContext context) {
    final ministry = ministryWithAgency.ministry;
    final agency = ministryWithAgency.agency;

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
                  ministry.name,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textBody,
                  ),
                ),
              ),
              const SizedBox(width: 16),
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
                  ministry.code ?? '',
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
                      onPressed: () {},
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
