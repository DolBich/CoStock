import 'package:co_stock/domain/errors/validation/displayable_validation_rule.dart';

class NameAllowedCharsRule implements DisplayableValidationRule {
  const NameAllowedCharsRule();

  @override
  String? validate(String input) {
    final regex = RegExp(r'^[\p{L}\s\-]+$', unicode: true);
    if (!regex.hasMatch(input)) {
      return 'Name can only contain letters, spaces, hyphens and apostrophes';
    }
    return null;
  }

  @override
  String get description => 'только буквы, пробелы, дефисы и апострофы';

  @override
  bool get triggersImmediateError => true;
}

class NameMinLengthRule implements DisplayableValidationRule {
  final int minLength;
  const NameMinLengthRule({this.minLength = 2});

  @override
  String? validate(String input) {
    if (input.length < minLength) {
      return 'Name must be at least $minLength characters';
    }
    return null;
  }

  @override
  String get description => 'минимум $minLength символа';

  @override
  bool get triggersImmediateError => false;
}

class NameMaxLengthRule implements DisplayableValidationRule {
  final int maxLength;
  const NameMaxLengthRule({this.maxLength = 50});

  @override
  String? validate(String input) {
    if (input.length > maxLength) {
      return 'Name must be no more than $maxLength characters';
    }
    return null;
  }

  @override
  String get description => 'не более $maxLength символов';

  @override
  bool get triggersImmediateError => false;
}