import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_field.dart';
import 'package:co_stock/domain/bases/user.dart';

enum AuthMethod { email, phone, login }

extension AuthMethodCheck on AuthMethod {
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
