import 'package:co_stock/domain/bases/id_manager.dart';
import 'package:fpdart/fpdart.dart';

class User {
  final String id;
  final String name;
  final String? email;
  final String? phone;
  final String? login;
  final String password;

  User({
    String? id,
    required this.name,
    this.email,
    this.phone,
    this.login,
    required this.password,
  }) : id = id ?? IdManager.setId;

  User copyWith({
    String? name,
    Option<String?>? email,
    Option<String?>? phone,
    Option<String?>? login,
    String? password,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email?.fold(() => this.email, (v) => v) ?? this.email,
      phone: phone?.fold(() => this.phone, (v) => v) ?? this.phone,
      login: login?.fold(() => this.login, (v) => v) ?? this.login,
      password: password ?? this.password,
    );
  }

  User changeId(String id) {
    return User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      login: login,
      password: password,
    );
  }

  bool get needEmail => email == null;

  bool get needLogin => login == null;

  bool get needPhone => phone == null;

  bool get needDetails => email == null || login == null || phone == null;

  bool get isValid =>
      email != null ||
      phone != null ||
      login != null && name.isNotEmpty && password.isNotEmpty;
}
