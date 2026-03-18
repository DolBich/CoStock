abstract class DisplayableValidationRule extends ValidationRule {
  const DisplayableValidationRule();

  String get description;
  bool get triggersImmediateError;
}

abstract class ValidationRule {
  const ValidationRule();
  /// Возвращает сообщение об ошибке, если правило нарушено, иначе null
  String? validate(String input);
}