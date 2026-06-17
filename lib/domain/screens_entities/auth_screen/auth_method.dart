import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_field.dart';
import 'package:co_stock/domain/core/user/user.dart';

/// Метода авторизации/регистрации
enum AuthMethod { email, phone, login }

extension AuthMethodCheck on AuthMethod {
  /// Проверка на равенство нынешнего идентификатора с полем юзера, которое
  /// соотвествует выбранному методу
  bool check(User user, String identifier) {
    switch (this) {
      case .email:
        return user.email == identifier;
      case .phone:
        return user.phone == identifier;
      case .login:
        return user.login == identifier;
    }
  }
}

extension AuthMethodError on AuthMethod {
  /// Тип ошибки в зависимости от метода регистрации
  AuthErrorType get error {
    switch (this) {
      case .email:
        return .emailAlreadyRegistered;
      case .phone:
        return .phoneAlreadyRegistered;
      case .login:
        return .loginAlreadyExists;
    }
  }
}

/// Соответствие метода авторизации с видом поля, которое ответствененно за него
extension AuthMethodToField on AuthMethod {
  AuthField get toField {
    switch (this) {
      case .email:
        return .email;
      case .phone:
        return .phone;
      case .login:
        return .login;
    }
  }
}
