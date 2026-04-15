import 'dart:async';

import 'package:co_stock/application/blocs/profile_bloc/profile_bloc.dart';
import 'package:co_stock/domain/bases/user.dart';
import 'package:co_stock/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Эта страница послужит нам заглушкой при входе в приложение.
/// На этой странице мы должны запустить подгрузку всех основных данных.
@RoutePage()
class WelcomeScreen extends StatefulWidget {
  final String? userName;
  final PageRouteInfo nextRoute;

  /// Дополнительные данные для подгрузки
  final User? user;

  WelcomeScreen({
    super.key,
    required this.userName,
    PageRouteInfo ? nextRoute,
    required this.user,
  }) : nextRoute = nextRoute ?? MyHomeRoute();

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Timer? _forceTransitionTimer;
  final Stopwatch _stopwatch = Stopwatch();
  bool _isLoadingComplete = false;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();

    final profileBloc = context.read<ProfileBloc>();

    /// Запускаем загрузку данных
    Future.wait([
      profileBloc.waitForInit(user: widget.user)
    ]).then((_) {
      if (mounted) {
        setState(() {
          _isLoadingComplete = true;
        });
        _tryTransition();
      }
    });

    /// Устанавливаем таймер на 5 секунд (максимальное ожидание)
    _forceTransitionTimer = Timer(const Duration(seconds: 5), () {
      if (mounted && !_hasNavigated) {
        _navigateToNext();
      }
    });
  }

  void _tryTransition() {
    if (_hasNavigated) return;
    if (!_isLoadingComplete) return;

    final elapsed = _stopwatch.elapsedMilliseconds;
    final remaining = 2000 - elapsed; /// минимальное время показа 2 секунды

    if (remaining <= 0) {
      _navigateToNext();
    } else {
      /// Ждём оставшееся время, но не больше, чем до срабатывания форс-таймера
      Future.delayed(Duration(milliseconds: remaining), () {
        if (mounted && !_hasNavigated) {
          _navigateToNext();
        }
      });
    }
  }

  void _navigateToNext() {
    if (_hasNavigated) return;
    _hasNavigated = true;
    _forceTransitionTimer?.cancel();
    context.router.replaceAll([widget.nextRoute]);
  }

  @override
  void dispose() {
    _forceTransitionTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Добро пожаловать,',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              widget.userName ?? 'Гость',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
                      ],
        ),
      ),
    );
  }
}