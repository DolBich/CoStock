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

  const factory AppError.auth({required AuthErrorType type, String? msg}) =
      _AuthError;

  const factory AppError.server({required ServerErrorType type, String? msg}) =
      _ServerError;

  const factory AppError.client({required ClientErrorType type, String? msg}) =
      _ClientError;

  const factory AppError.validator({
    required ValidatorErrorType type,
    String? msg,
  }) = _ValidatorError;

  @override
  String get userMessage => when(
    auth: _authMessage,
    server: _serverMessage,
    client: _clientMessage,
    validator: _validatorMessage,
  );

  bool get isValidationError => this is _ValidatorError;

  @override
  void report() {
    // Ошибки валидации не должны показываться в глобальных снекбарах
    if(isValidationError) return;
    SnackError(this).report();
  }

  String _includeMsg(String? msg) => msg != null ? ': $msg' : '';

  String _authMessage(AuthErrorType type, String? msg) {
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

  String _serverMessage(ServerErrorType type, String? msg) {
    switch (type) {
      case .timeout:
        return 'Connection timeout. Check your internet.';
      case .internet:
        return 'No internet connection.';
      case .server:
        return 'Server error (${msg ?? 'unknown'})';
      case .notFound:
        return 'Данные на сервере не найдены';
    }
  }

  String _clientMessage(ClientErrorType type, String? msg) {
    switch (type) {
      case .state:
        return 'Client error${_includeMsg(msg)}';
      case .smth:
        return 'Something went wrong${_includeMsg(msg)}';
    }
  }

  String _validatorMessage(ValidatorErrorType type, String? msg) {
    switch (type) {
      case .validator:
        return msg ?? 'Неизвестная ошибка валидации';
    }
  }
}
