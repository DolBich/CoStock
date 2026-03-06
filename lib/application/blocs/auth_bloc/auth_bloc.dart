import 'dart:developer';

import 'package:async/async.dart';
import 'package:co_stock/application/handlers/event_transformers.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/domain/bases/cancel_token.dart';
import 'package:co_stock/domain/bases/session_manager.dart';
import 'package:co_stock/domain/errors/error_manager.dart';
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

  AuthBloc() : super(AuthState.initial()) {
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

    _authRepository = InjectorManager().current.authRepository;
    add(const AuthEvent.init());
  }

  Future<void> _onInit(_Init event, Emitter<AuthState> emit) async {
    final savedId = await LocalStorageService.getAuth();
    if (savedId == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    final result = await _authRepository.getCurrentUser(id: savedId);
    result.fold(
      (failure) {
        ErrorManager().reportError(failure);
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
        step: event.mode == AuthMode.register
            ? AuthStep.enterName
            : AuthStep.enterIdentifier,
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

    if (state.mode == AuthMode.login) {
      await _submitAuthIdentifier(emit);
    } else {
      await _submitRegIdentifier(emit);
    }
  }

  Future<void> _submitAuthIdentifier(Emitter<AuthState> emit) async {
    final result = await _authRepository.checkAuthAccount(
      method: state.method,
      identifier: state.identifier,
    );

    result.fold(
      (failure) {
        ErrorManager().reportError(failure);
        emit(state.withIdentifierError(failure.userMessage));
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
    final result = await _authRepository.checkRegAccount(
      method: state.method,
      identifier: state.identifier,
    );

    result.fold(
      (failure) {
        ErrorManager().reportError(failure);
        emit(state.withIdentifierError(failure.userMessage));
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
      ErrorManager().reportError(
        const .client(type: .state, msg: 'No user id'),
      );
      emit(state.withPasswordError('No user id'));
      return;
    }

    final result = await _authRepository.login(
      id: id,
      password: state.password,
    );
    result.fold(
      (failure) {
        ErrorManager().reportError(failure);
        emit(state.withPasswordError(failure.userMessage));
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
      ErrorManager().reportError(
        const .client(type: .state, msg: 'User is invalid'),
      );
      emit(state.withPasswordError('User is invalid'));
      return;
    }

    final result = await _authRepository.register(user);
    result.fold(
      (failure) {
        ErrorManager().reportError(failure);
        emit(state.withPasswordError(failure.userMessage));
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
      ErrorManager().reportError(
        const .client(type: .state, msg: 'No user id'),
      );
      emit(state.withDetailError(event.method, 'No user id'));
      return;
    }

    await _cancelableOps[event.method]?.cancel();

    final cancelToken = CancelToken();

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
    final updateResult = await _authRepository.updateDetail(
      method: event.method,
      detail: detail,
      id: userId,
      cancelToken: cancelToken,
    );

    if (cancelToken.isCancelled) return;
    if (updateResult == null) return; // отменено в репозитории

    updateResult.fold(
      (failure) {
        ErrorManager().reportError(failure);
        emit(state.withDetailError(event.method, failure.userMessage));
      },
      (_) {
        final user = state.user;
        if (user == null) {
          ErrorManager().reportError(
            const .client(type: .state, msg: 'No user'),
          );
          emit(state.withDetailError(event.method, 'No user'));
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
    emit(state.copyWith(step: .authenticated));
  }

  void _onUpdateField(_UpdateField event, Emitter<AuthState> emit) {
    switch (event.field) {
      case .name:
        emit(state.copyWith(nameField: event.value));
        break;
      case .password:
        emit(state.copyWith(passwordField: event.value));
        break;
      case .identifier:
        final newFields = Map<AuthMethod, FieldState>.from(state.fields);
        newFields[state.method] = event.value;

        final newStep = state.step == .enterPassword
            ? AuthStep.enterIdentifier
            : state.step;
        emit(state.copyWith(fields: newFields, step: newStep));
        break;
      case AuthField.email:
        final newFields = Map<AuthMethod, FieldState>.from(state.fields);
        newFields[.email] = event.value;
        emit(state.copyWith(fields: newFields));
        break;
      case AuthField.phone:
        final newFields = Map<AuthMethod, FieldState>.from(state.fields);
        newFields[.phone] = event.value;
        emit(state.copyWith(fields: newFields));
        break;
      case AuthField.login:
        final newFields = Map<AuthMethod, FieldState>.from(state.fields);
        newFields[.login] = event.value;
        emit(state.copyWith(fields: newFields));
        break;
    }
  }
}
