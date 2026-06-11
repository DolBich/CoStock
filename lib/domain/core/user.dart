import 'package:co_stock/application/tools/id_setter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.dart';

part 'user.freezed.dart';

/// Класс настройки аккаунта
@freezed
sealed class User with _$User {
  const User._();

  /// Фабрика для юзера с кастомным id
  const factory User.customId({
    required String id,
    required String name,
    String? email,
    String? phone,
    String? login,
    required String password,
    UserSettings? settings,
  }) = _User;

  /// Стандартный конструктор с автоматическим определением id
  factory User({
    required String name,
    String? email,
    String? phone,
    String? login,
    required String password,
    UserSettings? settings,
  }) => User.customId(
    id: const IdSetter()(),
    name: name,
    email: email,
    phone: phone,
    login: login,
    password: password,
    settings: settings,
  );

  bool get needEmail => email == null;

  bool get needLogin => login == null;

  bool get needPhone => phone == null;

  bool get needDetails =>
      email == null ||
          login == null ||
          phone == null && settings?.dontAskDetails != true;

  bool get isValid =>
      email != null ||
          phone != null ||
          login != null && name.isNotEmpty && password.isNotEmpty;

  User withEmail(String? email) => copyWith(email: email);

  User withPhone(String? phone) => copyWith(phone: phone);

  User withLogin(String? login) => copyWith(login: login);

  // Удобный метод для обновления настроек
  User withUpdatedSettings(UserSettings newSettings) =>
      copyWith(settings: newSettings);
}

