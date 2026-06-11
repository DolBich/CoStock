import 'dart:async';

import 'package:co_stock/application/controllers/bloc_text_field_controller.dart';
import 'package:co_stock/domain/errors/validation/field_validator.dart';
import 'package:co_stock/domain/errors/validation/validation_freezed.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

part 'validation_display.dart';

class BlocTextField<B extends StateStreamable<S>, S> extends StatefulWidget {
  /// Подсказывающий текст
  final String? hintText;

  /// Тип используемой клавиатуры
  final TextInputType keyboardType;

  /// Внутренние форматеры текста (как он будет автоматически преобразовываться)
  /// Какие символы можно физически ввести, какие нет
  final List<TextInputFormatter>? inputFormatters;

  /// Скрыть текст
  final bool obscureText;

  /// Автофокус на этом поел
  final bool autofocus;

  /// Что делать после подтверждения поля
  final TextInputAction? textInputAction;

  /// Контроль фокуса на этом поле
  final FocusNode? focusNode;

  /// Сколько строчек может занимать текст описания ошибки
  final int? errorMaxLines;

  /// Получение обновляемых значений поля от bloc
  final FieldState Function(S) selector;

  /// Особый контроллер для управления [BlocTextField] извне
  final BlocTextFieldController? controller;

  /// Валидатор текста, как проверяем текст на правильность написания
  final FieldValidator? validator;

  /// При изменении текста
  final void Function(FieldState) onChanged;

  /// При попытке подтвердить поле
  final void Function(String)? onFieldSubmitted;

  /// Показывать глазик видимости текста
  final bool showToggleObscure;

  /// Виджет в начале поля
  final Widget? leading;

  /// Изначальное значение текста в поле
  final String? initialValue;

  const BlocTextField({
    super.key,
    required this.selector,
    required this.onChanged,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.obscureText = false,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.errorMaxLines = 3,
    this.showToggleObscure = false,
    this.leading,
    this.initialValue,
  });

  @override
  State<BlocTextField<B, S>> createState() => _BlocTextFieldState<B, S>();
}

