import 'package:co_stock/domain/errors/validation/displayable_validation_rule.dart';


class PhoneCountryCodeRule implements DisplayableValidationRule {
  final String expectedPrefix;

  const PhoneCountryCodeRule({required this.expectedPrefix});

  @override
  String? validate(String input) {
    /// Удаляем все не-цифры, чтобы сравнивать цифры
    final digitsOnly = input.replaceAll(RegExp(r'\D'), '');
    final expectedDigits = expectedPrefix.replaceAll(RegExp(r'\D'), '');
    if (!digitsOnly.startsWith(expectedDigits)) {
      return 'Phone number must start with $expectedPrefix';
    }
    return null;
  }

  @override
  String get description => 'начинаться с $expectedPrefix';

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
  final int totalDigits; /// длина countryCodeDigits + nationalLength

  const PhoneFullDigitsRule({required this.totalDigits});

  @override
  String? validate(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length != totalDigits) {
      return 'Phone number must have exactly $totalDigits digits';
    }
    return null;
  }

  @override
  String get description => 'ровно $totalDigits цифр';

  @override
  bool get triggersImmediateError => false;
}