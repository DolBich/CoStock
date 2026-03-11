import 'package:co_stock/domain/errors/validation/validation_rule.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTextField<B extends StateStreamable<S>, S> extends StatelessWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onFieldSubmitted;
  final FieldState Function(S) selector;
  final void Function(FieldState) onChanged;
  final ValidationRule? instantValidator;
  final ValidationRule? finalValidator;
  final bool obscureText;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int? errorMaxLines;

  const BlocTextField({
    super.key,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onFieldSubmitted,
    required this.selector,
    required this.onChanged,
    this.instantValidator,
    this.finalValidator,
    this.obscureText = false,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.errorMaxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    bool firstTime = true;
    return BlocBuilder<B, S>(
      buildWhen: (p, c) => selector(p) != selector(c),
      builder: (context, state) {
        final FieldState field;
        if (firstTime) {
          field = selector(state).copyWith(
            instantValidator: instantValidator,
            finalValidator: finalValidator,
          );
          firstTime = false;
        } else {
          field = selector(state);
        }

        /// --- ОТОБРАЖЕНИЕ ОШИБОК И УСПЕХА ---
        String? helperText;
        Color? helperColor;
        Widget? suffixIcon;
        bool isError = true;
        const double iconSize = 20;
        if (field.isLoading) {
          suffixIcon = const Padding(
            padding: .all(8.0),
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (field.availabilityStatus == .available) {
          helperText = field.availabilityStatus.toText;
          helperColor = AppThemeImpl.success;
          suffixIcon = const Icon(
            Icons.check_circle,
            color: AppThemeImpl.success,
            size: iconSize,
          );
          isError = false;
        } else if (field.error != null &&
            field.hasInteracted &&
            field.value.isNotEmpty) {
          helperText = field.error;
          helperColor = AppThemeImpl.error;
          suffixIcon = const Icon(
            Icons.error_outline,
            color: AppThemeImpl.error,
            size: iconSize,
          );
        } else if (field.availabilityStatus == .unavailable) {
          helperText = field.availabilityStatus.toText;
          helperColor = AppThemeImpl.error;
          suffixIcon = const Icon(
            Icons.error_outline,
            color: AppThemeImpl.error,
            size: iconSize,
          );
        }

        /// --- ОТОБРАЖЕНИЕ ОШИБОК И УСПЕХА ---

        /// --- ОТОБРАЖЕНИЕ ГРАНИЦЫ ----
        final theme = Theme.of(context);
        final inputTheme = theme.inputDecorationTheme;

        InputBorder? enabledBorder;
        InputBorder? focusedBorder;

        if (!isError) {
          enabledBorder = inputTheme.enabledBorder?.copyWith(
            borderSide: inputTheme.enabledBorder?.borderSide.copyWith(
              color: AppThemeImpl.success,
            ),
          );
          focusedBorder = inputTheme.focusedBorder?.copyWith(
            borderSide: inputTheme.focusedBorder?.borderSide.copyWith(
              color: AppThemeImpl.success,
            ),
          );
        }
        /// --- ОТОБРАЖЕНИЕ ГРАНИЦЫ ----

        return TextFormField(
          initialValue: field.value,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: isError ? helperText : null,
            helperText: helperText,
            helperStyle: helperColor != null
                ? TextStyle(color: helperColor)
                : null,
            errorMaxLines: errorMaxLines,
            suffixIcon: suffixIcon,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          autofocus: autofocus,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onChanged: (value) {
            /// Мгновенная валидация
            String? error;
            if (instantValidator != null) {
              error = instantValidator!.validate(value);
            }
            final newField = field.copyWith(
              value: value,
              error: error, // сбрасываем серверную ошибку при изменении
              hasInteracted: true,
              isLoading: false, // сбрасываем загрузку при изменении
            );
            onChanged(newField);
          },
          onEditingComplete: () {
            /// Финальная валидация
            String? error;
            if (finalValidator != null) {
              error = finalValidator!.validate(field.value);
            }
            final newField = field.copyWith(error: error);
            onChanged(newField);
            FocusScope.of(context).unfocus();
          },
          onFieldSubmitted: onFieldSubmitted,
        );
      },
    );
  }
}
