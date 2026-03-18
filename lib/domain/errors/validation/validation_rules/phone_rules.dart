import 'package:co_stock/domain/errors/validation/displayable_validation_rule.dart';


class PhoneCountryCodeRule implements DisplayableValidationRule {
  const PhoneCountryCodeRule();

  @override
  String? validate(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.isNotEmpty && !digits.startsWith('7') && !digits.startsWith('8')) {
      return 'Phone number must start with 7 or 8';
    }
    return null;
  }

  @override
  String get description => 'начинаться с 7 или 8';

  @override
  bool get triggersImmediateError => false;
}

class PhoneOnlyDigitsRule implements DisplayableValidationRule {
  const PhoneOnlyDigitsRule();

  @override
  String? validate(String input) {
    final forbidden = input.replaceAll(RegExp(r'[\d\s\(\)\-+]'), '');
    if (forbidden.isNotEmpty) {
      return 'Only digits, spaces, parentheses, hyphens and + are allowed';
    }
    return null;
  }

  @override
  String get description => 'только цифры, пробелы, скобки, дефисы, +';

  @override
  bool get triggersImmediateError => true;
}

class PhoneFullDigitsRule implements DisplayableValidationRule {
  const PhoneFullDigitsRule();

  @override
  String? validate(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 11) {
      return 'Phone number must have exactly 11 digits';
    }
    return null;
  }

  @override
  String get description => 'ровно 11 цифр';

  @override
  bool get triggersImmediateError => false;
}