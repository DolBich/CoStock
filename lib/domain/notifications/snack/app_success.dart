part of 'snack_notification.dart';

enum AuthSuccessType { available, registered, }


@freezed
sealed class AppSuccess extends Snack with _$AppSuccess {
  const AppSuccess._();

  const factory AppSuccess.auth({required AuthSuccessType type, String? msg}) =
  _AuthSuccess;

  @override
  String get userMessage => when(
    auth: _authMessage,
  );

  @override
  void report() => SnackSuccess(this).report();

  String _authMessage(AuthSuccessType type, String? msg) {
    switch (type) {
      case AuthSuccessType.available:
        return 'Доступно для регистрации';
      case AuthSuccessType.registered:
        return 'Успешно зарегистрировано';
    }
  }
}