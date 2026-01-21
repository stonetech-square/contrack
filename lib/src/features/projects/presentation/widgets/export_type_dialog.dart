import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/projects/domain/entities/export_type.dart';
import 'package:flutter/material.dart';

class ExportTypeDialog extends StatefulWidget {
  const ExportTypeDialog({super.key});

  @override
  State<ExportTypeDialog> createState() => _ExportTypeDialogState();

  static Future<ExportType?> show(BuildContext context) {
    return showDialog<ExportType>(
      context: context,
      builder: (context) => const ExportTypeDialog(),
    );
  }
}

class _ExportTypeDialogState extends State<ExportTypeDialog> {
  var _selectedType = ExportType.preferred;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Export Projects',
                style: context.textStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Export Type',
                style: context.textStyles.labelMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colors.textSubtle,
                ),
              ),
              const SizedBox(height: 12),
              RadioGroup<ExportType>(
                groupValue: _selectedType,
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _selectedType = val);
                  }
                },
                child: Column(
                  children: ExportType.values.map((type) {
                    final isSelected = _selectedType == type;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Material(
                        color: isSelected
                            ? context.colors.primary.withValues(alpha: 0.05)
                            : context.colors.surfaceVariant,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? context.colors.primary
                                : context.colors.border,
                          ),
                        ),
                        child: InkWell(
                          onTap: () => setState(() => _selectedType = type),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Radio<ExportType>(value: type),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        type.displayName,
                                        style: context.textStyles.bodyMedium
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: isSelected
                                                  ? context.colors.primary
                                                  : context.colors.textHeading,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        type.description,
                                        style: context.textStyles.bodySmall
                                            .copyWith(
                                              color: context.colors.textSubtle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                        foregroundColor: context.colors.onSurfaceVariant,
                        backgroundColor: context.colors.surfaceVariant,
                        minimumSize: const Size.fromHeight(54),
                      ),
                      child: const Text('Close'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => Navigator.of(context).pop(_selectedType),
                      icon: const Icon(Icons.save_outlined, size: 20),
                      label: const Text('Export'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
