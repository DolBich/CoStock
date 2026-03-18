import 'package:co_stock/domain/errors/validation/displayable_validation_rule.dart';
import 'package:co_stock/domain/errors/validation/validation_freezed.dart';

class FieldValidator {
  final List<DisplayableValidationRule> requirements;
  final List<DisplayableValidationRule> suggestions;
  final String requirementText;
  final String suggestionsText;

  const FieldValidator({
    this.requirements = const [],
    this.suggestions = const [],
    this.requirementText = '',
    this.suggestionsText = '',
  });

  ValidationResult evaluate(String value) {
    return ValidationResult.compute(
      value: value,
      validator: this,
      requirementText: requirementText,
      suggestionsText: suggestionsText,
    );
  }
}
