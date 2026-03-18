part of '../auth_screen.dart';

class _RegisterDetailsView extends StatelessWidget {
  const _RegisterDetailsView({super.key});

  Widget get _skipButton {
    return Builder(
      builder: (context) {
        return OutlinedButton(
          onPressed: () {
            final bloc = context.read<AuthBloc>();
            bloc.add(const .skipDetails());
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
            ...missingMethods.mapWithIndex((method, i) => _DetailField(method: method, first: i == 0,)),
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

class __DetailFieldState extends State<_DetailField> {
  late final BlocTextFieldController _controller;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller = BlocTextFieldController();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(FieldState newField) {
    final bloc = context.read<AuthBloc>();

    bloc.add(.updateField(field: widget.method.toField, value: newField));

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      final currentState = bloc.state;
      final currentField = currentState.fields[widget.method]!;
      if (_checker(currentField)) {
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
      buildWhen: (p, c) => p.fields.length != c.fields.length,
      builder: (context, state) {

        /// Эта заглушка спасает нас от бага срабатывания onChange
        /// от [s.fields[method] ?? const FieldState()] при определении
        /// missing fields для details
        if(state.fields[method] == null) return const SizedBox();

        return BlocTextField<AuthBloc, AuthState>(
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
        );
      },
    );
  }
}
