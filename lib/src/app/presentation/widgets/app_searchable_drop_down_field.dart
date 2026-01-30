import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppSearchableDropDownField<T, V> extends FormField<V> {
  AppSearchableDropDownField({
    super.key,
    required List<T> items,
    required String Function(T) labelBuilder,
    required V Function(T) valueBuilder,
    V? value,
    String? label,
    String? hintText,
    ValueChanged<V?>? onChanged,
    super.validator,
    bool isRequired = false,
    String? errorText,
    super.enabled,
    Widget? prefixIcon,
  }) : super(
         initialValue: value,
         builder: (FormFieldState<V> field) {
           void onChangedHandler(V? newValue) {
             field.didChange(newValue);
             if (onChanged != null) {
               onChanged(newValue);
             }
           }

           return _AppSearchableDropDownFieldContent<T, V>(
             items: items,
             labelBuilder: labelBuilder,
             valueBuilder: valueBuilder,
             value: field.value,
             label: label,
             hintText: hintText,
             onChanged: onChangedHandler,
             errorText: field.errorText ?? errorText,
             isRequired: isRequired,
             enabled: enabled,
             prefixIcon: prefixIcon,
           );
         },
       );
}

class _AppSearchableDropDownFieldContent<T, V> extends StatelessWidget {
  final List<T> items;
  final String Function(T) labelBuilder;
  final V Function(T) valueBuilder;
  final V? value;
  final String? label;
  final String? hintText;
  final ValueChanged<V?> onChanged;
  final String? errorText;
  final bool isRequired;
  final bool enabled;
  final Widget? prefixIcon;

  const _AppSearchableDropDownFieldContent({
    required this.items,
    required this.labelBuilder,
    required this.valueBuilder,
    required this.value,
    this.label,
    this.hintText,
    required this.onChanged,
    this.errorText,
    this.isRequired = false,
    this.enabled = true,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    String? displayLabel;
    if (value != null) {
      try {
        final selectedItem = items.firstWhere(
          (element) => valueBuilder(element) == value,
        );
        displayLabel = labelBuilder(selectedItem);
      } catch (_) {}
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text.rich(
            TextSpan(
              text: label!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.colors.onCard,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
              children: [
                if (isRequired)
                  TextSpan(
                    text: ' *',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.colors.error,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        InkWell(
          onTap: enabled
              ? () async {
                  final result = await showDialog<T>(
                    context: context,
                    builder: (context) => _SelectDialog<T>(
                      items: items,
                      labelBuilder: labelBuilder,
                      title: label ?? 'Select',
                    ),
                  );
                  if (result != null) {
                    onChanged(valueBuilder(result));
                  }
                }
              : null,
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textSubtle,
                fontSize: 12,
              ),
              filled: true,
              fillColor: context.colors.surface,
              prefixIcon: prefixIcon,
              suffixIcon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: context.colors.textSubtle,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.border),
              ),
              errorText: errorText,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colors.error, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            child: Text(
              displayLabel ?? (hintText ?? ''),
              style: context.textStyles.bodyMedium.copyWith(
                color: displayLabel != null
                    ? context.colors.onSurface
                    : context.colors.textSubtle,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class _SelectDialog<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) labelBuilder;
  final String title;

  const _SelectDialog({
    required this.items,
    required this.labelBuilder,
    required this.title,
  });

  @override
  State<_SelectDialog<T>> createState() => _SelectDialogState<T>();
}

class _SelectDialogState<T> extends State<_SelectDialog<T>> {
  late List<T> filteredItems;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = widget.items
          .where(
            (item) => widget.labelBuilder(item).toLowerCase().contains(query),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(widget.title, style: context.textStyles.titleMedium),
            const SizedBox(height: 16),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredItems.isEmpty
                  ? Center(
                      child: Text(
                        'No items found',
                        style: context.textStyles.bodyMedium.copyWith(
                          color: context.colors.textSubtle,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return ListTile(
                          title: Text(
                            widget.labelBuilder(item),
                            style: context.textStyles.bodyMedium,
                          ),
                          onTap: () => Navigator.of(context).pop(item),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
