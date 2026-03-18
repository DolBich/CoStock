part of '../auth_screen.dart';

class _EnterNameView extends StatefulWidget {
  const _EnterNameView({super.key});

  @override
  State<_EnterNameView> createState() => __EnterNameViewState();
}

class __EnterNameViewState extends State<_EnterNameView> {
  late final BlocTextFieldController nameController;

  @override
  void initState() {
    super.initState();
    nameController = BlocTextFieldController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24,
      children: [
        BlocTextField<AuthBloc, AuthState>(
          hintText: 'Enter your name',
          selector: (s) => s.nameField,
          controller: nameController,
          validator: Validators.name,
          autofocus: true,
          textInputAction: .done,
          onChanged: (newField) {
            bloc.add(.updateField(field: .name, value: newField));
          },
          onFieldSubmitted: (_) {
            bloc.add(const .changeName());
          },
        ),
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (p, c) =>
              p.isLoading != c.isLoading || p.nameField != c.nameField,
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state.isLoading || !state.nameField.canSubmit
                  ? null
                  : () {
                      if (nameController.validate()) {
                        nameController.submit();
                      }
                    },
              child: const Text('Next'),
            );
          },
        ),
      ],
    );
  }
}
