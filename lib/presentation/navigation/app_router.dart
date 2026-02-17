import 'package:auto_route/auto_route.dart';
import 'package:co_stock/presentation/screens/some_screen/some_screen_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyHomeRoute.page, initial: true),
  ];
}