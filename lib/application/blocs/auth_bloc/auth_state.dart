part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStep step,
    required AuthMode mode,
    required AuthMethod method,
    required bool isLoading,
    required String? userId,

    /// Временные поля для ввода.
    /// На этапах [enterIdentifier] и [enterPassword] содержит поля для идентификатора (по методу).
    /// На этапе [registerDetails] содержит поля для недостающих атрибутов (ключи по методу).
    required Map<AuthMethod, FieldState> fields,

    /// Временное поле для пароля (используется только на [enterPassword]).
    required FieldState passwordField,
    required FieldState nameField,

    /// Подтверждённые данные пользователя после успешного логина.
    required User? user,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(
      step: .enterIdentifier,
      mode: .login,
      method: .email,
      isLoading: true,
      userId: null,
      fields: {
        .email: FieldState(),
        .phone: FieldState(),
        .login: FieldState(),
      },
      passwordField: FieldState(),
      nameField: FieldState(),
      user: null,
    );
  }
}

extension AuthStateExt on AuthState {
  User get toUser {
    return User(
      name: nameField.value,
      password: passwordField.value,
      email: method == AuthMethod.email ? identifier : null,
      phone: method == AuthMethod.phone ? identifier : null,
      login: method == AuthMethod.login ? identifier : null,
    );
  }

  String get password => passwordField.value;

  String get identifier => fields[method]?.value ?? '';

  String detail(AuthMethod method) => fields[method]?.value ?? '';

  Map<AuthMethod, FieldState> resetFields() => <AuthMethod, FieldState>{
    .email: const FieldState(),
    .phone: const FieldState(),
    .login: const FieldState(),
  };

  AuthState withFieldState({
    required AuthField field,
    bool? isLoading,
    SnackNotification? notification,
  }) {
    final base = copyWith(isLoading: isLoading ?? this.isLoading);
    AuthMethod method = this.method;
    switch (field) {
      case .name:
        return base.copyWith(
          nameField: nameField.copyWith(
            isLoading: isLoading ?? nameField.isLoading,
            notification: notification ?? nameField.notification,
          ),
        );
      case .password:
        return base.copyWith(
          passwordField: passwordField.copyWith(
            isLoading: isLoading ?? passwordField.isLoading,
            notification: notification ?? passwordField.notification,
          ),
        );
      case .identifier:
      case .email:
      case .phone:
      case .login:
        method = field.toMethod ?? this.method;
    }
    return _updateField(
      base: base,
      method: method,
      isLoading: isLoading,
      notification: notification,
    );
  }

  AuthState _updateField({
    required AuthState base,
    required AuthMethod method,
    bool? isLoading,
    SnackNotification? notification,
  }) {
    final updatedFields = Map<AuthMethod, FieldState>.from(fields);
    final currentField = updatedFields[method];
    if (currentField == null) {
      AppError.client(
        type: .state,
        error: Exception('[${method.name}] currentField == null - WTF!?'),
        stackTrace: StackTrace.current,
      ).report();
      return base;
    }
    updatedFields[method] = currentField.copyWith(
      isLoading: isLoading ?? currentField.isLoading,
      notification: notification ?? currentField.notification,
    );
    return base.copyWith(fields: updatedFields);
  }

  // Для идентификатора (логин/телефон/почта)
  AuthState withIdentifierLoading(bool loading) {
    return withFieldState(field: .identifier, isLoading: loading);
  }

  AuthState withIdentifierError(AppError error) {
    return withFieldState(
      field: .identifier,
      isLoading: false,
      notification: .error(error),
    );
  }

  // Для пароля
  AuthState withPasswordLoading(bool loading) {
    return withFieldState(field: .password, isLoading: loading);
  }

  AuthState withPasswordError(AppError error) {
    return withFieldState(
      field: .password,
      notification: .error(error),
      isLoading: false,
    );
  }

  // Для деталей
  AuthState withDetailLoading(AuthMethod method, bool loading) {
    return withFieldState(field: method.toField, isLoading: loading);
  }

  AuthState withDetailError(AuthMethod method, AppError error) {
    return withFieldState(
      field: method.toField,
      notification: .error(error),
      isLoading: false,
    );
  }

  AuthState withDetailSuccess(AuthMethod method, AppSuccess success) {
    return withFieldState(
      field: method.toField,
      isLoading: false,
      notification: .success(success),
    );
  }

  /// Создаёт состояние после успешного логина.
  AuthState fromUser(User user) {
    final missing = <AuthMethod, FieldState>{};
    if (user.email == null) missing[.email] = const FieldState();
    if (user.phone == null) missing[.phone] = const FieldState();
    if (user.login == null) missing[.login] = const FieldState();

    return copyWith(
      user: user,
      fields: missing,
      passwordField: const FieldState(),
    );
  }

  /// Сбрасывает уведомления и ошибки валидации во всех полях,
  /// но сохраняет введённые значения.
  AuthState resetValidation() {
    // Сброс полей деталей (email, phone, login)
    final newFields = <AuthMethod, FieldState>{};
    for (final entry in fields.entries) {
      newFields[entry.key] = entry.value.copyWith(
        notification: null,
        errorPersisted: null,
        // wasInteracted: false,
      );
    }

    // Сброс пароля и имени
    final newPasswordField = passwordField.copyWith(
      notification: null,
      errorPersisted: null,
      // wasInteracted: false,
    );
    final newNameField = nameField.copyWith(
      notification: null,
      errorPersisted: null,
      // wasInteracted: false,
    );

    return copyWith(
      fields: newFields,
      passwordField: newPasswordField,
      nameField: newNameField,
    );
  }
}
