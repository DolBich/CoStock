part of 'snack_notification.dart';

enum AuthSuccessType { login, registration, detailAdded, detailRemoved }
enum ServerSuccessType { dataLoaded, operationSuccess }
enum ClientSuccessType { actionCompleted }

@freezed
sealed class AppSuccess extends Snack with _$AppSuccess {
  const AppSuccess._();

  const factory AppSuccess.auth({required AuthSuccessType type, String? msg}) =
  _AuthSuccess;
  const factory AppSuccess.server(
      {required ServerSuccessType type, String? msg}) = _ServerSuccess;
  const factory AppSuccess.client(
      {required ClientSuccessType type, String? msg}) = _ClientSuccess;

  @override
  String get userMessage => when(
    auth: _authMessage,
    server: _serverMessage,
    client: _clientMessage,
  );

  @override
  void report() => SnackSuccess(this).report();

  String _authMessage(AuthSuccessType type, String? msg) {
    switch (type) {
      case AuthSuccessType.login:
        return 'Успешный вход';
      case AuthSuccessType.registration:
        return 'Регистрация прошла успешно';
      case AuthSuccessType.detailAdded:
        return 'Деталь добавлена';
      case AuthSuccessType.detailRemoved:
        return 'Деталь удалена';
    }
  }

  String _serverMessage(ServerSuccessType type, String? msg) {
    switch (type) {
      case ServerSuccessType.dataLoaded:
        return 'Данные загружены';
      case ServerSuccessType.operationSuccess:
        return 'Операция выполнена успешно';
    }
  }

  String _clientMessage(ClientSuccessType type, String? msg) {
    switch (type) {
      case ClientSuccessType.actionCompleted:
        return 'Действие выполнено';
    }
  }
}