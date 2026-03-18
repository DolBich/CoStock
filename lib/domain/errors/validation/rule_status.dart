part of 'validation_freezed.dart';

@freezed
sealed class RuleStatus with _$RuleStatus {
  const factory RuleStatus({
    required DisplayableValidationRule rule,
    required bool isValid,
  }) = _RuleStatus;
}

