import 'package:co_stock/domain/errors/validation/displayable_validation_rule.dart';

/// Мгновенная проверка: разрешённые символы (латиница, цифры, подчёркивание)
class LoginAllowedCharsRule implements DisplayableValidationRule {
  const LoginAllowedCharsRule();

  @override
  String? validate(String input) {
    final forbidden = input.replaceAll(RegExp(r'[a-zA-Z0-9_]'), '');
    if (forbidden.isNotEmpty) {
      return 'Login can only contain letters, numbers, and underscores';
    }
    return null;
  }

  @override
  String get description => 'только латинские буквы, цифры и подчёркивание';

  @override
  bool get triggersImmediateError => true;
}

class LoginLengthRule implements DisplayableValidationRule {
  const LoginLengthRule();

  @override
  String? validate(String input) {
    if (input.length < 3) {
      return 'Login must be at least 3 characters';
    }
    if (input.length > 20) {
      return 'Login must be no more than 20 characters';
    }
    return null;
  }

  @override
  String get description => 'от 3 до 20 символов';

  @override
  bool get triggersImmediateError => false;
}
