// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [GroupsScreen]
class GroupsRoute extends PageRouteInfo<void> {
  const GroupsRoute({List<PageRouteInfo>? children})
    : super(GroupsRoute.name, initialChildren: children);

  static const String name = 'GroupsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GroupsScreen();
    },
  );
}

/// generated route for
/// [StockScreen]
class StockRoute extends PageRouteInfo<StockRouteArgs> {
  StockRoute({required String stockId, Key? key, List<PageRouteInfo>? children})
    : super(
        StockRoute.name,
        args: StockRouteArgs(stockId: stockId, key: key),
        initialChildren: children,
      );

  static const String name = 'StockRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StockRouteArgs>();
      return StockScreen(args.stockId, key: args.key);
    },
  );
}

class StockRouteArgs {
  const StockRouteArgs({required this.stockId, this.key});

  final String stockId;

  final Key? key;

  @override
  String toString() {
    return 'StockRouteArgs{stockId: $stockId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StockRouteArgs) return false;
    return stockId == other.stockId && key == other.key;
  }

  @override
  int get hashCode => stockId.hashCode ^ key.hashCode;
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({
    Key? key,
    required String? userName,
    PageRouteInfo<Object?>? nextRoute,
    required User? user,
    List<PageRouteInfo>? children,
  }) : super(
         WelcomeRoute.name,
         args: WelcomeRouteArgs(
           key: key,
           userName: userName,
           nextRoute: nextRoute,
           user: user,
         ),
         initialChildren: children,
       );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WelcomeRouteArgs>();
      return WelcomeScreen(
        key: args.key,
        userName: args.userName,
        nextRoute: args.nextRoute,
        user: args.user,
      );
    },
  );
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({
    this.key,
    required this.userName,
    this.nextRoute,
    required this.user,
  });

  final Key? key;

  final String? userName;

  final PageRouteInfo<Object?>? nextRoute;

  final User? user;

  @override
  String toString() {
    return 'WelcomeRouteArgs{key: $key, userName: $userName, nextRoute: $nextRoute, user: $user}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WelcomeRouteArgs) return false;
    return key == other.key &&
        userName == other.userName &&
        nextRoute == other.nextRoute &&
        user == other.user;
  }

  @override
  int get hashCode =>
      key.hashCode ^ userName.hashCode ^ nextRoute.hashCode ^ user.hashCode;
}
