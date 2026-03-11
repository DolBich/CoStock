part of '../auth_screen.dart';

class _EnterIdentifierView extends StatelessWidget {
  const _EnterIdentifierView({super.key});

  Widget get _segmentedButton {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();
        return SegmentedButton<AuthMethod>(
          segments: AuthMethod.values
              .map(
                (e) => ButtonSegment(
                  value: e,
                  icon: Icon(e.icon),
                  label: Text(e.text),
                  enabled: !state.isLoading,
                ),
              )
              .toList(),
          selected: {state.method},
          showSelectedIcon: false,
          onSelectionChanged: (Set<AuthMethod> newSelection) {
            bloc.add(.changeMethod(newSelection.first));
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
        final bloc = context.read<AuthBloc>();
        final method = state.method;
        return BlocTextField<AuthBloc, AuthState>(
          key: ValueKey('${state.method}'),
          hintText: method.text,
          keyboardType: method.textInputType,
          inputFormatters: method.textInputFormatters,
          selector: (s) => s.fields[s.method] ?? const FieldState(),
          onChanged: (newField) {
            bloc.add(.updateField(field: .identifier, value: newField));
          },
          onFieldSubmitted: (_) {
            bloc.add(const .submitIdentifier());
          },
          instantValidator: method.getInstantValidator,
          finalValidator: method.getFinalValidator,
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
              ? Column(
                  children: [
                    BlocTextField<AuthBloc, AuthState>(
                      hintText: 'Password',
                      obscureText: true,
                      selector: (s) => s.passwordField,
                      onChanged: (newField) {
                        bloc.add(
                          .updateField(
                            field: .password,
                            value: newField,
                          ),
                        );
                      },
                      onFieldSubmitted: (_) {
                        bloc.add(const .submitPassword());
                      },
                      instantValidator: Validators.passwordInstant,
                      finalValidator: Validators.passwordFinal,
                      textInputAction: .done,
                    ),
                  ],
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
        final bloc = context.read<AuthBloc>();
        final showPassword = state.step == .enterPassword;
        final identifierField = state.fields[state.method];

        final enableButton =
            !state.isLoading &&
            !(identifierField?.isError ?? true) &&
            (!showPassword || !state.passwordField.isError);

        return ElevatedButton(
          onPressed: enableButton ? () => bloc.add(const .trySubmit()) : null,
          child: Text(showPassword ? 'Continue' : 'Next'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      spacing: 12,
      children: [
        _segmentedButton,
        _identifierField,
        _passwordField,
        _actionButton,
      ],
    );
  }
}
