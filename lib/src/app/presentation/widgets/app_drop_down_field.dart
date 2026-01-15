import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppDropDownField<T> extends StatelessWidget {
  final String? label;
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final bool isRequired;
  final String? errorText;
  final Widget? prefixIcon;
  final bool enabled;

  const AppDropDownField({
    super.key,
    this.label,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.errorText,
    this.prefixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
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
        DropdownButtonFormField<T>(
          isExpanded: true,
          initialValue: value,
          items: items,
          selectedItemBuilder: (context) {
            return items.map((item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: context.colors.onSurface,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                  child: item.child,
                ),
              );
            }).toList();
          },
          onChanged: enabled ? onChanged : null,
          validator: validator,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.colors.textSubtle,
          ),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: context.colors.onSurface),
          dropdownColor: context.colors.surface,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textSubtle,
              fontSize: 12,
            ),
            filled: true,
            fillColor: context.colors.surface,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: context.colors.border.withValues(alpha: 0.5),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
