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
                  label: Text(e.hintText),
                ),
              )
              .toList(),
          selected: state.method,
          onChanged: (method) {
            if (method != null) {
              bloc.add(.changeMethod(method));
            }
          }
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
        if (state.step != .enterIdentifier &&
            state.step != .enterPassword ||
            state.fields[state.method] == null) {
          return const SizedBox();
        }

        final bloc = context.read<AuthBloc>();
        final method = state.method;

        /// Текстовое поле
        return method.buildField<AuthBloc, AuthState>(
          selector: (s) => s.fields[s.method] ?? const FieldState(),
          controller: _identifierController,
          onChanged: (newField) {
            bloc.add(.updateField(field: .identifier, value: newField));
          },
          onFieldSubmitted: (_) {
            bloc.add(const .submitIdentifier());
          },
          textInputAction: .done,
          autofocus: true,
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
                        autofocus: true,
                        showToggleObscure: true,
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

  Widget _buildModeLabel(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.mode != current.mode,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Text(
            state.mode.text,
            key: ValueKey(state.mode),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        _buildModeLabel(context),
        _segmentedButton,
        const SizedBox(height: 12),
        _identifierField,
        _passwordField,
        _actionButton,
      ],
    );
  }
}
