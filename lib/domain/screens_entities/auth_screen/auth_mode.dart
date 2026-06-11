/// Режимы входа в аккаунт - авторизация/регистрация
enum AuthMode {
  login,
  register,
}

extension AuthModeText on AuthMode {
  String get text {
    switch(this) {
      case .login:
        return 'Авторизация';
      case .register:
        return 'Регистрация';
    }
  }
}