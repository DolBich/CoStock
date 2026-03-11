import 'package:co_stock/domain/errors/validation/validation_rule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_state.freezed.dart';

enum AvailabilityStatus { unknown, available, unavailable }

@freezed
sealed class FieldState with _$FieldState {
  const factory FieldState({
    @Default('') String value,
    String? error,
    @Default(false) bool isLoading,

    /// нужно для показа ошибки только после взаимодействия
    @Default(false) bool hasInteracted,
    ValidationRule? instantValidator,
    ValidationRule? finalValidator,
    @Default(AvailabilityStatus.unknown) AvailabilityStatus availabilityStatus,
  }) = _FieldState;
}

extension FieldStateValid on FieldState {
  bool get isValid =>
      error == null &&
      value.isNotEmpty &&
      instantValidator?.validate(value) == null &&
      finalValidator?.validate(value) == null;
}

extension AvailabilityStatusExt on AvailabilityStatus {
  String get toText {
    switch (this) {
      case .unknown:
        return 'Неизвестно';
      case .unavailable:
        return 'Недоступно';
      case .available:
        return 'Можно зарегистрировать';
    }
  }
}
