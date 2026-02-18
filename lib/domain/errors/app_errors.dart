import 'package:co_stock/domain/errors/error_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_errors.freezed.dart';

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
sealed class AppError with _$AppError implements Exception {
  const AppError._();

  const factory AppError.auth({required AuthErrorType type, String? msg}) =
      _AuthError;

  const factory AppError.server({required ServerErrorType type, String? msg}) =
      _ServerError;

  const factory AppError.client({required ClientErrorType type, String? msg}) =
      _ClientError;

  String get userMessage =>
      when(auth: _authMessage, server: _serverMessage, client: _clientMessage);

  String _includeMsg(String? msg) => msg != null ? ': $msg' : '';

  String _clientMessage(ClientErrorType type, String? msg) {
    switch (type) {
      case .state:
        return 'Client error${_includeMsg(msg)}';
      case .smth:
        return 'Something went wrong${_includeMsg(msg)}';
    }
  }

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
        return 'Это последняя информация для авторизации на ваш аккаунт. Если Её удалить вы уже не сможете авторизоваться. Для удаления зарегистрируйте любой другой способ авторизации.';
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
}

extension AppErrorReporting on AppError {
  void report() => ErrorManager().reportError(this);
}
