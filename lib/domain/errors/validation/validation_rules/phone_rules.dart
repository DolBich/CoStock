
import 'package:co_stock/domain/errors/validation/validation_rule.dart';


class PhoneCountryCodeRule implements ValidationRule {
  @override
  String? validate(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.isNotEmpty && !digits.startsWith('7') && !digits.startsWith('8')) {
      return 'Phone number must start with 7 or 8';
    }
    return null;
  }
}

/// Проверяет, что после удаления форматирования остались только цифры
/// (это гарантирует, что форматтер не пропустил ничего лишнего)
class PhoneOnlyDigitsRule implements ValidationRule {
  @override
  String? validate(String input) {
    final forbidden = input.replaceAll(RegExp(r'[\d\s\(\)\-+]'), '');
    if (forbidden.isNotEmpty) {
      return 'Only digits, spaces, parentheses, hyphens and + are allowed';
    }
    return null;
  }
}

/// Проверяет полное количество цифр (11)
class PhoneFullDigitsRule implements ValidationRule {
  @override
  String? validate(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 11) {
      return 'Phone number must have exactly 11 digits';
    }
    return null;
  }
}