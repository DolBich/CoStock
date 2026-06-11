import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';

/// Виды текстовых полей, которые могут быть на экране авторизации
enum AuthField { name, identifier, password, email, phone, login }

/// Перевод типа поля в то, за какой метод авторизации они отвечают, если отвечают
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
