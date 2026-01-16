import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectEntryTabs extends StatefulWidget {
  const ProjectEntryTabs({super.key, required this.state});

  final CreateNewProjectState state;

  @override
  State<ProjectEntryTabs> createState() => _ProjectEntryTabsState();
}

class _ProjectEntryTabsState extends State<ProjectEntryTabs> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            final offset =
                _scrollController.offset + pointerSignal.scrollDelta.dy;
            _scrollController.jumpTo(
              offset.clamp(0.0, _scrollController.position.maxScrollExtent),
            );
          }
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.state.entries.length, (index) {
              final isSelected = index == widget.state.currentEntryIndex;
              final entry = widget.state.entries[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () => context.read<CreateNewProjectBloc>().add(
                        EntrySelected(index),
                      ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? context.colors.primary
                          : context.colors.bgGray,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected
                            ? context.colors.primary
                            : context.colors.border,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          entry.title.value.isNotEmpty
                              ? entry.title.value
                              : '(${index + 1})  ERGP-39...${entry.code.split('-').last}',
                          style: context.textStyles.bodyMedium.copyWith(
                            color: isSelected
                                ? context.colors.neutralInverted
                                : context.colors.textHeading,
                          ),
                        ),
                        if (widget.state.entries.length > 1) ...[
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () => context
                                .read<CreateNewProjectBloc>()
                                .add(EntryRemoved(index)),
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: isSelected
                                  ? context.colors.neutralInverted
                                  : context.colors.textSubtle,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
