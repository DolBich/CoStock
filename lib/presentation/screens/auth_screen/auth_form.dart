part of 'auth_screen.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  void _listener(BuildContext context, AuthState state) {
    if (state.step == .authenticated) {
      context.router.replaceAll([
        WelcomeRoute(userName: state.user?.name, user: state.user),
      ]);
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

  /// Отслеживаем появление/исчезновение клавиатуры для анимации на логотипе
  bool _isKeyboardVisible = false;
  late StreamSubscription _keyboardVisibilitySubscription;

  @override
  void initState() {
    /// Подписка на изменение видимости клавиатуры
    _keyboardVisibilitySubscription = KeyboardVisibilityController().onChange
        .listen((isVisible) {
          setState(() => _isKeyboardVisible = isVisible);
        });
    super.initState();
  }

  @override
  void dispose() {
    _keyboardVisibilitySubscription.cancel();
    super.dispose();
  }

  /// Время анимации перехода логотипа из тела в шапку и обратно
  /// А также анимация смены форм данных
  static const Duration _animationDuration = Duration(milliseconds: 300);

  /// Анимированный логотип в шапке с появлением/исчезновением из-за клавиатуры
  Widget _title(BuildContext context) {
    return AnimatedSwitcher(
      duration: _animationDuration,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: .zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: _isKeyboardVisible
          ? _buildLogo(context, inAppBar: true)
          : const SizedBox.shrink(key: ValueKey('AppBarEmpty')),
    );
  }

  /// Высота логотипа в теле
  static const double _bodyLogoHeight = 100;

  /// Анимированный логотип в теле с появлением/исчезновением из-за клавиатуры
  Widget _buildBodyLogo(BuildContext context) {
    return AnimatedSwitcher(
      duration: _animationDuration,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: _isKeyboardVisible
          ? const SizedBox.shrink(key: ValueKey('empty'))
          : Container(
        key: const ValueKey('logo'),
        height: _bodyLogoHeight,
        padding: const .only(bottom: 8.0),
        alignment: .center,
        child: _buildLogo(context, inAppBar: false),
      ),
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          axis: .vertical,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
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
          title: _title(context),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const .only(left: 24.0, right: 24.0, top: 12),
            child: SingleChildScrollView(
              child: Column(
                spacing: 4,
                children: [
                  /// Построение логотипа в теле
                  _buildBodyLogo(context),

                  /// Форма для заполнения данными
                  Align(
                    alignment: .topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: _buildFields(),
                    ),
                  ),

                  /// Для смены регистрации/авторизации/забыл пароль
                  const _AuthModeSwitcher(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Построение форм для заполнения данными на каждом из этапов
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
          duration: _animationDuration,
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

  /// Построение логотипа в двух вариантах расстановки его состовляющих
  Widget _buildLogo(BuildContext context, {required bool inAppBar}) {
    return inAppBar
        ? Row(
            key: const ValueKey('InAppBar'),
            mainAxisAlignment: .center,
            spacing: 4,
            children: _logoChildren(context),
          )
        : Column(
            key: const ValueKey('InBody'),
            mainAxisAlignment: .center,
            spacing: 4,
            children: _logoChildren(context),
          );
  }

  /// Построение отдельных элементов логотипа
  List<Widget> _logoChildren(BuildContext context) {
    return [
      Flexible(
        child: Image.asset(
          'assets/images/logos/co_stock_logo.png',
          errorBuilder: (_, _, _) => const SizedBox.shrink(),
        ),
      ),
      RichText(
        textAlign: .center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            const TextSpan(
              text: 'Order in your stock. ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'No clutter.',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    ];
  }
}
