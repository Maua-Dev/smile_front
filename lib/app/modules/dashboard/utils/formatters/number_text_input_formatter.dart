import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  int maxLength;

  NumberTextInputFormatter({required this.maxLength});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String filteredValue = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (filteredValue.length > maxLength) {
      filteredValue = filteredValue.substring(0, maxLength);
    }

    return TextEditingValue(
      text: filteredValue,
      selection: TextSelection.collapsed(offset: filteredValue.length),
    );
  }
}
