import 'package:co_stock/domain/errors/validation/displayable_validation_rule.dart';

class PasswordMinLengthRule implements DisplayableValidationRule {
  final int minLength;
  const PasswordMinLengthRule({this.minLength = 6});

  @override
  String? validate(String input) {
    if (input.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  @override
  String get description => 'минимум $minLength символов';

  @override
  bool get triggersImmediateError => false;
}

class PasswordUppercaseRule implements DisplayableValidationRule {
  const PasswordUppercaseRule();

  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    return null;
  }

  @override
  String get description => 'хотя бы одна заглавная буква';

  @override
  bool get triggersImmediateError => false;
}

class PasswordLowercaseRule implements DisplayableValidationRule {
  const PasswordLowercaseRule();

  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    return null;
  }

  @override
  String get description => 'хотя бы одна строчная буква';

  @override
  bool get triggersImmediateError => false;
}

class PasswordDigitRule implements DisplayableValidationRule {
  const PasswordDigitRule();

  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  @override
  String get description => 'хотя бы одна цифра';

  @override
  bool get triggersImmediateError => false;
}

class PasswordSpecialCharRule implements DisplayableValidationRule {
  const PasswordSpecialCharRule();

  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  @override
  String get description => 'хотя бы один спецсимвол (!@#\$%^&*(),.?":{}|<>)';

  @override
  bool get triggersImmediateError => false;
}

class PasswordNoWhitespaceRule implements DisplayableValidationRule {
  const PasswordNoWhitespaceRule();

  @override
  String? validate(String input) {
    if (input.contains(RegExp(r'\s'))) {
      return 'Password must not contain spaces';
    }
    return null;
  }

  @override
  String get description => 'без пробелов';

  @override
  bool get triggersImmediateError => true;
}