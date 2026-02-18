import 'package:flutter/services.dart';


class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (oldValue.text == newValue.text) return newValue;

    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > 11) digits = digits.substring(0, 11);

    final formatted = _formatDigits(digits);
    final newSelection = _calculateCursorPosition(
      oldValue: oldValue,
      newDigits: digits,
      formatted: formatted,
    );

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: newSelection),
    );
  }

  String _formatDigits(String digits) {
    if (digits.isEmpty) return '';

    if (digits.startsWith('7') || digits.startsWith('8')) {
      final buffer = StringBuffer('+7');
      if (digits.length > 1) buffer.write(' (');
      for (int i = 1; i < digits.length; i++) {
        if (i == 4) buffer.write(') ');
        if (i == 7) buffer.write('-');
        if (i == 9) buffer.write('-');
        buffer.write(digits[i]);
      }
      return buffer.toString();
    } else {
      return digits;
    }
  }

  int _calculateCursorPosition({
    required TextEditingValue oldValue,
    required String newDigits,
    required String formatted,
  }) {
    final oldDigits = oldValue.text.replaceAll(RegExp(r'\D'), '');
    final oldCursorPos = oldValue.selection.baseOffset;

    /// Сколько цифр было до курсора в старом тексте
    int digitsBeforeOld = 0;
    for (int i = 0; i < oldCursorPos && i < oldValue.text.length; i++) {
      if (_isDigit(oldValue.text[i])) digitsBeforeOld++;
    }

    final delta = newDigits.length - oldDigits.length;

    /// Новое количество цифр до курсора
    int targetDigits = digitsBeforeOld + delta;
    if (targetDigits < 0) targetDigits = 0;
    if (targetDigits > newDigits.length) targetDigits = newDigits.length;

    /// Ищем позицию в formatted, после которой находится targetDigits цифр
    int pos = 0;
    int digitsSeen = 0;
    for (int i = 0; i < formatted.length; i++) {
      if (_isDigit(formatted[i])) {
        digitsSeen++;
        if (digitsSeen == targetDigits) {
          pos = i + 1;
          break;
        }
      }
    }

    return pos;
  }

  bool _isDigit(String ch) => RegExp(r'[0-9]').hasMatch(ch);
}