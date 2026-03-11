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
      step: AuthStep.enterIdentifier,
      mode: AuthMode.login,
      method: AuthMethod.email,
      isLoading: true,
      userId: null,
      fields: {
        AuthMethod.email: FieldState(),
        AuthMethod.phone: FieldState(),
        AuthMethod.login: FieldState(),
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
    AuthMethod.email: const FieldState(),
    AuthMethod.phone: const FieldState(),
    AuthMethod.login: const FieldState(),
  };

  AuthState withFieldState({
    required AuthField field,
    bool? isLoading,
    String? error,
    AvailabilityStatus? status,
  }) {
    final base = copyWith(isLoading: isLoading ?? this.isLoading);
    AuthMethod method = this.method;
    switch (field) {
      case .name:
        return base.copyWith(
          nameField: nameField.copyWith(
            isLoading: isLoading ?? nameField.isLoading,
            error: error ?? nameField.error,
          ),
        );
      case .password:
        return base.copyWith(
          passwordField: passwordField.copyWith(
            isLoading: isLoading ?? passwordField.isLoading,
            error: error ?? passwordField.error,
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
      error: error,
      status: status,
    );
  }

  AuthState _updateField({
    required AuthState base,
    required AuthMethod method,
    bool? isLoading,
    String? error,
    AvailabilityStatus? status,
  }) {
    final updatedFields = Map<AuthMethod, FieldState>.from(fields);
    final currentField = updatedFields[method];
    if (currentField == null) {
      ErrorManager().reportError(
        .client(
          type: .state,
          msg: '[${method.name}] currentField == null - WTF!?',
        ),
      );
      return base;
    }
    updatedFields[method] = currentField.copyWith(
      isLoading: isLoading ?? currentField.isLoading,
      error: error ?? currentField.error,
      availabilityStatus: status ?? currentField.availabilityStatus,
    );
    return base.copyWith(fields: updatedFields);
  }

  AuthState withIdentifierLoading(bool loading) {
    return withFieldState(field: .identifier, isLoading: loading);
  }

  AuthState withIdentifierError(String error) {
    return withFieldState(
      field: .identifier,
      error: error,
      isLoading: false,
      status: .unavailable,
    );
  }

  AuthState withPasswordLoading(bool loading) {
    return withFieldState(field: .password, isLoading: loading);
  }

  AuthState withPasswordError(String error) {
    return withFieldState(field: .password, error: error, isLoading: false);
  }

  AuthState withDetailLoading(AuthMethod method, bool loading) {
    return withFieldState(field: method.toField, isLoading: loading);
  }

  AuthState withDetailError(AuthMethod method, String error) {
    return withFieldState(
      field: method.toField,
      error: error,
      isLoading: false,
      status: .unavailable,
    );
  }

  AuthState withDetailSuccess(AuthMethod method) {
    return withFieldState(
      field: method.toField,
      isLoading: false,
      status: .available,
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
}
