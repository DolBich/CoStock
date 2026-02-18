import 'package:co_stock/domain/errors/validation/validation_rule.dart';

class EmailAllowedCharsRule implements ValidationRule {
  @override
  String? validate(String input) {
    final regex = RegExp(r'^[a-zA-Z0-9._\-@]*$');
    if (!regex.hasMatch(input)) {
      return 'Email can only contain letters, numbers, dots, hyphens, underscores and @';
    }
    return null;
  }
}

class EmailAtRule implements ValidationRule {
  @override
  String? validate(String input) {
    if (!input.contains('@')) {
      return 'Email must contain @';
    }
    return null;
  }
}

class EmailDomainRule implements ValidationRule {
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
}