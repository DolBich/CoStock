part of '../auth_bloc.dart';

/// Предназначем для обработки ошибочных случаев, для сокращения кода в блоке
class _AuthErrorHandler {
  /// Ошибка пустого идентификатора, где он не должен быть пустым
  static AppError emptyIdentifier() {
    final f = AppError.client(
      type: .state,
      error: Exception('Identifier is empty'),
      stackTrace: .current,
    );
    f.report();
    return f;
  }

  /// Ошибка отсутствия идентификатора аккаунта, где он должен быть
  static AppError noId() {
    final f = AppError.client(
      type: .state,
      error: Exception('No user id'),
      stackTrace: .current,
    );
    f.report();
    return f;
  }

  /// Ошибка пустого пароля, где он не должен быть пустым
  static AppError emptyPassword() {
    final f = AppError.client(
      type: .state,
      error: Exception('Password is empty'),
      stackTrace: .current,
    );
    f.report();
    return f;
  }

  /// Ошибка невалидного аккаунта
  static AppError invalidUser(User user) {
    final f = AppError.client(
      type: .state,
      error: Exception('User is invalid: [${user.toString()}]'),
      stackTrace: .current,
    );
    f.report();
    return f;
  }

  /// Ошибка отсутствующего аккаунта
  static AppError noUser() {
    final f = AppError.client(
      type: .state,
      error: Exception('No user'),
      stackTrace: .current,
    );
    f.report();
    return f;
  }

  /// Ошибка отсутствия состояния поля
  static AppError noField() {
    final f = AppError.client(
      type: .state,
      error: Exception('Не было найдено поле ввода'),
      stackTrace: .current,
    );
    f.report();
    return f;
  }
}