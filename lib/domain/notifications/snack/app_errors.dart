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

@freezed
sealed class AppError extends Snack with _$AppError implements Exception {
  const AppError._();

  const factory AppError.auth({required AuthErrorType type, String? msg}) =
  _AuthError;
  const factory AppError.server({required ServerErrorType type, String? msg}) =
  _ServerError;
  const factory AppError.client({required ClientErrorType type, String? msg}) =
  _ClientError;

  @override
  String get userMessage => when(
    auth: _authMessage,
    server: _serverMessage,
    client: _clientMessage,
  );

  @override
  void report() => SnackError(this).report();

  String _includeMsg(String? msg) => msg != null ? ': $msg' : '';

  String _authMessage(AuthErrorType type, String? msg) {
    switch (type) {
      case AuthErrorType.identifier:
        return 'Такой пользователь не найден';
      case AuthErrorType.password:
        return 'Неверный пароль';
      case AuthErrorType.loginAlreadyExists:
        return 'Этот логин уже занят';
      case AuthErrorType.phoneAlreadyRegistered:
        return 'Этот телефон уже был зарегистрирован на другом аккаунте';
      case AuthErrorType.emailAlreadyRegistered:
        return 'Эта почта уже была зарегистрирована на другом аккаунте';
      case AuthErrorType.lastDetail:
        return 'Это последняя информация для авторизации на ваш аккаунт. Если её удалить, вы больше не сможете авторизоваться. Для удаления зарегистрируйте любой другой способ авторизации.';
    }
  }

  String _serverMessage(ServerErrorType type, String? msg) {
    switch (type) {
      case ServerErrorType.timeout:
        return 'Connection timeout. Check your internet.';
      case ServerErrorType.internet:
        return 'No internet connection.';
      case ServerErrorType.server:
        return 'Server error (${msg ?? 'unknown'})';
      case ServerErrorType.notFound:
        return 'Данные на сервере не найдены';
    }
  }

  String _clientMessage(ClientErrorType type, String? msg) {
    switch (type) {
      case ClientErrorType.state:
        return 'Client error${_includeMsg(msg)}';
      case ClientErrorType.smth:
        return 'Something went wrong${_includeMsg(msg)}';
    }
  }
}