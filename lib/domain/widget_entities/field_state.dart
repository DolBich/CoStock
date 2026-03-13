import 'package:co_stock/domain/errors/validation/validation_rule.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_state.freezed.dart';

@freezed
sealed class FieldState with _$FieldState {
  const factory FieldState({
    @Default('') String value,
    @Default(false) bool isLoading,

    /// нужно для показа ошибки только после взаимодействия
    @Default(false) bool hasInteracted,
    ValidationRule? instantValidator,
    ValidationRule? finalValidator,
    SnackNotification? notification,
  }) = _FieldState;
}

extension FieldStateValid on FieldState {
  bool get isValid =>
      (notification == null || notification?.type != .error) &&
      value.isNotEmpty &&
      instantValidator?.validate(value) == null &&
      finalValidator?.validate(value) == null;

  bool get hasError => notification?.type == .error;

  bool get hasSuccess => notification?.type == .success;

  bool get isAvailable {
    final notification = this.notification;
    if(notification == null) return false;
    if(notification.type is! SnackSuccess) return false;
    return (notification as SnackSuccess).success.type == .available;
  }
}

extension FieldValidationExtension on FieldState {
  FieldState validateInstant() {
    if (instantValidator == null) return this;
    final errorText = instantValidator!.validate(value);
    return _validateRes(errorText);
  }

  FieldState validateFinal() {
    if (finalValidator == null) return this;
    final errorText = finalValidator!.validate(value);
    return _validateRes(errorText);
  }

  FieldState _validateRes(String? errorText) {
    if (errorText != null) {
      final error = AppError.validator(type: .validator, msg: errorText);
      return copyWith(
        notification: .error(error),
        hasInteracted: true,
        isLoading: false,
      );
    }
    final notification = this.notification;
    if(notification is SnackError && notification.error.isValidationError) {
      return copyWith(
        notification: null,
        hasInteracted: true,
        isLoading: false,
      );
    }

    return copyWith(
      hasInteracted: true,
      isLoading: false,
    );
  }
}
