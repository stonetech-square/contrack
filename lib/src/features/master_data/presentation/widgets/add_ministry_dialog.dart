import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart' hide State;
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:contrack/src/features/master_data/domain/entities/ministry_input.dart';
import 'package:flutter/material.dart';

class AddMinistryDialog extends StatefulWidget {
  final List<Agency> agencies;

  const AddMinistryDialog({super.key, required this.agencies});

  static Future<MinistryInput?> show(
    BuildContext context, {
    required List<Agency> agencies,
  }) {
    return showDialog<MinistryInput>(
      context: context,
      builder: (context) => AddMinistryDialog(agencies: agencies),
    );
  }

  @override
  State<AddMinistryDialog> createState() => _AddMinistryDialogState();
}

class _AddMinistryDialogState extends State<AddMinistryDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  Agency? _selectedAgency;

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _selectedAgency != null) {
      Navigator.of(context).pop(
        MinistryInput(
          name: _nameController.text.trim(),
          code: _codeController.text.trim(),
          agencyId: _selectedAgency!.id,
          agencyRemoteId: _selectedAgency!.remoteId,
        ),
      );
    } else {
      context.toast.warning('Please select an agency');
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
                    'Add New Ministry',
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
                label: 'Ministry Name',
                hintText: 'e.g. Ministry of Works',
                isRequired: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ministry name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _codeController,
                label: 'Ministry Code',
                hintText: 'e.g. FMW',
                isRequired: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ministry code is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppDropDownField<Agency>(
                value: _selectedAgency,
                label: 'Agency',
                hintText: 'Select an Agency',
                isRequired: true,
                items: widget.agencies
                    .map(
                      (agency) => DropdownMenuItem(
                        value: agency,
                        child: Text(agency.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAgency = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select an agency';
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
                      label: const Text('Add Ministry'),
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
