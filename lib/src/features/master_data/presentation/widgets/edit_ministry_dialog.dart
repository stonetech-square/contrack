import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart' hide State;
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

class EditMinistryDialog extends StatefulWidget {
  final Ministry ministry;

  const EditMinistryDialog({super.key, required this.ministry});

  static Future<Ministry?> show(
    BuildContext context, {
    required Ministry ministry,
  }) {
    return showDialog<Ministry>(
      context: context,
      builder: (context) => EditMinistryDialog(ministry: ministry),
    );
  }

  @override
  State<EditMinistryDialog> createState() => _EditMinistryDialogState();
}

class _EditMinistryDialogState extends State<EditMinistryDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.ministry.name);
    _codeController = TextEditingController(text: widget.ministry.code ?? '');
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

      if (_nameController.text == widget.ministry.name &&
          _codeController.text == (widget.ministry.code ?? '')) {
        Navigator.of(context).pop();
        return;
      }
      final updatedMinistry = widget.ministry.copyWith(
        name: newName,
        code: Value(newCode),
      );
      Navigator.of(context).pop(updatedMinistry);
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
                    'Edit Ministry',
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
                hintText: 'e.g. Federal Ministry of Works',
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
