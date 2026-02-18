import 'package:co_stock/domain/errors/validation/validation_rule.dart';

class PasswordMinLengthRule implements ValidationRule {
  final int minLength;
  PasswordMinLengthRule({this.minLength = 6});

  @override
  String? validate(String input) {
    if (input.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }
}

class PasswordUppercaseRule implements ValidationRule {
  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    return null;
  }
}

class PasswordLowercaseRule implements ValidationRule {
  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    return null;
  }
}

class PasswordDigitRule implements ValidationRule {
  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }
    return null;
  }
}

class PasswordSpecialCharRule implements ValidationRule {
  @override
  String? validate(String input) {
    if (!input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }
}

class PasswordNoWhitespaceRule implements ValidationRule {
  @override
  String? validate(String input) {
    if (input.contains(RegExp(r'\s'))) {
      return 'Password must not contain spaces';
    }
    return null;
  }
}