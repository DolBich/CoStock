part of '../auth_screen.dart';

class _EnterNameView extends StatelessWidget {
  const _EnterNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Column(
      crossAxisAlignment: .stretch,
      spacing: 24,
      children: [
        BlocTextField<AuthBloc, AuthState>(
          hintText: 'Enter your name',
          selector: (s) => s.nameField,
          onChanged: (newField) {
            bloc.add(.updateField(field: .name, value: newField));
          },
          onFieldSubmitted: (_) {
            bloc.add(const .changeName());
          },
          instantValidator: Validators.nameInstant,
          finalValidator: Validators.nameFinal,
          autofocus: true,
          textInputAction: .done,
        ),
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (p, c) =>
              p.isLoading != c.isLoading || p.nameField != c.nameField,
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state.isLoading || !state.nameField.isValid
                  ? null
                  : () {
                      bloc.add(const .changeName());
                    },
              child: const Text('Next'),
            );
          },
        ),
      ],
    );
  }
}
