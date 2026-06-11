part of 'auth_bloc.dart';

/// Состояние блока аутентификации. Хранит данные всех шагов, включая временные
/// поля ввода и подтверждённого пользователя.
/// Поля [fields] (по методам входа), [passwordField] и [nameField] разделены,
/// чтобы упростить обновление и валидацию на разных этапах.
@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    /// На каком этапе авторизации/регистрации сейчас пользователь (для навигации/смены виджетов)
    required AuthStep step,

    /// Авторизовывается или регистрируется пользователь
    required AuthMode mode,

    /// Описывает каким именно способом человек пытается авторизоаваться (телефон/почта/логин)
    required AuthMethod method,
    required bool isLoading,

    /// Поле [userId] используется только на этапе enterPassword для хранения идентификатора,
    /// полученного при проверке существования аккаунта, чтобы знать к какому аккаунту мы
    /// подбираем пароль
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

  ///--------------------------------------------------------------------------
/// Основные методы и геттеры
/// -----------------------------------------------------------------------------

  /// Получение юзера для регистрации
  User get toUser {
    return User(
      name: nameField.value,
      password: passwordField.value,
      email: method == .email ? identifier : null,
      phone: method == .phone ? identifier : null,
      login: method == .login ? identifier : null,
    );
  }

  String get password => passwordField.value;

  String get identifier => fields[method]?.value ?? '';

  String detail(AuthMethod method) => fields[method]?.value ?? '';

  /// Сброс всех полей идентификации
  Map<AuthMethod, FieldState> resetFields() => <AuthMethod, FieldState>{
        .email: const FieldState(),
        .phone: const FieldState(),
        .login: const FieldState(),
  };

  /// Обновление состояния полей [fields], [passwordField], [nameField]
  /// в соответствии с тем, от какого типа текстового поля [field] пришёл запрос
  AuthState withFieldState({
    required AuthField field,
    bool? isLoading,
    SnackNotification? notification,
  }) {
    final base = copyWith(isLoading: isLoading ?? this.isLoading);
    AuthMethod method = this.method;

    /// Переводим [field] в то, какое именно поле в state нам надо обновить
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

    /// Обновляем поле
    return _updateField(
      base: base,
      method: method,
      isLoading: isLoading,
      notification: notification,
    );
  }

  /// Обновление полей идентификации с учётом всех проверок
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
        stackTrace: .current,
      ).report();
      return base;
    }
    updatedFields[method] = currentField.copyWith(
      isLoading: isLoading ?? currentField.isLoading,
      notification: notification ?? currentField.notification,
    );
    return base.copyWith(fields: updatedFields);
  }

  ///----------------------------------------------------------------------
  /// Обновление состояния для этапа идентификации
  /// ---------------------------------------------------------------------

  /// Отправка нынешнего поля из [fields] в загрузку
  AuthState withIdentifierLoading(bool loading) {
    return withFieldState(field: .identifier, isLoading: loading);
  }

  /// Отправка нынешнего поля из [fields] в состояние ошибки
  AuthState withIdentifierError(AppError error) {
    return withFieldState(
      field: .identifier,
      isLoading: false,
      notification: .error(error),
    );
  }

  ///----------------------------------------------------------------------
  /// Обновление состояния для этапа пароля
  /// ---------------------------------------------------------------------

  /// Отправка нынешнего поля [passwordField] в состояние загрузки
  AuthState withPasswordLoading(bool loading) {
    return withFieldState(field: .password, isLoading: loading);
  }

  /// Отправка нынешнего поля [passwordField] в состояние ошибки
  AuthState withPasswordError(AppError error) {
    return withFieldState(
      field: .password,
      notification: .error(error),
      isLoading: false,
    );
  }

  ///----------------------------------------------------------------------
  /// Обновление состояния для этапа деталей
  /// ---------------------------------------------------------------------

  /// Отправка нынешнего поля из [fields] в деталях в состояние загрузки
  AuthState withDetailLoading(AuthMethod method, bool loading) {
    return withFieldState(field: method.toField, isLoading: loading);
  }

  /// Отправка нынешнего поля из [fields] в деталях в состояние ошибки
  AuthState withDetailError(AuthMethod method, AppError error) {
    return withFieldState(
      field: method.toField,
      notification: .error(error),
      isLoading: false,
    );
  }

  /// Отправка нынешнего поля из [fields] в деталях в состояние успеха
  /// Такой метод есть только для деталей из-за специфики этих полей
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
    );
  }

  /// Сбрасывает уведомления [notification] и ошибки валидации [errorPersisted] во всех полях,
  /// но сохраняет введённые значения [value].
  /// Используется при смене режима (login/register) или метода входа, чтобы скрыть предыдущие ошибки.
  AuthState resetValidation() {
    /// Сброс полей деталей (email, phone, login)
    final newFields = <AuthMethod, FieldState>{};
    for (final entry in fields.entries) {
      newFields[entry.key] = entry.value.copyWith(
        notification: null,
        errorPersisted: null,
      );
    }

    /// Сброс пароля и имени
    final newPasswordField = passwordField.copyWith(
      notification: null,
      errorPersisted: null,
    );
    final newNameField = nameField.copyWith(
      notification: null,
      errorPersisted: null,
    );

    return copyWith(
      fields: newFields,
      passwordField: newPasswordField,
      nameField: newNameField,
    );
  }

  /// Возвращает предыдущий шаг для системной кнопки «Назад»
  /// (например, при нажатии системной клавиши возврата).
  /// Отличается от [previousScreen] тем, что в некоторых сценариях (регистрация)
  /// системный возврат должен обрабатываться иначе.
  AuthStep? get previousStep {
    final currentStep = step;

    switch (currentStep) {
      case .enterPassword:
        return .enterIdentifier;
      case .enterIdentifier:
        if (mode == .register) {
          return .enterName;
        }
        return null;
      case .registerDetails:
      case .enterName:
      default:
        return null;
    }
  }

  /// Возвращает предыдущий шаг для отрисованной в UI кнопки «Назад».
  /// Различие с [previousStep] сделано для более гибкого управления навигацией
  /// на разных устройствах (например, Android системная кнопка может иметь другое поведение).
  AuthStep? get previousScreen {
    final currentStep = step;

    switch (currentStep) {
      case .enterPassword:
      case .enterIdentifier:
        if (mode == .register) {
          return .enterName;
        }
        return null;
      case .registerDetails:
      case .enterName:
      default:
        return null;
    }
  }

  /// Нужен для выходя из приложения, если мы на первом этапе нажимаем системный назад
  bool get isFirstStep {
    if (mode == .login) {
      return step == .enterIdentifier;
    } else {
      return step == .enterName;
    }
  }

  /// Этот метод используем только в момент полной авторизации пользователя
  /// Это происходит когда мы покидаем экран деталей (пропускаем его)
  /// Находясь на экране деталей мы не .authenticated
  AuthState authenticated(User? user) {
    final u = user ?? this.user;
    if(u == null) {
      log('Неправильное использование метода [AuthState authenticated(User? user)]');
      return this;
    }

    LocalStorageService.saveAuth(u.id);
    SessionService.id = u.id;

    return copyWith(user: user, step: .authenticated);
  }
}
