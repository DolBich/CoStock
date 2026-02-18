import 'package:co_stock/application/handlers/phone_input_formatter.dart';
import 'package:co_stock/domain/errors/app_errors.dart';
import 'package:co_stock/domain/errors/validation/validation_rule.dart';
import 'package:co_stock/domain/errors/validation/validators.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_field.dart';
import 'package:co_stock/domain/screens_entities/user_screen/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AuthMethod { email, phone, login }

extension AuthMethodCheck on AuthMethod {
  bool check(User user, String identifier) {
    switch (this) {
      case .email:
        return user.email == identifier;
      case .phone:
        return user.phone == identifier;
      case .login:
        return user.login == identifier;
    }
  }
}

extension AuthMethodError on AuthMethod {
  AuthErrorType get error {
    switch (this) {
      case .email:
        return .emailAlreadyRegistered;
      case .phone:
        return .phoneAlreadyRegistered;
      case .login:
        return .loginAlreadyExists;
    }
  }
}

extension AuthMethodUI on AuthMethod {
  IconData get icon {
    switch (this) {
      case .email:
        return Icons.email_outlined;
      case .phone:
        return Icons.phone_outlined;
      case .login:
        return Icons.person_outline;
    }
  }

  String get text {
    switch (this) {
      case .email:
        return 'Email';
      case .phone:
        return 'Phone';
      case .login:
        return 'Login';
    }
  }
}

extension AuthMethodValidators on AuthMethod {
  ValidationRule get getInstantValidator {
    switch (this) {
      case .email:
        return Validators.emailInstant;
      case .phone:
        return Validators.phoneInstant;
      case .login:
        return Validators.loginInstant;
    }
  }

  ValidationRule get getFinalValidator {
    switch (this) {
      case .email:
        return Validators.emailFinal;
      case .phone:
        return Validators.phoneFinal;
      case .login:
        return Validators.loginFinal;
    }
  }
}

extension AuthMethodToField on AuthMethod {
  AuthField get toField {
    switch (this) {
      case .email:
        return .email;
      case .phone:
        return .phone;
      case .login:
        return .login;
    }
  }
}

extension AuthMethodKeyBoard on AuthMethod {
  TextInputType get textInputType {
    switch (this) {
      case .email:
        return .emailAddress;
      case .phone:
        return .phone;
      case .login:
        return .text;
    }
  }

  List<TextInputFormatter>? get textInputFormatters {
    switch (this) {
      case .phone:
        return [PhoneInputFormatter()];
      default:
        return null;
    }
  }
}
