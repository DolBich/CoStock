part of 'auth_screen.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  void _listener(BuildContext context, AuthState state) {
    if (state.step == .authenticated) {
      context.router.replaceAll([WelcomeRoute(userName: state.user?.name, user: state.user)]);
    }
  }

  void _onPop(BuildContext context, bool didPop) {
    if (!didPop) {
      final bloc = context.read<AuthBloc>();
      final state = bloc.state;
      final prevStep = state.previousStep;
      if (prevStep != null) {
        bloc.add(const .systemGoBack());
      } else if (state.isFirstStep) {
        SystemNavigator.pop();
      }
    }
  }

  Widget get _leading {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (p, c) => p.step != c.step || p.mode != c.mode,
      builder: (context, state) {
        final prevStep = state.previousStep;
        if (prevStep == null) return const SizedBox.shrink();
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<AuthBloc>().add(const .uiGoBack());
          },
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      /// [canPop: false] не даёт системному назад автоматически закрыть
      /// страницу. Закрытие в ручную обрабатываем в [_onPop]
      canPop: false,
      onPopInvokedWithResult: (didPop, _) => _onPop(context, didPop),
      child: Scaffold(
        appBar: AppBar(
          leading: _leading,
        ),
        body: SafeArea(
          child: Padding(
            padding: const .only(left: 24.0, right: 24.0, top: 12),
            child: Column(
              spacing: 4,
              children: [
                Flexible(flex: 2, child: _buildHeader(context)),
                Flexible(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: .topCenter,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: _buildFields(),
                      ),
                    ),
                  ),
                ),
                const _AuthModeSwitcher(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFields() {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (p, c) => p.step != c.step,
      listener: _listener,
      buildWhen: (p, c) => p.step != c.step || p.isLoading != c.isLoading,
      builder: (context, state) {
        final Widget fields;
        switch (state.step) {
          case .enterName:
            fields = const _EnterNameView(key: ValueKey('enterName'));
          case .enterIdentifier:
          case .enterPassword:
            fields = const _EnterIdentifierView(
              key: ValueKey('enterIdentifier'),
            );
          case .registerDetails:
            fields = const _RegisterDetailsView(
              key: ValueKey('registerDetails'),
            );
          case .authenticated:
            fields = const SizedBox.shrink(key: ValueKey('authenticated'));
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0.0),
                  end: .zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: fields,
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      spacing: 16,
      children: [
        Flexible(
          child: Image.asset(
            'assets/images/logos/co_stock_logo.png',
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              const TextSpan(
                text: 'Order in your stock. ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'No clutter.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
