import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter();
  final Logger _logger = Logger('CurrencyInputFormatter');
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    String newText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    if (newText.indexOf('.') != newText.lastIndexOf('.')) {
      return oldValue;
    }

    if (newText.endsWith('.')) {
      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    List<String> parts = newText.split('.');
    String integerPart = parts[0];
    String? decimalPart = parts.length > 1 ? parts[1] : null;

    if (decimalPart != null && decimalPart.length > 2) {
      decimalPart = decimalPart.substring(0, 2);
    }

    if (integerPart.isNotEmpty) {
      try {
        final intValue = int.parse(integerPart);
        final NumberFormat thousandsFormatter = NumberFormat("#,###");
        integerPart = thousandsFormatter.format(intValue);
      } catch (e) {
        _logger.warning('Error parsing integer part: $e');
      }
    }

    String finalText = integerPart;
    if (parts.length > 1) {
      finalText += '.$decimalPart';
    }

    return newValue.copyWith(
      text: finalText,
      selection: TextSelection.collapsed(offset: finalText.length),
    );
  }
}
