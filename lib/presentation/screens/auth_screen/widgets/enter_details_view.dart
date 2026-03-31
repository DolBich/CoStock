part of '../auth_screen.dart';

class _RegisterDetailsView extends StatelessWidget {
  const _RegisterDetailsView({super.key});

  Widget get _skipButton {
    return Builder(
      builder: (context) {
        final bloc = context.read<AuthBloc>();
        return OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => AlertDialog(
                title: const Text('Пропустить заполнение?'),
                content: const Text(
                  'Вы можете заполнить детали позже в профиле. '
                  'Хотите больше не показывать это окно?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      bloc.add(const .skipDetails());
                    },
                    child: const Text('Нет'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      bloc.add(const .skipDetails(dontAskAgain: true));
                    },
                    child: const Text('Да, больше не спрашивать'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Skip'),
        );
      },
    );
  }

  Widget get _registerAllButton {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) => p.fields != c.fields || p.isLoading != c.isLoading,
      builder: (context, state) {
        final anyLoading = state.fields.values.any((f) => f.isLoading);
        final anyAvailable = state.fields.values.any((f) => f.isAvailable);
        final isEnabled = !state.isLoading && !anyLoading && anyAvailable;

        return ElevatedButton(
          onPressed: isEnabled
              ? () => context.read<AuthBloc>().add(const .registerAllDetails())
              : null,
          child: const Text('Register All'),
        );
      },
    );
  }

  Widget _descriptionText(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.security, size: 18, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'Привяжите аккаунт к почте и телефону, чтобы не потерять доступ. '
            'Это поможет восстановить пароль и защитить данные.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous.fields != current.fields,
      builder: (context, state) {
        final missingMethods = state.fields.keys.toList();

        return Column(
          crossAxisAlignment: .stretch,
          spacing: 16,
          children: [
            _descriptionText(context),
            ...missingMethods.mapWithIndex(
              (method, i) => _DetailField(method: method, first: i == 0),
            ),
            _registerAllButton,
            _skipButton,
          ],
        );
      },
    );
  }
}

class _DetailField extends StatefulWidget {
  final AuthMethod method;
  final bool first;

  const _DetailField({required this.method, this.first = false});

  @override
  __DetailFieldState createState() => __DetailFieldState();
}

class __DetailFieldState extends State<_DetailField>
    with SingleTickerProviderStateMixin {
  late final BlocTextFieldController _controller;
  Timer? _debounceTimer;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _controller = BlocTextFieldController();
    _animationController = AnimationController(
      vsync: this,
      duration: FieldStateCompleted.removeDuration,
    );
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onTextChanged(FieldState newField) {
    final bloc = context.read<AuthBloc>();

    bloc.add(.updateField(field: widget.method.toField, value: newField));

    _debounceTimer?.cancel();
    if (newField.completed) return;

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      final currentState = bloc.state;
      final currentField = currentState.fields[widget.method]!;
      if (_checker(currentField) && !currentField.completed) {
        bloc.add(.checkDetail(widget.method));
      }
    });
  }

  bool _checker(FieldState? field) =>
      (field?.isValid ?? false) && !(field?.isLoading ?? true);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    final method = widget.method;

    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) => p.fields[method] != c.fields[method],
      builder: (context, state) {
        final field = state.fields[method];
        if (field == null) return const SizedBox();

        // Отменяем дебаунс, если поле удаляется или уже завершено
        if (field.removing || field.completed) {
          _debounceTimer?.cancel();
          _debounceTimer = null;
        }

        if (field.removing) _animationController.forward();

        // Анимированная обёртка для плавного исчезновения
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Opacity(
              opacity: field.removing ? 1.0 - _animationController.value : 1.0,
              child: SizeTransition(
                sizeFactor: field.removing
                    ? Tween<double>(
                        begin: 1.0,
                        end: 0.0,
                      ).animate(_animationController)
                    : const AlwaysStoppedAnimation(1.0),
                axisAlignment: -1.0,
                child: child,
              ),
            );
          },
          child: BlocTextField<AuthBloc, AuthState>(
            key: ValueKey(method.name),
            hintText: method.text,
            keyboardType: method.textInputType,
            inputFormatters: method.textInputFormatters,
            selector: (s) => s.fields[method] ?? const FieldState(),
            controller: _controller,
            onChanged: _onTextChanged,
            validator: method.validator,
            onFieldSubmitted: (_) =>
                bloc.add(.registerDetail(method: widget.method)),
            textInputAction: .done,
          ),
        );
      },
    );
  }
}
