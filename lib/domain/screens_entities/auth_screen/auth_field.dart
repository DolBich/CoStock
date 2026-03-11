import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';

enum AuthField { name, identifier, password, email, phone, login }

extension AuthFieldToMethod on AuthField {
  AuthMethod? get toMethod {
    switch(this) {
      case .email:
        return .email;
      case .phone:
        return .phone;
      case .login:
        return .login;
        default:
          return null;
    }
  }
}
