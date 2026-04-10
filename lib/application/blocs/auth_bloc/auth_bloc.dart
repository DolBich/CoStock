import 'dart:async';
import 'dart:developer';

import 'package:async/async.dart';
import 'package:co_stock/application/handlers/event_transformers.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/application/managers/session_manager.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_field.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_mode.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_step.dart';
import 'package:co_stock/domain/bases/user.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final IAuthRepository _authRepository;

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

  final Map<AuthMethod, Timer> _removeTimers = {};

  Future<void> _onInit(_Init event, Emitter<AuthState> emit) async {
    final savedId = await LocalStorageService.getAuth();
    if (savedId == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final res = await _authRepository.getCurrentUser(id: savedId);

    await res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
      },
      (user) async {
        if (user.needDetails) {
          emit(
            state
                .fromUser(user)
                .copyWith(step: .registerDetails, isLoading: false),
          );
        } else {
          emit(state.authenticated(user));
        }
      },
    );
  }

  void _onChangeMode(_ChangeMode event, Emitter<AuthState> emit) {
    emit(
      state.resetValidation().copyWith(
        mode: event.mode,
        step: event.mode == .register ? .enterName : .enterIdentifier,
        user: null,
      ),
    );
  }

  void _onChangeMethod(_ChangeMethod event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        method: event.method,
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

  Future<void> _submitAuthIdentifier(Emitter<AuthState> emit) async {
    final identifier = state.identifier;
    if (identifier.isEmpty) {
      final f = AppError.client(
        type: .state,
        error: Exception('Identifier is empty'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withIdentifierError(f));
      return;
    }

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

  Future<void> _submitRegIdentifier(Emitter<AuthState> emit) async {
    final identifier = state.identifier;
    if (identifier.isEmpty) {
      final f = AppError.client(
        type: .state,
        error: Exception('Identifier is empty'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withIdentifierError(f));
      return;
    }

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

  Future<void> _submitAuthPassword(Emitter<AuthState> emit) async {
    final id = state.userId;
    if (id == null) {
      final f = AppError.client(
        type: .state,
        error: Exception('No user id'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withPasswordError(f));
      return;
    }

    final password = state.password;
    if (password.isEmpty) {
      final f = AppError.client(
        type: .state,
        error: Exception('Password is empty'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withPasswordError(f));
      return;
    }

    final res = await _authRepository.login(id: id, password: password);

    await res.fold(
      (f) {
        f.report();
        emit(state.withPasswordError(f));
      },
      (user) async {
        if (user.needDetails) {
          emit(
            state
                .withPasswordLoading(false)
                .fromUser(user)
                .copyWith(step: .registerDetails),
          );
        } else {
          emit(state.withPasswordLoading(false).authenticated(user));
        }
      },
    );
  }

  Future<void> _submitRegPassword(Emitter<AuthState> emit) async {
    final password = state.password;
    if (password.isEmpty) {
      final f = AppError.client(
        type: .state,
        error: Exception('Password is empty'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withPasswordError(f));
      return;
    }

    final user = state.toUser;
    if (!user.isValid) {
      final f = AppError.client(
        type: .state,
        error: Exception('User is invalid: [${user.toString()}]'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withPasswordError(f));
      return;
    }

    final res = await _authRepository.register(user);

    await res.fold(
      (f) {
        f.report();
        emit(state.withPasswordError(f));
      },
      (newId) async {
        final updatedUser = user.copyWith(id: newId);
        if (updatedUser.needDetails) {
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

  /// [restartableByKey] - при вызове второго события подряд он отменит первый
  /// Тут при отмене он просто отключает [Emitter]
  /// Т.е. мы получим ответ от репозитория, но не внедрим его в State
  /// [CancelableOperation] - обёртка для [CancelToken], чтобы через него
  /// отменить токен
  /// [CancelToken] - работает на уровне репозитория, если пришла отмена, то там
  /// проверяется [isCanceled] и не выполняет код, возвращает null (экономит трафик)
  final Map<AuthMethod, CancelableOperation> _cancelableOps = {};

  Future<void> _onRegisterDetail(
    _RegisterDetail event,
    Emitter<AuthState> emit,
  ) async {
    final userId = state.user?.id;
    if (userId == null) {
      final f = AppError.client(
        type: .state,
        error: Exception('[Auth 1] No user id'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withDetailError(event.method, f));
      return;
    }

    final field = state.fields[event.method];
    if (field == null) {
      final f = AppError.client(
        type: .state,
        error: Exception('[Auth 1] Не было найдено поле ввода'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withDetailError(event.method, f));
      return;
    }

    await _cancelableOps[event.method]?.cancel();

    final cancelToken = CancelToken();

    if (!field.isAvailable) {
      final operation = CancelableOperation.fromFuture(
        _checkAvailability(event.method, cancelToken, emit),
        onCancel: cancelToken.cancel,
      );
      _cancelableOps[event.method] = operation;
      final availability = await operation.valueOrCancellation();
      if (_cancelableOps[event.method] == operation) {
        _cancelableOps.remove(event.method);
      }

      if (!(availability ?? false)) return;
    }

    if (cancelToken.isCancelled) return;

    final operation = CancelableOperation.fromFuture(
      _performUpdate(event, emit, userId, cancelToken),
      onCancel: cancelToken.cancel,
    );

    _cancelableOps[event.method] = operation;
    await operation.valueOrCancellation();
    if (_cancelableOps[event.method] == operation) {
      _cancelableOps.remove(event.method);
    }
  }

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

    final detail = state.detail(method);
    final res = await _authRepository.updateDetail(
      method: method,
      detail: detail,
      id: userId,
      cancelToken: cancelToken,
    );

    if (cancelToken.isCancelled) {
      emit(state.withDetailLoading(method, false));
      return;
    }
    if (res == null) return; // отменено в репозитории

    res.fold(
      (f) {
        f.report();
        emit(state.withDetailError(method, f));
      },
      (_) {
        final user = state.user;
        if (user == null) {
          final f = AppError.client(
            type: .state,
            error: Exception('[Auth 2] No user'),
            stackTrace: StackTrace.current,
          );
          f.report();
          emit(state.withDetailError(method, f));
          return;
        }

        User updatedUser = user;
        if (method == .email) updatedUser = updatedUser.withEmail(detail);
        if (method == .phone) updatedUser = updatedUser.withPhone(detail);
        if (method == .login) updatedUser = updatedUser.withLogin(detail);

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

        _removeTimers[method]?.cancel();
        _removeTimers[method] = Timer(FieldStateCompleted.removeDelay, () {
          add(.removeDetail(method));
        });
      },
    );
  }

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

    /// Запускаем таймер на финальное удаление (длительность анимации)
    _removeTimers[event.method]?.cancel();
    _removeTimers[event.method] = Timer(FieldStateCompleted.removeDuration, () {
      add(.removeDetailFinal(event.method));
    });
  }

  void _onRemoveDetailFinal(_RemoveDetailFinal event, Emitter<AuthState> emit) {
    final finalFields = Map<AuthMethod, FieldState>.from(state.fields);
    finalFields.remove(event.method);

    emit(state.copyWith(fields: finalFields));
    _removeTimers.remove(event.method);
  }

  void _onToggleIdentifier(_ToggleIdentifier event, Emitter<AuthState> emit) {
    emit(state.copyWith(step: .enterIdentifier));
  }

  void _onChangeName(_ChangeName event, Emitter<AuthState> emit) {
    emit(state.copyWith(step: .enterIdentifier));
  }

  void _onSkipDetails(_SkipDetails event, Emitter<AuthState> emit) {
    closeRemoveTimers();
    closeCancelableOps();

    if (event.dontAskAgain ?? false) {
      final user = state.user;
      if (user == null) {
        final f = AppError.client(
          type: .state,
          error: Exception('[Auth 3] No user'),
          stackTrace: StackTrace.current,
        );
        f.report();
        return;
      }
      final res = _authRepository.updateUserSettings(
        id: user.id,
        settings: (user.settings ?? const UserSettings()).copyWith(
          dontAskDetails: event.dontAskAgain,
        ),
      );

      res.then((v) => v.fold((f) => f.report(), (_) {}));
    }

    emit(state.authenticated(state.user));
  }

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

  Future<void> _onCheckDetail(
    _CheckDetail event,
    Emitter<AuthState> emit,
  ) async {
    final userId = state.user?.id;
    if (userId == null) return;

    await _cancelableOps[event.method]?.cancel();

    final cancelToken = CancelToken();
    final operation = CancelableOperation.fromFuture(
      _checkAvailability(event.method, cancelToken, emit),
      onCancel: cancelToken.cancel,
    );

    _cancelableOps[event.method] = operation;

    final result = await operation.valueOrCancellation();

    if (_cancelableOps[event.method] == operation) {
      _cancelableOps.remove(event.method);
    }

    if (result == null) {
      /// Если операция отменена, сбрасываем загрузку
      final currentField = state.fields[event.method];
      if (currentField != null && currentField.isLoading) {
        emit(state.withDetailLoading(event.method, false));
      }
    }
  }

  Future<bool> _checkAvailability(
    AuthMethod method,
    CancelToken cancelToken,
    Emitter<AuthState> emit,
  ) async {
    final currentField = state.fields[method];
    if (currentField == null) {
      final f = AppError.client(
        type: .state,
        error: Exception('[Auth 2] Не было найдено поле ввода'),
        stackTrace: StackTrace.current,
      );
      f.report();
      emit(state.withDetailError(method, f));
      return false;
    }
    emit(state.withDetailLoading(method, true));

    final res = await _authRepository.checkRegAccount(
      method: method,
      identifier: currentField.value,
      cancelToken: cancelToken,
    );

    if (cancelToken.isCancelled) {
      emit(state.withDetailLoading(method, false));
      return false;
    }

    /// отменено в репозитории
    if (res == null) return false;

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

  void closeCancelableOps() {
    for (final op in _cancelableOps.values) {
      op.cancel();
    }
    _cancelableOps.clear();
  }

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
