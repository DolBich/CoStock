import 'package:co_stock/domain/errors/validation/field_validator.dart';
import 'package:co_stock/domain/errors/validation/validation_freezed.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_state.freezed.dart';

/// Определяет состояние текстового поля
@freezed
sealed class FieldState with _$FieldState {
  const FieldState._();

  const factory FieldState({
    @Default('') String value,
    @Default(false) bool isLoading,

    /// [false] - не валидируем и не показываем ошибки
    /// Нужно чтобы ошибки и успехи не отображались сразу, а только если
    /// пользователь уже что-то сделал с полем
    @Default(false) bool wasInteracted,

    /// Отображает ошибку поля всё то время, пока она не будет исправлена
    /// В основном работает с ошибками от сервера из разряда "Неправильный пароль"
    /// Тогда ошибка будет висеть (persisted) пока мы не получим успех или пока
    /// строка не станет пустой, тогда поле принимает значение null
    @Default(false) bool? errorPersisted,
    ValidationResult? validationResult,
    SnackNotification? notification,
    @Default(false) bool removing,
  }) = _FieldState;

  ///
  /// Логика валидации поля
  ///


  /// Можно подтверждать если нет уведомления об ошибке и значение валидно
  bool get canSubmit {
    if (notification?.type == .error) return false;
    return isValid;
  }

  /// Нет ошибки валидации и есть текст - валидный
  bool get isValid {
    if (validationResult != null) {
      return !validationResult!.hasError;
    }
    return value.isNotEmpty;
  }

  /// Есть ошибка, если:
  /// - серверная ошибка
  /// - или validationResult имеет ошибку
  bool get hasError {
    if (notification?.type == .error) return true;
    if (validationResult != null) {
      return validationResult!.hasError;
    }
    return false;
  }

  bool get showError => wasInteracted && hasError;

  /// Успех только от серверных уведомлений (например, "доступно")
  bool get hasSuccess => notification?.type == .success;

  bool get showSuccess => wasInteracted && hasSuccess;

  /// Применяется для полей регистрации
  /// Используется для определения, жоступно ли это значение для регистрации
  /// с учётом ответа от сервера
  bool get isAvailable {
    final notification = this.notification;
    if (notification == null) return false;
    if (notification.type != .success) return false;
    return (notification as SnackSuccess).success.type == .available;
  }

  /// Вычисляет новое состояние поля на основе введённого значения и валидатора.
  /// - [newValue] – новое значение поля
  /// - [validator] – валидатор поля (может быть null)
  /// - [forceErrorPersisted] – если true, принудительно устанавливает errorPersisted = hasError
  FieldState computeWithValidation({
    required String newValue,
    required FieldValidator? validator,

    /// Нужно например при submit
    bool forceErrorPersisted = false,
  }) {
    if (validator == null) {
      return copyWith(value: newValue);
    }

    final validationResult = validator.evaluate(newValue);

    bool? newErrorPersisted = errorPersisted;

    if (forceErrorPersisted) {
      /// Финальная валидация (сабмит, потеря фокуса)
      newErrorPersisted = validationResult.hasError;
    } else {
      /// Мгновенная валидация (пользователь печатает)
      if (newValue.isEmpty) {
        /// Пустое поле — ошибку не показываем
        newErrorPersisted = null;
      } else if (validationResult.hasImmediateError) {
        /// Немедленная ошибка — показываем сразу
        newErrorPersisted = true;
      } else if (errorPersisted == true && validationResult.hasError) {
        /// Если ранее была зафиксирована ошибка и она всё ещё существует — сохраняем
        newErrorPersisted = true;
      } else {
        /// В остальных случаях ошибку не показываем
        newErrorPersisted = false;
      }
    }

    return copyWith(
      value: newValue,
      validationResult: validationResult,
      errorPersisted: newErrorPersisted,
    );
  }

  ///
  /// Логика завершённости поля
  ///

  static const Duration removeDelay = Duration(seconds: 2);
  static const Duration removeDuration = Duration(milliseconds: 500);

  /// Когда мы считаем поле завершённым (показываем его завершённую версию)
  bool get completed {
    final notification = this.notification;
    if (notification?.type != .success) return false;
    final success = notification as SnackSuccess;
    return success.success.type == .registered;
  }
}
