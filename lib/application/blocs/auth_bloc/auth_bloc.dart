import 'package:async/async.dart';
import 'package:co_stock/application/handlers/event_transformers.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/domain/bases/cancel_token.dart';
import 'package:co_stock/domain/bases/session_manager.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_field.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_mode.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_step.dart';
import 'package:co_stock/domain/screens_entities/user_screen/user.dart';
import 'package:co_stock/domain/widget_entities/field_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
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
    on<_TrySubmit>(_onTrySubmit);
    on<_RegisterAllDetails>(
      _onRegisterAllDetails,
      transformer: droppable(),
    );

    _authRepository = InjectorManager().current.authRepository;
    add(const .init());
  }

  Future<void> _onInit(_Init event, Emitter<AuthState> emit) async {
    final savedId = await LocalStorageService.getAuth();
    if (savedId == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final res = await _authRepository.getCurrentUser(id: savedId);

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
      },
      (user) {
        if (user.needDetails) {
          emit(
            state
                .fromUser(user)
                .copyWith(step: .registerDetails, isLoading: false),
          );
        } else {
          emit(
            state.copyWith(user: user, step: .authenticated, isLoading: false),
          );
        }
      },
    );
  }

  void _onChangeMode(_ChangeMode event, Emitter<AuthState> emit) {
    final newFields = state.resetFields();

    emit(
      state.copyWith(
        mode: event.mode,
        step: event.mode == .register ? .enterName : .enterIdentifier,
        fields: newFields,
        passwordField: const FieldState(),
        nameField: const FieldState(),
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
    final res = await _authRepository.checkAuthAccount(
      method: state.method,
      identifier: state.identifier,
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
    final res = await _authRepository.checkRegAccount(
      method: state.method,
      identifier: state.identifier,
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
      const f = AppError.client(type: .state, msg: 'No user id');
      f.report();
      emit(state.withPasswordError(f));
      return;
    }

    final res = await _authRepository.login(id: id, password: state.password);

    res.fold(
      (f) {
        f.report();
        emit(state.withPasswordError(f));
      },
      (user) {
        LocalStorageService.saveAuth(user.id);
        SessionManager.id = user.id;

        if (user.needDetails) {
          emit(
            state
                .withPasswordLoading(false)
                .fromUser(user)
                .copyWith(step: .registerDetails),
          );
        } else {
          emit(
            state
                .withPasswordLoading(false)
                .copyWith(user: user, step: .authenticated),
          );
        }
      },
    );
  }

  Future<void> _submitRegPassword(Emitter<AuthState> emit) async {
    final user = state.toUser;
    if (!user.isValid) {
      const f = AppError.client(type: .state, msg: 'User is invalid');
      f.report();
      emit(state.withPasswordError(f));
      return;
    }

    final res = await _authRepository.register(user);

    res.fold(
      (f) {
        f.report();
        emit(state.withPasswordError(f));
      },
      (newId) {
        LocalStorageService.saveAuth(newId);
        SessionManager.id = user.id;

        final updatedUser = user.changeId(newId);
        if (updatedUser.needDetails) {
          emit(
            state
                .withPasswordLoading(false)
                .fromUser(updatedUser)
                .copyWith(step: .registerDetails),
          );
        } else {
          emit(
            state
                .withPasswordLoading(false)
                .copyWith(user: updatedUser, step: .authenticated),
          );
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
      const f = AppError.client(type: .state, msg: '[Auth 1] No user id');
      f.report();
      emit(state.withDetailError(event.method, f));
      return;
    }

    final field = state.fields[event.method];
    if (field == null) {
      const f = AppError.client(
        type: .state,
        msg: '[Auth 1] Не было найдено поле ввода',
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
    emit(state.withDetailLoading(event.method, true));

    final detail = state.detail(event.method);
    final res = await _authRepository.updateDetail(
      method: event.method,
      detail: detail,
      id: userId,
      cancelToken: cancelToken,
    );

    if (cancelToken.isCancelled) return;
    if (res == null) return; // отменено в репозитории

    res.fold(
      (f) {
        f.report();
        emit(state.withDetailError(event.method, f));
      },
      (_) {
        final user = state.user;
        if (user == null) {
          const f = AppError.client(type: .state, msg: '[Auth 2] No user');
          f.report();
          emit(state.withDetailError(event.method, f));
          return;
        }

        final updatedUser = user.copyWith(
          email: event.method == .email ? some(detail) : null,
          phone: event.method == .phone ? some(detail) : null,
          login: event.method == .login ? some(detail) : null,
        );

        final newFields = Map<AuthMethod, FieldState>.from(state.fields)
          ..remove(event.method);

        final nextStep = newFields.isEmpty
            ? AuthStep.authenticated
            : AuthStep.registerDetails;

        emit(
          state
              .withDetailLoading(event.method, false)
              .copyWith(user: updatedUser, fields: newFields, step: nextStep),
        );
      },
    );
  }

  void _onToggleIdentifier(_ToggleIdentifier event, Emitter<AuthState> emit) {
    emit(state.copyWith(step: .enterIdentifier));
  }

  void _onChangeName(_ChangeName event, Emitter<AuthState> emit) {
    emit(state.copyWith(step: .enterIdentifier));
  }

  void _onSkipDetails(_SkipDetails event, Emitter<AuthState> emit) {
    for (final op in _cancelableOps.values) {
      op.cancel();
    }
    _cancelableOps.clear();

    emit(state.copyWith(step: .authenticated));
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

    await operation.valueOrCancellation();

    if (_cancelableOps[event.method] == operation) {
      _cancelableOps.remove(event.method);
    }
  }

  Future<bool> _checkAvailability(
    AuthMethod method,
    CancelToken cancelToken,
    Emitter<AuthState> emit,
  ) async {
    final currentField = state.fields[method];
    if (currentField == null) {
      const f = AppError.client(
        type: .state,
        msg: '[Auth 2] Не было найдено поле ввода',
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

    if (cancelToken.isCancelled) return false;
    if (res == null) return false; // отменено в репозитории

    final availability = res.fold(
      (f) {
        f.report();
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

  void _onTrySubmit(_TrySubmit event, Emitter<AuthState> emit) {
    final showPassword = state.step == .enterPassword;

    final identifierField = state.fields[state.method];
    if (identifierField == null) {
      const f = AppError.client(
        type: .state,
        msg: '[Auth 1] Не получается найти идентификатор',
      );
      f.report();
      emit(state.withDetailError(state.method, f));
      return;
    }
    final validatedId = identifierField.validateFinal();

    // Валидируем поле пароля, если нужно
    FieldState? validatedPass;
    if (showPassword) {
      validatedPass = state.passwordField.validateFinal();
    }

    // Обновляем поля, если они изменились
    bool needUpdate = false;
    final updatedFields = Map.of(state.fields);
    if (validatedId != identifierField) {
      updatedFields[state.method] = validatedId;
      needUpdate = true;
    }
    if (validatedPass != null && validatedPass != state.passwordField) {
      needUpdate = true;
    }

    if (needUpdate) {
      emit(
        state.copyWith(
          fields: updatedFields,
          passwordField: validatedPass ?? state.passwordField,
        ),
      );
    }

    if (!validatedId.hasError) {
      if (showPassword && !(validatedPass?.hasError ?? true)) {
        add(const .submitPassword());
      } else {
        add(const .submitIdentifier());
      }
    }
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

  @override
  Future<void> close() async {
    for (final op in _cancelableOps.values) {
      op.cancel();
    }
    _cancelableOps.clear();

    super.close();
  }
}