class _BlocTextFieldState<B extends StateStreamable<S>, S>
    extends State<BlocTextField<B, S>>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;

  /// Отслеживание и управление появлением/исчезновением клавиатуры для
  /// автоматического запуска валидации при убирании клавиатуры
  late KeyboardVisibilityController _keyboardVisibilityController;
  late StreamSubscription<bool> _keyboardSubscription;

  /// Набор контроллеров анимации
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  late bool _obscureText;

  /// Этот контроллер - костыль для вызова PhoneInputFormatter при изменении
  /// selection
  late TextEditingController _controller;
  TextEditingValue? _oldTextValue;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _obscureText = widget.obscureText;


    /// Настраиваем анимацию
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    /// Настраиваем фокус и его управление, отслеживание
    _focusNode = widget.focusNode ?? FocusNode();
    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_focusNode.hasFocus) {
          FocusScope.of(context).requestFocus(_focusNode);
        }
      });
    }
    _focusNode.addListener(_onFocusChange);

    /// Настраиваем управление/отслеживание клавиатуры
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription = _keyboardVisibilityController.onChange.listen((
      isVisible,
    ) {
      if (mounted) _validate(errorPersist: !isVisible);
    });

    /// Если есть форматеры - отслеживаем изменение текста для его преображения
    /// через эти форматёры
    if (widget.inputFormatters != null) {
      _controller.addListener(_controllerListener);
    }

    /// Заполняем наш [controller], чтобы можно было через него вызывать внутренние
    /// функции поля (управлять им извне через этот контроллер)
    widget.controller?.attach(
      updateValue: _updateValue,
      validate: _validate,
      submit: _submit,
    );
  }

  /// Нужен только для отслеживания изменения selection в текстовом поле и
  /// отправке его не форматирование
  void _controllerListener() {
    if (_oldTextValue == _controller.value) return;
    final formatters = widget.inputFormatters;
    if (formatters == null) return;
    final oldValue = _oldTextValue ?? _controller.value;
    TextEditingValue newValue = _controller.value;
    for (final formatter in formatters) {
      newValue = formatter.formatEditUpdate(oldValue, newValue);
    }
    _oldTextValue = newValue;
    _controller.value = newValue;
  }

  void _updateValue(String newValue) {
    final state = context.read<B>().state;
    final field = widget.selector(state);
    final newField = field.computeWithValidation(
      newValue: newValue,
      validator: widget.validator,
    );
    if (field != newField) {
      widget.onChanged(
        newField.copyWith(wasInteracted: true, notification: null),
      );
    }
  }

  /// Нужно чтобы ошибки и успехи не отображались сразу, а только если
  /// пользователь уже что-то сделал с полем
  bool get wasInteracted {
    final state = context.read<B>().state;
    final field = widget.selector(state);

    return field.wasInteracted;
  }

  /// Валидация состояния поля
  bool _validate({bool errorPersist = true, FieldState? inputField}) {
    if (!mounted) return false;
    final state = context.read<B>().state;
    final field = inputField ?? widget.selector(state);

    /// Валидируем
    FieldState newField = field.computeWithValidation(
      newValue: field.value,
      validator: widget.validator,
      forceErrorPersisted: errorPersist,
    );

    /// Если есть фокус - показываем описание ошибки, иначе оставляем просто
    /// пометку, что тут ошибка валидации
    newField = newField.copyWith(
      notification: !_focusNode.hasFocus && (newField.errorPersisted ?? false)
          ? const .error(.validator(type: .validator))
          : newField.notification,
    );

    if (field != newField) {
      widget.onChanged(newField);
    }
    return newField.canSubmit;
  }

  /// Попытка подтвердить поле
  void _submit() {
    final state = context.read<B>().state;
    final field = widget.selector(state);
    /// Подтверждаем если проходит валидацию
    if (_validate()) {
      widget.onFieldSubmitted?.call(field.value);
    }

    /// Если пытаемся засабмитить поле ни разу с ним не провзаимодействовав
    /// то это должно считаться тем самым взаимодействием с валидацией
    if (!wasInteracted) {
      _validate(inputField: field.copyWith(wasInteracted: true));
    }
  }

  /// При смене фокуса валидируем поле
  void _onFocusChange() {
    if (mounted) _validate(errorPersist: !_focusNode.hasFocus);
    setState(() {});
  }

  /// Смена видимости текста через глазик
  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _animationController.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    _keyboardSubscription.cancel();
    _controller.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      buildWhen: (p, c) => widget.selector(p) != widget.selector(c),
      builder: (context, state) {
        final FieldState field = widget.selector(state);
        final validationResult = field.validationResult;
        final bool showValidation =
            validationResult != null && _focusNode.hasFocus;
        final bool completed = field.completed;

        /// Делаем через [copyWith], а не через .text
        /// Во втором случае меняеся selection на .invalid
        if (_controller.text != field.value && field.value.isNotEmpty) {
          _controller.value = _controller.value.copyWith(text: field.value);
        }

        /// --- ОТОБРАЖЕНИЕ ОШИБОК И УСПЕХА ---
        String? helperText;
        Color? helperColor;
        Widget? statusIcon;
        const double iconSize = 20;

        if (completed) {
          statusIcon = const Icon(
            Icons.check_circle,
            color: AppThemeImpl.success,
            size: 20,
          );
          helperText = 'Подтверждено';
          helperColor = AppThemeImpl.success;
        } else if (field.isLoading) {
          statusIcon = const Padding(
            padding: .all(8.0),
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (field.notification != null && wasInteracted) {
          final notification = field.notification!;
          helperText = notification.userMessage;
          helperColor = notification.type.backgroundColor;
          statusIcon = Icon(
            notification.type.icon,
            color: helperColor,
            size: iconSize,
          );
        }

        /// --- СОЗДАНИЕ suffixIcon ---
        Widget? suffixIcon;
        if (widget.showToggleObscure) {
          /// Собираем Row из statusIcon и глазика
          final List<Widget> children = [];

          if (statusIcon != null) {
            children.add(statusIcon);
          }

          children.add(
            IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                size: iconSize,
              ),
              onPressed: _toggleObscure,
              padding: .zero,
              // убираем лишние отступы, чтобы не увеличивать высоту поля
              constraints: const BoxConstraints(
                minWidth: 32,
                minHeight: 32,
              ), // сохраняем область нажатия
            ),
          );

          suffixIcon = Row(
            mainAxisSize: .min,
            crossAxisAlignment: .center,
            children: children,
          );
        } else {
          suffixIcon = statusIcon;
        }

        /// --- ОТОБРАЖЕНИЕ ГРАНИЦЫ ----
        final isError = field.showError;
        final isSuccess = field.showSuccess;
        final theme = Theme.of(context);
        final inputTheme = theme.inputDecorationTheme;

        InputBorder? enabledBorder;
        InputBorder? focusedBorder;

        if (completed || isSuccess) {
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

        if (showValidation != _animationController.isCompleted) {
          if (showValidation) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        }

        return Column(
          children: [
            Row(
              crossAxisAlignment: .start,
              children: [
                /// Виджет перед текстовым полем [leading]
                if (widget.leading != null) widget.leading!,
                if (widget.leading != null) const SizedBox(width: 12),

                /// Текстовое поле
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    enabled: !completed,
                    focusNode: _focusNode,
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
                    obscureText: _obscureText,
                    autofocus: widget.autofocus,
                    textInputAction: widget.textInputAction,
                    onChanged: _updateValue,
                    onEditingComplete: () {},
                    onFieldSubmitted: (_) => _submit(),
                  ),
                ),
              ],
            ),

            /// Текст ошибки/успеха/валидации поля
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return SizeTransition(
                  sizeFactor: _slideAnimation,
                  axisAlignment: -1.0,
                  child: Opacity(
                    opacity: _animationController.value,
                    child: child,
                  ),
                );
              },
              child: validationResult != null
                  ? _ValidationDisplay(
                      validationResult: validationResult,
                      errorPersisted: field.wasInteracted
                          ? field.errorPersisted
                          : null,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }
}
