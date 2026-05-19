import 'package:co_stock/domain/notifications/snack/snack_notification.dart';

class SessionService {
  /// [registered] нужен для отслеживания был ли уже назначен [id], можем ли мы
  /// его получать
  /// Нужен для того, чтобы избавить от ручной проверки в большинсвте случаев
  /// использвания getter [id]
  static bool get registered => _id != null;
  static String? _id;

  /// Чтобы удостоверится, что этот getter не выкинет ошибку првоести проверку
  /// через getter [registered]
  static String get id {
    final id = _id;
    if(id == null) {
     final error = AppError.client(
        type: .state,
        error: Exception(
          'Почему то нет id в SessionService, но его пытаются получить',
        ),
        stackTrace: .current,
      );
     error.report();

     /// TODO[1]: Эту ошибку мы можем поймать и отправить на перерегистрацию
     /// Наверно имеет сысмл сделать отдельный сервис, который будет объединять
     /// такие случаи и будет иметь доступ к репозиториям/навигации/управлению всем приложением
     /// И тут мы должны вызвать этот сервис и через него попытаться получить
     /// данные о нашем пользователе, а если не получится - отправить нас на экран
     /// авторизации, показав что произошла ошибка
     throw error;
    }

    return id;
  }

  static set id(String? id) => _id = id;

  static void clear() => _id = null;
}
