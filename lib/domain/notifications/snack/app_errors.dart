part of 'snack_notification.dart';

enum AuthErrorType {
  identifier,
  password,
  loginAlreadyExists,
  phoneAlreadyRegistered,
  emailAlreadyRegistered,
  lastDetail,
}

enum ServerErrorType { internet, server, timeout, notFound }

enum ClientErrorType { state, smth }

enum ValidatorErrorType { validator }

@freezed
sealed class AppError extends Snack with _$AppError implements Exception {
  const AppError._();

  const factory AppError.auth({
    required AuthErrorType type,
    Object? error,
    StackTrace? stackTrace,
  }) = _AuthError;

  const factory AppError.server({
    required ServerErrorType type,
    Object? error,
    StackTrace? stackTrace,
  }) = _ServerError;

  const factory AppError.client({
    required ClientErrorType type,
    Object? error,
    StackTrace? stackTrace,
  }) = _ClientError;

  const factory AppError.validator({
    required ValidatorErrorType type,
    Object? error,
    StackTrace? stackTrace,
  }) = _ValidatorError;

  @override
  String get userMessage => when(
    auth: (type, _, _) => _authMessage(type),
    server: (type, _, _) => _serverMessage(type),
    client: (type, _, _) => _clientMessage(type),
    validator: (type, _, _) => _validatorMessage(type),
  );

  @override
  String get devMessage => when(
    auth: (type, error, stack) => _formatDevMessage('AuthError($type)', error, stack),
    server: (type, error, stack) => _formatDevMessage('ServerError($type)', error, stack),
    client: (type, error, stack) => _formatDevMessage('ClientError($type)', error, stack),
    validator: (type, error, stack) => _formatDevMessage('ValidatorError($type)', error, stack),
  );

  String _formatDevMessage(String prefix, Object? error, StackTrace? stack) {
    final buffer = StringBuffer(prefix);
    if (error != null) buffer.write(' | error: $error');
    if (stack != null) buffer.write('\n$stack');
    return buffer.toString();
  }

  bool get isValidationError => this is _ValidatorError;
  bool get isClientError => this is _ClientError;

  @override
  void report() {
    /// Ошибки валидации не должны показываться в глобальных снекбарах
    if (isValidationError) return;

    SnackError(this).report();
  }

  @override
  void log() => SnackError(this).log();

  String _authMessage(AuthErrorType type) {
    switch (type) {
      case .identifier:
        return 'Такой пользователь не найден';
      case .password:
        return 'Неверный пароль';
      case .loginAlreadyExists:
        return 'Этот логин уже занят';
      case .phoneAlreadyRegistered:
        return 'Этот телефон уже был зарегистрирован на другом аккаунте';
      case .emailAlreadyRegistered:
        return 'Эта почта уже была зарегистрирована на другом аккаунте';
      case .lastDetail:
        return 'Это последняя информация для авторизации на ваш аккаунт. Если её удалить, вы больше не сможете авторизоваться. Для удаления зарегистрируйте любой другой способ авторизации.';
    }
  }

  String _serverMessage(ServerErrorType type) {
    switch (type) {
      case .timeout:
        return 'Нет ответа от сервера. Проверьте подключение к интернету.';
      case .internet:
        return 'Отсутствует подключение к интернету. Проверьте настройки сети.';
      case .server:
        return 'Ошибка на сервере. Попробуйте позже.';
      case .notFound:
        return 'Данные не найдены. Возможно, они были удалены.';
    }
  }

  String _clientMessage(ClientErrorType type) {
    switch (type) {
      case .state:
        return 'Произошла внутренняя ошибка. Перезапустите приложение.';
      case .smth:
        return 'Что-то пошло не так. Попробуйте повторить действие позже.';
    }
  }

  String _validatorMessage(ValidatorErrorType type) {
    switch (type) {
      case .validator:
        return 'Неизвестная ошибка валидации';
    }
  }
}
