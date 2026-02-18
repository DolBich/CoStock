part of 'auth_screen.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  void _listener(BuildContext context, AuthState state) {
    if (state.step == AuthStep.authenticated) {
      context.router.replaceAll([MyHomeRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .all(24.0),
          child: Column(
            spacing: 16,
            children: [
              Flexible(flex: 1, child: _buildHeader(context)),
              Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  child: Align(
                    alignment: .topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: AnimatedSwitcher(
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
                        child: _buildFields(),
                      ),
                    ),
                  ),
                ),
              ),
              const _AuthModeSwitcher(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFields() {
    return  BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (p, c) => p.step != c.step,
      listener: _listener,
      buildWhen: (p, c) => p.step != c.step || p.isLoading != c.isLoading,
      builder: (context, state) {
        switch (state.step) {
          case .enterName:
            return const _EnterNameView(key: ValueKey('enterName'));
          case .enterIdentifier:
          case .enterPassword:
            return const _EnterIdentifierView(key: ValueKey('enterIdentifier'));
          case .registerDetails:
            return const _RegisterDetailsView(key: ValueKey('registerDetails'));
          case .authenticated:
            return const SizedBox.shrink(key: ValueKey('authenticated'));
        }
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

