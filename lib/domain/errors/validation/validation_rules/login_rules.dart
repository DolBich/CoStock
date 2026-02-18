import 'package:co_stock/domain/errors/validation/validation_rule.dart';

/// Мгновенная проверка: разрешённые символы (латиница, цифры, подчёркивание)
class LoginAllowedCharsRule implements ValidationRule {
  @override
  String? validate(String input) {
    final forbidden = input.replaceAll(RegExp(r'[a-zA-Z0-9_]'), '');
    if (forbidden.isNotEmpty) {
      return 'Login can only contain letters, numbers, and underscores';
    }
    return null;
  }
}

class LoginLengthRule implements ValidationRule {
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
}
