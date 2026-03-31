part of 'guards.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (SessionManager.id != null) {
      // Пользователь авторизован – пускаем
      resolver.next();
    } else {
      // Не авторизован – уходим на авторизацию
      router.replace(const AuthRoute());
    }
  }
}

class AlreadyAuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (SessionManager.id != null) {
      // Уже авторизован – идём на главный экран
      router.replace(MyHomeRoute());
    } else {
      // Не авторизован – показываем форму входа
      resolver.next();
    }
  }
}