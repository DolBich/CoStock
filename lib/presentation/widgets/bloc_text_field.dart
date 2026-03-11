import 'dart:async';

import 'package:co_stock/domain/errors/validation/validation_rule.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class BlocTextField<B extends StateStreamable<S>, S> extends StatefulWidget {
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
  State<BlocTextField<B, S>> createState() => _BlocTextFieldState<B, S>();
}

class _BlocTextFieldState<B extends StateStreamable<S>, S>
    extends State<BlocTextField<B, S>> {
  late FocusNode _focusNode;
  late KeyboardVisibilityController _keyboardVisibilityController;
  late StreamSubscription<bool> _keyboardSubscription;

  @override
  void initState() {
    super.initState();
    final state =  context.read<B>().state;
    final field = widget
        .selector(state)
        .copyWith(
      instantValidator: widget.instantValidator,
      finalValidator: widget.finalValidator,
    );
    widget.onChanged(field);

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);

    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription = _keyboardVisibilityController.onChange.listen((
      isVisible,
    ) {
      if (!isVisible) {
        _performFinalValidation(); // клавиатура скрыта — валидируем
      }
    });
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _performFinalValidation();
    }
  }

  void _performFinalValidation() {
    final state = context.read<B>().state;
    final field = widget.selector(state);

    // Вызываем onChanged только если ошибка изменилась
    final newField = field.validateFinal();
    if (field != newField) {
      widget.onChanged(newField);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      // dispose только если создали сами
      _focusNode.dispose();
    }
    _keyboardSubscription.cancel();
    super.dispose();
  }

  void _handleSubmit(String value) {
    _performFinalValidation();

    final state = context.read<B>().state;
    final field = widget.selector(state);

    if (field.isValid) {
      widget.onFieldSubmitted?.call(value);
    }
    // Если есть ошибка или загрузка — ничего не делаем (ошибка уже отображается)
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: (p, c) => widget.selector(p) != widget.selector(c),
      builder: (context, state) {
        final FieldState field = widget.selector(state);

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
        } else if (field.isError) {
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
          focusNode: _focusNode,
          initialValue: field.value,
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: isError ? helperText : null,
            helperText: helperText,
            helperStyle: helperColor != null
                ? TextStyle(color: helperColor)
                : null,
            errorMaxLines: widget.errorMaxLines,
            suffixIcon: suffixIcon,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          obscureText: widget.obscureText,
          autofocus: widget.autofocus,
          textInputAction: widget.textInputAction,
          onChanged: (value) {
            /// Мгновенная валидация
            final newField = field
                .copyWith(value: value, hasInteracted: true, error: null)
                .validateInstant();
            widget.onChanged(newField);
          },
          onEditingComplete: () {
            // Просто убираем фокус — финальная валидация сработает в слушателе
            FocusScope.of(context).unfocus();
            // onFieldSubmitted вызывается автоматически после onEditingComplete
          },
          onFieldSubmitted: _handleSubmit,
        );
      },
    );
  }
}
