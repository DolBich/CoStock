enum AuthMode {
  login,
  register,
}

extension AuthModeText on AuthMode {
  String get text {
    switch(this) {
      case .login:
        return 'Authorization';
      case .register:
        return 'Registration';
    }
  }
}