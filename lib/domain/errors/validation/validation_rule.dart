abstract class ValidationRule {
  /// Возвращает сообщение об ошибке, если правило нарушено, иначе null
  String? validate(String input);
}