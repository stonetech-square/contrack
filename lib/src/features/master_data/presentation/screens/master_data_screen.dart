import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/features/master_data/presentation/bloc/master_data_bloc.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/agencies_table.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/master_data_search_field.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/master_data_section_header.dart';
import 'package:contrack/src/features/master_data/presentation/widgets/ministries_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class MasterDataScreen extends StatelessWidget {
  const MasterDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<MasterDataBloc>()..add(const MasterDataStarted()),
      child: const MasterDataView(),
    );
  }
}

class MasterDataView extends StatefulWidget {
  const MasterDataView({super.key});

  @override
  State<MasterDataView> createState() => _MasterDataViewState();
}

class _MasterDataViewState extends State<MasterDataView> {
  int _expandedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const RouteHeader(
              routePath: ['Master Data Management'],
              canPop: false,
            ),
            const Spacer(),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _expandedIndex == 0
                        ? context.colors.primary
                        : context.colors.border,
                  ),
                ),
                backgroundColor: _expandedIndex == 0
                    ? context.colors.primary
                    : context.colors.surfaceVariant,
                foregroundColor: _expandedIndex == 0
                    ? context.colors.onPrimary
                    : context.colors.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _expandedIndex = 0;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Agency'),
            ),
            const SizedBox(width: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _expandedIndex == 1
                        ? context.colors.primary
                        : context.colors.border,
                  ),
                ),
                backgroundColor: _expandedIndex == 1
                    ? context.colors.primary
                    : context.colors.surfaceVariant,
                foregroundColor: _expandedIndex == 1
                    ? context.colors.onPrimary
                    : context.colors.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _expandedIndex = 1;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Ministry'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Expanded(
          child: BlocBuilder<MasterDataBloc, MasterDataState>(
            builder: (context, state) {
              return Column(
                children: [
                  MasterDataSectionHeader(
                    title: 'Agencies',
                    count: state.agencies.length,
                    isExpanded: _expandedIndex == 0,
                    onTap: () => setState(() => _expandedIndex = 0),
                  ),
                  if (_expandedIndex == 0)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          children: [
                            MasterDataSearchField(
                              hintText: 'Search agencies...',
                              onChanged: (val) => context
                                  .read<MasterDataBloc>()
                                  .add(AgencySearchChanged(val)),
                            ),
                            const SizedBox(height: 16),
                            const Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                child: AgenciesTable(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  MasterDataSectionHeader(
                    title: 'Ministries',
                    count: state.ministries.length,
                    isExpanded: _expandedIndex == 1,
                    onTap: () => setState(() => _expandedIndex = 1),
                  ),
                  if (_expandedIndex == 1)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          children: [
                            MasterDataSearchField(
                              hintText: 'Search ministries...',
                              onChanged: (val) => context
                                  .read<MasterDataBloc>()
                                  .add(MinistrySearchChanged(val)),
                            ),
                            const SizedBox(height: 16),
                            const Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                child: MinistriesTable(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
