part of '../auth_screen.dart';

class _RegisterDetailsView extends StatelessWidget {
  const _RegisterDetailsView({super.key});

  Widget get _skipButton {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (context, state) {
        return OutlinedButton(
          onPressed: state.isLoading
              ? null
              : () {
                  final bloc = context.read<AuthBloc>();
                  bloc.add(const .skipDetails());
                },
          child: const Text('Skip'),
        );
      },
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
            ...missingMethods.map((method) => _DetailField(method: method)),
            _skipButton,
          ],
        );
      },
    );
  }
}

class _DetailField extends StatefulWidget {
  final AuthMethod method;

  const _DetailField({required this.method});

  @override
  __DetailFieldState createState() => __DetailFieldState();
}

class __DetailFieldState extends State<_DetailField> {
  final _focusNode = FocusNode();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _trySubmit();
    }
  }

  /// Проверяет, можно ли отправить запрос, и если да — отправляет.
  void _trySubmit() {
    final bloc = context.read<AuthBloc>();
    final state = bloc.state;
    final field = state.fields[widget.method] ?? const FieldState();

    if (_checker(state, field)) {
      bloc.add(.registerDetail(method: widget.method));
    }
  }

  void _onTextChanged(FieldState newField) {
    final bloc = context.read<AuthBloc>();

    bloc.add(.updateField(field: widget.method.toField, value: newField));

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      final currentState = context.read<AuthBloc>().state;
      final currentField = currentState.fields[widget.method]!;
      if (_checker(currentState, currentField)) {
        bloc.add(.registerDetail(method: widget.method));
      }
    });
  }

  bool _checker(AuthState state, FieldState? field) =>
      (field?.isValid ?? false) && !(field?.isLoading ?? true);

  @override
  Widget build(BuildContext context) {
    final method = widget.method;
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) =>
          p.fields[method] != c.fields[method] ||
          p.fields.length != c.fields.length,
      builder: (context, state) {
        return BlocTextField<AuthBloc, AuthState>(
          hintText: method.text,
          keyboardType: method.textInputType,
          inputFormatters: method.textInputFormatters,
          selector: (s) => s.fields[method] ?? const FieldState(),
          onChanged: _onTextChanged,
          instantValidator: method.getInstantValidator,
          finalValidator: method.getFinalValidator,
          focusNode: _focusNode,
          onFieldSubmitted: (_) => _trySubmit(),
          textInputAction: .done,
        );
      },
    );
  }
}
