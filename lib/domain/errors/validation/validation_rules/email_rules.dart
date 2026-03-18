import 'package:co_stock/domain/errors/validation/displayable_validation_rule.dart';

class EmailAllowedCharsRule implements DisplayableValidationRule {
  const EmailAllowedCharsRule();

  @override
  String? validate(String input) {
    final regex = RegExp(r'^[a-zA-Z0-9._\-@]*$');
    if (!regex.hasMatch(input)) {
      return 'Email can only contain letters, numbers, dots, hyphens, underscores and @';
    }
    return null;
  }

  @override
  String get description => 'только латинские буквы, цифры, точки, дефисы, подчёркивания и @';

  @override
  bool get triggersImmediateError => true;
}

class EmailAtRule implements DisplayableValidationRule {
  const EmailAtRule();

  @override
  String? validate(String input) {
    if (!input.contains('@')) {
      return 'Email must contain @';
    }
    return null;
  }

  @override
  String get description => 'содержать символ @';

  @override
  bool get triggersImmediateError => false;
}

class EmailDomainRule implements DisplayableValidationRule {
  const EmailDomainRule();

  @override
  String? validate(String input) {
    final parts = input.split('@');
    if (parts.length != 2) return 'Email must have one @';
    if (parts[0].isEmpty) return 'Email must have local part before @';
    if (parts[1].isEmpty) return 'Email must have domain after @';
    if (!parts[1].contains('.')) return 'Domain must contain a dot';
    final lastParts = parts[1].split('.');
    if (lastParts.length != 2) return 'Domain must have one .';
    if (lastParts[0].isEmpty) return 'Domain must have part before .';
    if (lastParts[1].isEmpty) return 'Email must have part after .';
    return null;
  }

  @override
  String get description => 'корректный формат email (например, name@domain.ru)';

  @override
  bool get triggersImmediateError => false;
}