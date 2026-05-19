part of 'guards.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (SessionService.registered) {
      /// Пользователь авторизован – пускаем
      resolver.next();
    } else {
      /// Не авторизован – уходим на авторизацию
      router.replace(const AuthRoute());
    }
  }
}

class AlreadyAuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (SessionService.registered) {
      /// Уже авторизован – идём на главный экран
      router.replace(const GroupsRoute());
    } else {
      /// Не авторизован – показываем форму входа
      resolver.next();
    }
  }
}