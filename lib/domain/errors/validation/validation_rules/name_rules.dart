import 'package:co_stock/domain/errors/validation/validation_rule.dart';

class NameAllowedCharsRule implements ValidationRule {
  @override
  String? validate(String input) {
    final regex = RegExp(r'^[\p{L}\s\-]+$', unicode: true);
    if (!regex.hasMatch(input)) {
    return 'Name can only contain letters, spaces, hyphens and apostrophes';
    }
    return null;
  }
}

class NameMinLengthRule implements ValidationRule {
  final int minLength;
  NameMinLengthRule({this.minLength = 2});

  @override
  String? validate(String input) {
    if (input.length < minLength) {
      return 'Name must be at least $minLength characters';
    }
    return null;
  }
}

class NameMaxLengthRule implements ValidationRule {
  final int maxLength;
  NameMaxLengthRule({this.maxLength = 50});

  @override
  String? validate(String input) {
    if (input.length > maxLength) {
      return 'Name must be no more than $maxLength characters';
    }
    return null;
  }
}