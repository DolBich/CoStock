import 'package:auto_route/auto_route.dart';
import 'package:co_stock/presentation/navigation/guards/guards.dart';
import 'package:co_stock/presentation/screens/auth_screen/auth_screen.dart';
import 'package:co_stock/presentation/screens/some_screen/some_screen_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyHomeRoute.page, path: '/home').guarded,
    AutoRoute(
      page: AuthRoute.page,
      path: '/auth',
      initial: true,
      guards: [AlreadyAuthGuard()],
    ),
  ];
}

extension AutoRouteGuardExtension on AutoRoute {
  AutoRoute get guarded => copyWith(guards: [AuthGuard()]);
}
