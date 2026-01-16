import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:flutter/material.dart';

class ExportFormatSelector extends StatelessWidget {
  const ExportFormatSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Export Format'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FormatOption(
            format: ExportFormat.csv,
            icon: Icons.table_chart,
            description: 'Comma-separated values file',
            onTap: () => Navigator.of(context).pop(ExportFormat.csv),
          ),
          const SizedBox(height: 12),
          _FormatOption(
            format: ExportFormat.excel,
            icon: Icons.table_rows,
            description: 'Microsoft Excel spreadsheet',
            onTap: () => Navigator.of(context).pop(ExportFormat.excel),
          ),
          const SizedBox(height: 12),
          _FormatOption(
            format: ExportFormat.pdf,
            icon: Icons.picture_as_pdf,
            description: 'Portable Document Format',
            onTap: () => Navigator.of(context).pop(ExportFormat.pdf),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  static Future<ExportFormat?> show(BuildContext context) {
    return showDialog<ExportFormat>(
      context: context,
      builder: (context) => const ExportFormatSelector(),
    );
  }
}

class _FormatOption extends StatelessWidget {
  final ExportFormat format;
  final IconData icon;
  final String description;
  final VoidCallback onTap;

  const _FormatOption({
    required this.format,
    required this.icon,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    format.displayName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
