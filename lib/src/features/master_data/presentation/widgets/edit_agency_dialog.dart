import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart' hide State;
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

class EditAgencyDialog extends StatefulWidget {
  final AgencyWithMinistry agencyWithMinistry;
  final List<Ministry> ministries;

  const EditAgencyDialog({
    super.key,
    required this.agencyWithMinistry,
    required this.ministries,
  });

  /// Shows the dialog and returns the updated AgencyWithMinistry if changes were made,
  /// or null if cancelled or no changes were made.
  static Future<AgencyWithMinistry?> show(
    BuildContext context, {
    required AgencyWithMinistry agencyWithMinistry,
    required List<Ministry> ministries,
  }) {
    return showDialog<AgencyWithMinistry>(
      context: context,
      builder: (context) => EditAgencyDialog(
        agencyWithMinistry: agencyWithMinistry,
        ministries: ministries,
      ),
    );
  }

  @override
  State<EditAgencyDialog> createState() => _EditAgencyDialogState();
}

class _EditAgencyDialogState extends State<EditAgencyDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _codeController;
  late Ministry? _selectedMinistry;

  @override
  void initState() {
    super.initState();
    final agency = widget.agencyWithMinistry.agency;
    _nameController = TextEditingController(text: agency.name);
    _codeController = TextEditingController(text: agency.code ?? '');
    _selectedMinistry = widget.agencyWithMinistry.ministry;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newName = _nameController.text.trim();
      final newCode = _codeController.text.trim();
      final originalAgency = widget.agencyWithMinistry.agency;
      final originalMinistry = widget.agencyWithMinistry.ministry;

      // Check if anything changed
      final nameChanged = newName != originalAgency.name;
      final codeChanged = newCode != (originalAgency.code ?? '');
      final ministryChanged = _selectedMinistry?.id != originalMinistry.id;

      if (!nameChanged && !codeChanged && !ministryChanged) {
        Navigator.of(context).pop();
        return;
      }

      // Return updated agency with ministry
      final updatedAgency = originalAgency.copyWith(
        name: newName,
        code: Value(newCode.isEmpty ? null : newCode),
        ministryId: _selectedMinistry!.id,
      );
      final result = AgencyWithMinistry(
        agency: updatedAgency,
        ministry: _selectedMinistry!,
      );
      Navigator.of(context).pop(result);
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
                    'Edit Agency',
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
              const SizedBox(height: 16),
              Text(
                'Ministry *',
                style: context.textStyles.labelMedium.copyWith(
                  color: context.colors.textBody,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<Ministry>(
                initialValue: _selectedMinistry,
                decoration: InputDecoration(
                  hintText: 'Select ministry',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: widget.ministries.map((ministry) {
                  return DropdownMenuItem<Ministry>(
                    value: ministry,
                    child: Text(ministry.name),
                  );
                }).toList(),
                onChanged: (ministry) {
                  setState(() {
                    _selectedMinistry = ministry;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a ministry';
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
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.save_outlined, size: 20),
                      label: const Text('Save Changes'),
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
