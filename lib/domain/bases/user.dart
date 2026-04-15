import 'package:co_stock/application/tools/id_setter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User.customId({
    required String id,
    required String name,
    String? email,
    String? phone,
    String? login,
    required String password,
    UserSettings? settings,
  }) = _User;

  factory User({
    required String name,
    String? email,
    String? phone,
    String? login,
    required String password,
    UserSettings? settings,
  }) => User.customId(
    id: IdSetter.setId,
    name: name,
    email: email,
    phone: phone,
    login: login,
    password: password,
    settings: settings,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtension on User {
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
