part of '../auth_screen.dart';

class _EnterIdentifierView extends StatefulWidget {
  const _EnterIdentifierView({super.key});

  @override
  State<_EnterIdentifierView> createState() => __EnterIdentifierViewState();
}

class __EnterIdentifierViewState extends State<_EnterIdentifierView> {
  late final BlocTextFieldController _identifierController;
  late final BlocTextFieldController _passwordController;

  @override
  void initState() {
    super.initState();
    _identifierController = BlocTextFieldController();
    _passwordController = BlocTextFieldController();
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget get _segmentedButton {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();
        return AppSegmentedButton<AuthMethod>(
          segments: AuthMethod.values
              .map(
                (e) => AppSegmentButton(
                  value: e,
                  icon: e.icon,
                  label: Text(e.text),
                ),
              )
              .toList(),
          selected: state.method,
          onChanged: (method) {
            bloc.add(.changeMethod(method));
          },
        );
      },
    );
  }

  Widget get _identifierField {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) =>
          p.method != c.method ||
          p.step != c.step ||
          p.fields.length != c.fields.length,
      builder: (context, state) {
        /// Эта заглушка спасает нас от бага срабатывания onChange
        /// от [s.fields[s.method] ?? const FieldState()] при определении
        /// missing fields для details
        if(state.fields[state.method] == null) return const SizedBox();

        final bloc = context.read<AuthBloc>();
        final method = state.method;
        return BlocTextField<AuthBloc, AuthState>(
          key: ValueKey('${state.method}'),
          hintText: method.text,
          keyboardType: method.textInputType,
          inputFormatters: method.textInputFormatters,
          selector: (s) => s.fields[s.method] ?? const FieldState(),
          controller: _identifierController,
          onChanged: (newField) {
            bloc.add(.updateField(field: .identifier, value: newField));
          },
          onFieldSubmitted: (_) {
            bloc.add(const .submitIdentifier());
          },
          validator: method.validator,
          autofocus: true,
          textInputAction: .done,
        );
      },
    );
  }

  Widget get _passwordField {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) => p.step != c.step,
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();
        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: state.step == .enterPassword
              ? Padding(
                padding: const .symmetric(vertical: 12.0),
                child: Column(
                    children: [
                      BlocTextField<AuthBloc, AuthState>(
                        hintText: 'Password',
                        obscureText: true,
                        selector: (s) => s.passwordField,
                        controller: _passwordController,
                        onChanged: (newField) {
                          bloc.add(
                            .updateField(field: .password, value: newField),
                          );
                        },
                        onFieldSubmitted: (_) {
                          bloc.add(const .submitPassword());
                        },
                        validator: Validators.password,
                        textInputAction: .done,
                      ),
                    ],
                  ),
              )
              : const SizedBox.shrink(),
        );
      },
    );
  }

  Widget get _actionButton {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) =>
          p.isLoading != c.isLoading ||
          p.fields != c.fields ||
          p.passwordField != c.passwordField ||
          p.method != c.method ||
          p.step != c.step,
      builder: (context, state) {
        final showPassword = state.step == .enterPassword;
        final identifierField = state.fields[state.method];
        final enableButton =
            !state.isLoading &&
            !(identifierField?.hasError ?? true) &&
            (!showPassword || !state.passwordField.hasError);

        return ElevatedButton(
          onPressed: enableButton
              ? () {
                  if (showPassword) {
                    _passwordController.submit();
                  } else {
                    _identifierController.submit();
                  }
                }
              : null,
          child: Text(showPassword ? 'Continue' : 'Next'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        _segmentedButton,
        const SizedBox(height: 12,),
        _identifierField,
        _passwordField,
        _actionButton,
      ],
    );
  }
}
