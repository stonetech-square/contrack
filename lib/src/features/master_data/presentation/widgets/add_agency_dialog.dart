import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/master_data/domain/entities/agency_input.dart';
import 'package:flutter/material.dart';

class AddAgencyDialog extends StatefulWidget {
  const AddAgencyDialog({super.key});

  static Future<AgencyInput?> show(BuildContext context) {
    return showDialog<AgencyInput>(
      context: context,
      builder: (context) => const AddAgencyDialog(),
    );
  }

  @override
  State<AddAgencyDialog> createState() => _AddAgencyDialogState();
}

class _AddAgencyDialogState extends State<AddAgencyDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop(
        AgencyInput(
          name: _nameController.text.trim(),
          code: _codeController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 480,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add New Agency',
                    style: context.textStyles.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    tooltip: 'Close',
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 16),
              AppTextField(
                controller: _nameController,
                label: 'Agency Name',
                hintText: 'e.g. Federal Roads Maintenance Agency (FERMA)',
                isRequired: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Agency name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _codeController,
                label: 'Agency Code',
                hintText: 'e.g. FERMA',
                isRequired: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Agency code is required';
                  }
                  return null;
                },
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
                      onPressed: _submit,
                      icon: const Icon(Icons.save_outlined, size: 20),
                      label: const Text('Add Agency'),
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
