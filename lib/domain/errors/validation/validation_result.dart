part of 'validation_freezed.dart';

@freezed
sealed class ValidationResult with _$ValidationResult {
  const factory ValidationResult({
    required List<RuleStatus> requirements,
    required List<RuleStatus> suggestions,
    required String requirementText,
    required String suggestionsText,
  }) = _ValidationResult;

  factory ValidationResult.compute({
    required String value,
    required FieldValidator validator,
    required String requirementText,
    required String suggestionsText,
  }) {
    return ValidationResult(
      requirements: validator.requirements.map((rule) {
        final isValid = rule.validate(value) == null;
        return RuleStatus(rule: rule, isValid: isValid);
      }).toList(),
      suggestions: validator.suggestions.map((rule) {
        final isValid = rule.validate(value) == null;
        return RuleStatus(rule: rule, isValid: isValid);
      }).toList(),
      requirementText: requirementText,
      suggestionsText: suggestionsText,
    );
  }
}

extension ValidationResultX on ValidationResult {
  bool get hasError => requirements.any((r) => !r.isValid);

  double get suggestionsProgress {
    if (suggestions.isEmpty) return 0.0;
    final completed = suggestions.where((s) => s.isValid).length;
    return completed / suggestions.length;
  }

  String get strengthLabel {
    final progress = suggestionsProgress;
    if (progress < 0.3) return 'Слабый';
    if (progress < 0.7) return 'Средний';
    return 'Сильный';
  }

  bool get hasImmediateError {
    return requirements.any(
          (rs) => !rs.isValid && rs.rule.triggersImmediateError,
    );
  }
}
