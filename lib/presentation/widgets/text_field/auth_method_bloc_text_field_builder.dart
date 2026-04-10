import 'package:co_stock/application/controllers/bloc_text_field_controller.dart';
import 'package:co_stock/domain/errors/validation/field_validator.dart';
import 'package:co_stock/domain/errors/validation/validators.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:co_stock/presentation/widgets/text_field/bloc_phone_text_field.dart';
import 'package:co_stock/presentation/widgets/text_field/bloc_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension AuthMethodWidgets on AuthMethod {
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

  FieldValidator? get validator {
    switch (this) {
      case .email:
        return Validators.email;
      case .phone:

      /// Его валидатор зависит от LocaleData и проставляется через
      /// кастомный BlocPhoneTextField
        return null;
      case .login:
        return Validators.login;
    }
  }

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

  String get hintText {
    switch (this) {
      case .email:
        return 'Email';
      case .phone:
        return 'Phone';
      case .login:
        return 'Login';
    }
  }

  Widget buildField<B extends StateStreamable<S>, S>({
    required FieldState Function(S) selector,
    required BlocTextFieldController? controller,
    required void Function(FieldState) onChanged,
    required void Function(String) onFieldSubmitted,
    bool autofocus = false,
    required TextInputAction textInputAction,
  }) {
    switch (this) {
      case .phone:
        return BlocPhoneTextField<B, S>(
          key: ValueKey(name),
          selector: selector,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          autofocus: autofocus,
          textInputAction: textInputAction,
          hintText: hintText,
        );
      case .email:
      case .login:
        return BlocTextField<B, S>(
          key: ValueKey(name),
          hintText: hintText,
          keyboardType: textInputType,
          inputFormatters: null,
          selector: selector,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          autofocus: autofocus,
          textInputAction: textInputAction,
        );
    }
  }
}