import 'package:co_stock/application/blocs/prefs_bloc/prefs_bloc.dart';
import 'package:co_stock/application/controllers/bloc_text_field_controller.dart';
import 'package:co_stock/application/handlers/phone_input_formatter.dart';
import 'package:co_stock/domain/errors/validation/validators.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:co_stock/presentation/widgets/phone_country_selector.dart';
import 'package:co_stock/presentation/widgets/text_field/bloc_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Специализированный виджет для ввода номера телефона с выбором страны.
/// Автоматически подхватывает текущую локаль из PrefsBloc и обновляет
/// форматтер, валидатор и виджет выбора страны при смене локали.
///
/// !!!Требует в контексте наличия PrefsBloc
class BlocPhoneTextField<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final FieldState Function(S) selector;
  final void Function(FieldState) onChanged;
  final void Function(String)? onFieldSubmitted;
  final BlocTextFieldController? controller;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? hintText;

  const BlocPhoneTextField({
    super.key,
    required this.selector,
    required this.onChanged,
    this.controller,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.textInputAction,
    this.focusNode,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final prefsBloc = context.read<PrefsBloc>();
    final locale = prefsBloc.state.appLocale.localeData;
    final phoneValidator = Validators.phoneWithLocale(locale);
    final phoneFormatter = PhoneInputFormatter(
      countryCode: locale.phonePrefix,
      nationalLength: locale.phoneNationalLength,
    );

    return BlocTextField<B, S>(
      key: ValueKey('phone_${locale.code}_${locale.phonePrefix}'),
      selector: selector,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      autofocus: autofocus,
      textInputAction: textInputAction,
      focusNode: focusNode,
      hintText: hintText ?? 'Phone number',
      keyboardType: .phone,
      inputFormatters: [phoneFormatter],
      validator: phoneValidator,
      leading: PhoneCountrySelector(
        currentLocale: locale,
        onChanged: (newLocale) {
          prefsBloc.add(.changePhoneLocale(newLocale));
        },
      ),
    );
  }
}
