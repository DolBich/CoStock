part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {

  /// Инициализация блока. Получение начального его состояния
  const factory AuthEvent.init() = _Init;

  /// Сменить режим регистрация/авторизация
  const factory AuthEvent.changeMode(AuthMode mode) = _ChangeMode;

  /// Сменить метод идентификации телефон/почта/логин
  const factory AuthEvent.changeMethod(AuthMethod method) = _ChangeMethod;

  /// Подтвердить идентификатор
  const factory AuthEvent.submitIdentifier() =
      _SubmitIdentifier;

  /// Подтвердить пароль
  const factory AuthEvent.submitPassword() = _SubmitPassword;

  /// Зарегистрировать деталь
  /// Внутри проводит проверку по типу [checkDetail], если не была проверена до этого
  const factory AuthEvent.registerDetail({
    required AuthMethod method,
  }) = _RegisterDetail;

  /// Обработка задействования поля идентификатора для перевода на этап идентификации
  const factory AuthEvent.toggleIdentifier() = _ToggleIdentifier;

  /// Смена имени
  const factory AuthEvent.changeName() = _ChangeName;

  /// Пропустить ввод деталей
  /// [dontAskAgain] устанавливает в локальном хранилище флаг, чтобы больше
  /// на этом устройстве не появлялось предложений для ввода деталей
  const factory AuthEvent.skipDetails({bool? dontAskAgain}) = _SkipDetails;

  /// Обновить значение нынешнего поле
  const factory AuthEvent.updateField({
    required AuthField field,
    required FieldState value,
  }) = _UpdateField;

  /// Проверить, что такое значение доступно для регистрации (например такая почта уже кем-то занята)
  const factory AuthEvent.checkDetail(AuthMethod method) = _CheckDetail;

  /// Зарегистрировать все детали, которые прошли местную валидацию
  /// Перед регистрацией деталь должна быть проверена через [checkDetail]
  const factory AuthEvent.registerAllDetails() = _RegisterAllDetails;

  /// После регистрации детали её надо убрать с экрана через этот метод
  /// Он запускает процесс удаления детали, через анимацию
  const factory AuthEvent.removeDetail(AuthMethod method) = _RemoveDetail;

  /// Это событие вызывается как окончание события [removeDetail]
  /// Используется только внутри самого bloc
  /// Начать имя с подчёркивания не получается из-за freezed
  const factory AuthEvent.removeDetailFinal(AuthMethod method) = _RemoveDetailFinal;

  /// Событие возврата назад через системные нажатия для навигации по этапам
  /// авторизации
  const factory AuthEvent.systemGoBack() = _SystemGoBack;

  /// Событие возврата назад через интерфейс приложения для навигации по этапам
  /// авторизации
  const factory AuthEvent.uiGoBack() = _UiGoBack;
}
