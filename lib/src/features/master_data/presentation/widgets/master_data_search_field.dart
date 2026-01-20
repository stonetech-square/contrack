import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MasterDataSearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const MasterDataSearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: hintText,
      prefixIcon: const Icon(Icons.search),
      onChanged: onChanged,
    );
  }
}
