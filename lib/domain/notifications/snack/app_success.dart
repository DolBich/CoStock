part of 'snack_notification.dart';

/// Виды успехов авторизации
enum AuthSuccessType {
  /// Доступно для регистрации
  available,
  /// Получилось зарегистрировать
  registered
}

/// Уведомление об успехе
@freezed
sealed class AppSuccess extends Snack with _$AppSuccess {
  const AppSuccess._();

  const factory AppSuccess.auth({required AuthSuccessType type, String? msg}) =
      _AuthSuccess;

  @override
  String get userMessage => when(auth: _authMessage);

  @override
  String get devMessage => userMessage;

  @override
  void report() => SnackSuccess(this).report();

  @override
  void log() => SnackSuccess(this).log();

  /// Пользовательские сообщения об успехе авторизации
  String _authMessage(AuthSuccessType type, String? msg) {
    switch (type) {
      case AuthSuccessType.available:
        return 'Доступно для регистрации';
      case AuthSuccessType.registered:
        return 'Успешно зарегистрировано';
    }
  }
}
