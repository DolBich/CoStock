import 'dart:async';
import 'dart:developer';

import 'package:async/async.dart';
import 'package:co_stock/application/handlers/event_transformers.dart';
import 'package:co_stock/application/services/session_service.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_field.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_mode.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_step.dart';
import 'package:co_stock/domain/core/user/user.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'handlers/auth_error_handler.dart';

part 'auth_bloc.freezed.dart';

/// Блок аутентификации. Управляет всем процессом входа/регистрации, включая
/// проверку идентификатора, пароля, добавление деталей (email/phone/login) и
/// навигацию между шагами.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final IAuthRepository _authRepository;

  /// [restartableByKey] - при вызове второго события подряд он отменит первый
  AuthBloc() : super(.initial()) {
    on<_Init>(_onInit);
    on<_ChangeMode>(_onChangeMode);
    on<_ChangeMethod>(_onChangeMethod);
    on<_SubmitIdentifier>(_onSubmitIdentifier);
    on<_SubmitPassword>(_onSubmitPassword);
    on<_RegisterDetail>(
      _onRegisterDetail,
      transformer: restartableByKey((event) => event.method),
    );
    on<_ToggleIdentifier>(_onToggleIdentifier);
    on<_ChangeName>(_onChangeName);
    on<_SkipDetails>(_onSkipDetails);
    on<_UpdateField>(_onUpdateField);
    on<_CheckDetail>(
      _onCheckDetail,
      transformer: restartableByKey((e) => e.method),
    );
    on<_RegisterAllDetails>(_onRegisterAllDetails, transformer: droppable());
    on<_RemoveDetail>(_onRemoveDetail);
    on<_RemoveDetailFinal>(_onRemoveDetailFinal);
    on<_SystemGoBack>(_onSystemGoBack);
    on<_UiGoBack>(_onUiGoBack);

    _authRepository = InjectorManager().current.authRepository;
    add(const .init());
  }

  Future<void> _onInit(_Init event, Emitter<AuthState> emit) async {
    /// Проверяем идёт ли сейчас уже активная сессия (есть ли уже авторизация)
    final savedId = await LocalStorageService.getAuth();
    if (savedId == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    /// Получаем информацию от авторизованном аккаунте
    final res = await _authRepository.getCurrentUser(id: savedId);

    await res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
      },
      (user) async {
        if (user.needDetails) {
          /// Переводим на этап заполнения деталей, если нужно
          emit(
            state
                .fromUser(user)
                .copyWith(step: .registerDetails, isLoading: false),
          );
        } else {
          /// Иначе авторизовываем
          emit(state.authenticated(user));
        }
      },
    );
  }

  void _onChangeMode(_ChangeMode event, Emitter<AuthState> emit) {
    emit(
      state.resetValidation().copyWith(
        mode: event.mode,
        /// переводим на первый шаг режима
        step: event.mode == .register ? .enterName : .enterIdentifier,
        user: null,
      ),
    );
  }

  void _onChangeMethod(_ChangeMethod event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        method: event.method,
        /// Сбрасываем этап пароля, если взаимодействуем с идентификатором
        step: state.step == .enterPassword ? .enterIdentifier : state.step,
      ),
    );
  }

  Future<void> _onSubmitIdentifier(
    _SubmitIdentifier event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.withIdentifierLoading(true));

    if (state.mode == .login) {
      await _submitAuthIdentifier(emit);
    } else {
      await _submitRegIdentifier(emit);
    }
  }

  /// Подтверждение идентификатора при авторизации
  Future<void> _submitAuthIdentifier(Emitter<AuthState> emit) async {
    final identifier = state.identifier;
    if (identifier.isEmpty) {
      final f = _AuthErrorHandler.emptyIdentifier();
      emit(state.withIdentifierError(f));
      return;
    }

    /// Проверка на наличие аккаунта с таким идентификатором
    final res = await _authRepository.checkAuthAccount(
      method: state.method,
      identifier: identifier,
    );

    res.fold(
      (f) {
        f.report();
        emit(state.withIdentifierError(f));
      },
      (userId) {
        emit(
          state
              .withIdentifierLoading(false)
              .copyWith(userId: userId, step: .enterPassword),
        );
      },
    );
  }

  /// Подтверждение идентификатора при регистрации
  Future<void> _submitRegIdentifier(Emitter<AuthState> emit) async {
    final identifier = state.identifier;
    if (identifier.isEmpty) {
      final f = _AuthErrorHandler.emptyIdentifier();
      emit(state.withIdentifierError(f));
      return;
    }

    /// Проверка на отсутствие аккаунтов с таким идентификатором
    final res = await _authRepository.checkRegAccount(
      method: state.method,
      identifier: identifier,
    );

    res?.fold(
      (f) {
        f.report();
        emit(state.withIdentifierError(f));
      },
      (_) {
        emit(state.withIdentifierLoading(false).copyWith(step: .enterPassword));
      },
    );
  }

  /// Подтверждение пароля
  Future<void> _onSubmitPassword(
    _SubmitPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.withPasswordLoading(true));

    if (state.mode == .login) {
      await _submitAuthPassword(emit);
    } else {
      await _submitRegPassword(emit);
    }
  }

  /// Подтверждение пароля при авторизации
  Future<void> _submitAuthPassword(Emitter<AuthState> emit) async {
    final id = state.userId;
    if (id == null) {
      final f = _AuthErrorHandler.noId();
      emit(state.withPasswordError(f));
      return;
    }

    final password = state.password;
    if (password.isEmpty) {
      final f = _AuthErrorHandler.emptyPassword();
      emit(state.withPasswordError(f));
      return;
    }

    /// Вход в аккаунт
    final res = await _authRepository.login(id: id, password: password);

    await res.fold(
      (f) {
        f.report();
        emit(state.withPasswordError(f));
      },
      (user) async {
        if (user.needDetails) {
          /// Если нужны детали - переходим на их заполнение
          emit(
            state
                .withPasswordLoading(false)
                .fromUser(user)
                .copyWith(step: .registerDetails),
          );
        } else {
          /// Иначе авторизован
          emit(state.withPasswordLoading(false).authenticated(user));
        }
      },
    );
  }

  /// Регистрация аккаунта
  Future<void> _submitRegPassword(Emitter<AuthState> emit) async {
    final password = state.password;
    if (password.isEmpty) {
      final f = _AuthErrorHandler.emptyPassword();
      emit(state.withPasswordError(f));
      return;
    }

    final user = state.toUser;
    if (!user.isValid) {
      final f = _AuthErrorHandler.invalidUser(user);
      emit(state.withPasswordError(f));
      return;
    }

    /// Регистрация аккаунта
    final res = await _authRepository.register(user);

    await res.fold(
      (f) {
        f.report();
        emit(state.withPasswordError(f));
      },
      (newId) async {
        final updatedUser = user.copyWith(id: newId);
        if (updatedUser.needDetails) {
          /// Переходим на детали, если нужно
          emit(
            state
                .withPasswordLoading(false)
                .fromUser(updatedUser)
                .copyWith(step: .registerDetails),
          );
        } else {
          emit(state.withPasswordLoading(false).authenticated(user));
        }
      },
    );
  }

  /// [CancelableOperation] - обёртка для [CancelToken], чтобы через него
  /// отменить токен
  /// [CancelToken] - работает на уровне репозитория, если пришла отмена, то там
  /// проверяется [isCanceled] и не выполняет код, возвращает null (экономит трафик)
  /// [_cancelableOps] - мапа для отмены операций для разных методов идентификации
  /// Т.е. разные методы идентификации могут идти параллельно
  final Map<AuthMethod, CancelableOperation> _cancelableOps = {};

  /// Нам тут важен мкханизм отмены, поскольку это событие вызывается автоматически
  /// и пользователь легко может своими действиями вызвать последовательно несколько
  /// таких событий. Нам надо обработать только одно из них - последнее
  Future<void> _onRegisterDetail(
    _RegisterDetail event,
    Emitter<AuthState> emit,
  ) async {
    final userId = state.user?.id;
    if (userId == null) {
      final f = _AuthErrorHandler.noId();
      emit(state.withDetailError(event.method, f));
      return;
    }

    final field = state.fields[event.method];
    if (field == null) {
      final f = _AuthErrorHandler.noField();
      emit(state.withDetailError(event.method, f));
      return;
    }

    /// Отменяем предыдущую операцию отого метода авторизации
    /// Также должен сработать [restartableByKey], но он закрывает именно emit
    /// А сам код может продолжаться, поэтому надо в дополнение отменить так
    await _cancelableOps[event.method]?.cancel();

    /// Запускаем новую операцию с возможностью отмены
    /// Операция - проверка возможности зарегистрировать эту деталь
    /// Если до этой операции уже была проверка на возможность зарегистрировать
    /// [_onCheckDetail], то сразу идём к обновлению данных
    final cancelToken = CancelToken();
    if (!field.isAvailable) {
      final operation = CancelableOperation.fromFuture(
        _checkAvailability(event.method, cancelToken, emit),
        onCancel: cancelToken.cancel,
      );

      /// Добавляем эту операцию к списку отменяемых
      _cancelableOps[event.method] = operation;

      /// Ждём ответа от операции или её отмены
      final availability = await operation.valueOrCancellation();
      if (_cancelableOps[event.method] == operation) {
        _cancelableOps.remove(event.method);
      }

      /// Если нельзя зарегистрировать такое - просто выходим
      /// На экране у детали появится ошибка через метод [_checkAvailability]
      if (!(availability ?? false)) return;
    }

    /// Проверка на отмену
    if (cancelToken.isCancelled) return;

    /// Если не отменилось и можно регистрировать - регистрируем деталь
    final operation = CancelableOperation.fromFuture(
      _performUpdate(event, emit, userId, cancelToken),
      onCancel: cancelToken.cancel,
    );

    _cancelableOps[event.method] = operation;
    /// Ждём окончания операции или её отмены
    await operation.valueOrCancellation();
    /// Убираем операцию из списка операций
    if (_cancelableOps[event.method] == operation) {
      _cancelableOps.remove(event.method);
    }
  }

  /// Таймеры для убирания полей зарегестрированных деталей
  final Map<AuthMethod, Timer> _removeTimers = {};

  /// Осуществуляет обновление/регистрацию деталей
  Future<void> _performUpdate(
    _RegisterDetail event,
    Emitter<AuthState> emit,
    String userId,
    CancelToken cancelToken,
  ) async {
    final method = event.method;
    emit(state.withDetailLoading(method, true));

    if (cancelToken.isCancelled) {
      emit(state.withDetailLoading(method, false));
      return;
    }

    /// Обновляем деталь на сервере
    final detail = state.detail(method);
    final res = await _authRepository.updateDetail(
      method: method,
      detail: detail,
      id: userId,
      cancelToken: cancelToken,
    );

    /// Проверка на отмену
    if (cancelToken.isCancelled || res == null) {
      emit(state.withDetailLoading(method, false));
      return;
    }

    res.fold(
      (f) {
        f.report();
        emit(state.withDetailError(method, f));
      },
      (_) {
        final user = state.user;
        if (user == null) {
          final f = _AuthErrorHandler.noUser();
          emit(state.withDetailError(method, f));
          return;
        }

        /// Локальное обновление детали пользователя
        User updatedUser = user;
        if (method == .email) updatedUser = updatedUser.withEmail(detail);
        if (method == .phone) updatedUser = updatedUser.withPhone(detail);
        if (method == .login) updatedUser = updatedUser.withLogin(detail);

        /// Отмечаем успех на этом поле, чтобы показать на ui стороне
        /// что получилось зарегистрировать
        final currentField = state.fields[method]!;
        final updatedField = currentField.copyWith(
          isLoading: false,
          notification: const SnackSuccess(.auth(type: .registered)),
        );

        final newFields = Map<AuthMethod, FieldState>.from(state.fields);
        newFields[method] = updatedField;

        emit(
          state
              .withDetailLoading(method, false)
              .copyWith(user: updatedUser, fields: newFields),
        );

        /// После показа успеха регистрации поля запускаем процесс удаления этого
        /// поля, чтобы это больше там не мешалось
        /// Запускаем через [removeDelay] чтобы успеть показать [success]
        _removeTimers[method]?.cancel();
        _removeTimers[method] = Timer(FieldState.removeDelay, () {
          add(.removeDetail(method));
        });
      },
    );
  }

  /// Удаляет поле деталей после его регистрации и показа успеха регистрации
  void _onRemoveDetail(_RemoveDetail event, Emitter<AuthState> emit) {
    final fields = state.fields;

    /// Если это последняя деталь, то не ждём анимации удаления
    /// а сразу переходим на домашнюю страницу
    if (fields.length <= 1) {
      emit(state.authenticated(state.user));
      return;
    }
    final field = fields[event.method];
    if (field == null) return;
    if (field.removing) return;

    /// Переводим поле в состояние "удаляется"
    final updatedField = field.copyWith(removing: true, isLoading: false);
    final newFields = Map<AuthMethod, FieldState>.from(state.fields);
    newFields[event.method] = updatedField;
    emit(state.copyWith(fields: newFields));

    /// Запускаем таймер на финальное удаление также через время для того, чтобы
    /// за время [removeDuration] успела пройти анимация убирания поля, а затем уже
    /// оно было убрано здесь (без задержки анимация будет либо резкой, либо поле
    /// исчезнет во время анимации)
    _removeTimers[event.method]?.cancel();
    _removeTimers[event.method] = Timer(FieldState.removeDuration, () {
      add(.removeDetailFinal(event.method));
    });
  }

  /// Финальное удаление поле детали после регистрации, показа успеха и анимации
  /// исчезновения поля
  void _onRemoveDetailFinal(_RemoveDetailFinal event, Emitter<AuthState> emit) {
    final finalFields = Map<AuthMethod, FieldState>.from(state.fields);
    finalFields.remove(event.method);

    emit(state.copyWith(fields: finalFields));
    _removeTimers.remove(event.method);
  }

  /// При каком-либо взаимодействии с идентификатором - возвращаемся на этап
  /// идентификации
  void _onToggleIdentifier(_ToggleIdentifier event, Emitter<AuthState> emit) {
    emit(state.copyWith(step: .enterIdentifier));
  }

  /// Смена имени
  /// Просто переходим на следующий этап, имя уже записано в state
  void _onChangeName(_ChangeName event, Emitter<AuthState> emit) {
    emit(state.copyWith(step: .enterIdentifier));
  }

  /// Пропуск деталей, чтобы их не заполнять
  void _onSkipDetails(_SkipDetails event, Emitter<AuthState> emit) {
    /// Отменяем все операции и анимации
    closeRemoveTimers();
    closeCancelableOps();

    /// Флаг для того, чтобы больше никогда не напоминать пользователю о заполнении
    /// деталей
    if (event.dontAskAgain ?? false) {
      final user = state.user;
      if (user == null) {
        _AuthErrorHandler.noUser();
        return;
      }

      /// Обновление настроек аккаунта на сервере, чтобы на других устройствах
      /// для этого аккаунта также не просились детали больше
      final res = _authRepository.updateUserSettings(
        id: user.id,
        settings: (user.settings ?? const UserSettings()).copyWith(
          dontAskDetails: event.dontAskAgain,
        ),
      );

      res.then((v) => v.fold((f) => f.report(), (_) {}));
    }

    /// После деталей мы считаемся авторизованными
    emit(state.authenticated(state.user));
  }

  /// Универсальный метод обновления состояния любого поля
  void _onUpdateField(_UpdateField event, Emitter<AuthState> emit) {
    final newField = event.value;

    switch (event.field) {
      case .name:
        emit(state.copyWith(nameField: newField));
        break;
      case .password:
        emit(state.copyWith(passwordField: newField));
        break;
      case .identifier:
        final newFields = Map<AuthMethod, FieldState>.from(state.fields);
        newFields[state.method] = newField;

        final newStep = state.step == .enterPassword
            ? AuthStep.enterIdentifier
            : state.step;
        emit(state.copyWith(fields: newFields, step: newStep));
        break;
      case .email:
      case .phone:
      case .login:
        final method = event.field.toMethod;
        if (method == null) return;

        final currentField = state.fields[method];
        if (currentField != null && currentField.completed) return;

        final newFields = Map<AuthMethod, FieldState>.from(state.fields);
        newFields[method] = newField;
        _cancelableOps[method]?.cancel();
        emit(state.copyWith(fields: newFields));
        break;
    }
  }

  /// Проверка на возможность зарегистрировать эту деталь
  /// Нет ли уже другого аккаунта с такими данными
  Future<void> _onCheckDetail(
    _CheckDetail event,
    Emitter<AuthState> emit,
  ) async {
    final userId = state.user?.id;
    if (userId == null) {
      _AuthErrorHandler.noId();
      return;
    }

    /// Отменяем предыдущую операцию отого метода авторизации
    /// Также должен сработать [restartableByKey], но он закрывает именно emit
    /// А сам код может продолжаться, поэтому надо в дополнение отменить так
    await _cancelableOps[event.method]?.cancel();

    /// Запускаем новую операцию с возможностью отмены
    /// Операция - проверка возможности зарегистрировать эту деталь
    /// Флаг на [isAvailable] будем поставлен внутри самой операции
    final cancelToken = CancelToken();
    final operation = CancelableOperation.fromFuture(
      _checkAvailability(event.method, cancelToken, emit),
      onCancel: cancelToken.cancel,
    );

    /// Добавляем эту операцию к списку отменяемых
    _cancelableOps[event.method] = operation;

    /// Ждём ответа от операции или её отмены
    final result = await operation.valueOrCancellation();
    if (_cancelableOps[event.method] == operation) {
      _cancelableOps.remove(event.method);
    }

    if (operation.isCanceled || result == null) {
      /// Если операция отменена, сбрасываем загрузку
      final currentField = state.fields[event.method];
      if (currentField != null && currentField.isLoading) {
        emit(state.withDetailLoading(event.method, false));
      }
    }
  }

  /// Проверяет можно ли зарегистрировать эту деталь
  /// Выставляет на деталь флг
  Future<bool> _checkAvailability(
    AuthMethod method,
    CancelToken cancelToken,
    Emitter<AuthState> emit,
  ) async {
    final currentField = state.fields[method];
    if (currentField == null) {
      final f = _AuthErrorHandler.noField();
      emit(state.withDetailError(method, f));
      return false;
    }
    emit(state.withDetailLoading(method, true));

    final res = await _authRepository.checkRegAccount(
      method: method,
      identifier: currentField.value,
      cancelToken: cancelToken,
    );

    /// Отменено в репозитории
    if (cancelToken.isCancelled || res == null) {
      emit(state.withDetailLoading(method, false));
      return false;
    }

    /// Устанавливаем доступ в состоянии и возвращаем для дальнейших манипуляцией
    /// с этой информацией
    final availability = res.fold(
      (f) {
        emit(state.withDetailError(method, f));
        return false;
      },
      (_) {
        emit(state.withDetailSuccess(method, const .auth(type: .available)));
        return true;
      },
    );

    return availability;
  }

  /// Метод для регистрации всех уже проверенных деталей
  void _onRegisterAllDetails(
    _RegisterAllDetails event,
    Emitter<AuthState> emit,
  ) {
    final availableMethods = state.fields.entries
        .where((entry) => entry.value.isAvailable)
        .map((entry) => entry.key)
        .toList();

    if (availableMethods.isEmpty) return;

    for (final method in availableMethods) {
      add(.registerDetail(method: method));
    }
  }

  /// Отменить все операции
  void closeCancelableOps() {
    for (final op in _cancelableOps.values) {
      op.cancel();
    }
    _cancelableOps.clear();
  }

  /// Отмена всех анимаций закрытия
  void closeRemoveTimers() {
    for (final timer in _removeTimers.values) {
      timer.cancel();
    }
    _removeTimers.clear();
  }

  /// Возвращение назад, вызванное нажатием системной кнопки
  /// Подразумевает возврат на предыдущий шаг
  FutureOr<void> _onSystemGoBack(_SystemGoBack event, Emitter<AuthState> emit) async {
    if (state.step == .registerDetails || state.step == .authenticated) {
      /// После ввода пароля мы блокируем возврат через интерфейс и через
      /// системный нажатия (дальше только вперёд)
      return;
    }

    final prevStep = state.previousStep;
    if (prevStep != null) {
      emit(state.copyWith(step: prevStep));
    }
  }

  /// Возвращение назад, вызванное нажатием отрисованной в UI кнопки
  /// Подразумевает возврат на предыдущую страницу
  FutureOr<void> _onUiGoBack(_UiGoBack event, Emitter<AuthState> emit) async {
    if (state.step == .registerDetails || state.step == .authenticated) {
      /// После ввода пароля мы блокируем возврат через интерфейс и через
      /// системный нажатия (дальше только вперёд)
      return;
    }

    final prevStep = state.previousScreen;
    if (prevStep != null) {
      emit(state.copyWith(step: prevStep));
    }
  }

  @override
  Future<void> close() async {
    closeCancelableOps();
    closeRemoveTimers();

    super.close();
  }
}
