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

  static const _textNext = Text('Next');

  Widget get _nextButton {
    return BlocBuilder<AuthBloc, AuthState>(
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
          child: _textNext,
        );
      },
    );
  }

  static const _textInfo =
      'Это имя будет видно другим пользователям. Оно не используется для входа в аккаунт.';
  static const double _spacing8 = 8;
  static const double _size16 = 16;
  static const _icon = Icons.info_outline;

  Widget get _descriptionText {
    final theme = Theme.of(context);
    return Row(
      spacing: _spacing8,
      children: [
        Icon(
          _icon,
          size: _size16,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        Expanded(
          child: Text(
            _textInfo,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  static const double _spacing24 = 24;
  static const _hintText = 'Enter your name';

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Column(
      crossAxisAlignment: .stretch,
      spacing: _spacing24,
      children: [
        _descriptionText,
        BlocTextField<AuthBloc, AuthState>(
          hintText: _hintText,
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
        _nextButton,
      ],
    );
  }
}
