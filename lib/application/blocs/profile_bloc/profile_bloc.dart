import 'package:async/async.dart';
import 'package:co_stock/application/handlers/event_transformers.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/domain/bases/cancel_token.dart';
import 'package:co_stock/domain/bases/session_manager.dart';
import 'package:co_stock/domain/errors/app_errors.dart';
import 'package:co_stock/domain/errors/error_manager.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/user_screen/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<_Init>(_init);
    on<_ChangeLogin>(
      (e, m) => _updateDetail(e.login, .login, m),
      transformer: restartable(),
    );
    on<_ChangePhone>(
      (e, m) => _updateDetail(e.phone, .phone, m),
      transformer: restartable(),
    );
    on<_ChangeEmail>(
      (e, m) => _updateDetail(e.email, .email, m),
      transformer: restartable(),
    );
    on<_ChangePassword>(_changePassword);
    on<_ChangeName>(_changeName);

    _authRepository = InjectorManager().current.authRepository;
    add(const ProfileEvent.init());
  }

  late final IAuthRepository _authRepository;

  final Map<AuthMethod, CancelableOperation> _cancelableOps = {};

  Future<void> _init(_Init event, Emitter<ProfileState> emit) async {
    final id = SessionManager.id;
    if (id == null) {
      ErrorManager().reportError(
        const .client(type: .state, msg: 'Couldn\'t get userId'),
      );
      return;
    }

    final res = await _authRepository.getCurrentUser(id: id);

    res.fold(
      (f) {
        f.report();

        /// На стороне UI сделать проверку
        /// [if(!isLoading && user == null) - отображать на экране ошибку загрузки данных]
        emit(state.copyWith(isLoading: false));
        return;
      },
      (user) {
        emit(state.copyWith(user: user, isLoading: false));
      },
    );
  }

  /// Для этого метода воспользоваться в UI _DetailField
  Future<void> _updateDetail(
    String? identifier,
    AuthMethod method,
    Emitter<ProfileState> emit,
  ) async {
    if (identifier == state.detailFromMethod(method)) return;

    final userId = state.user?.id;
    if (userId == null) {
      ErrorManager().reportError(
        const .client(
          type: .state,
          msg: 'Couldn\'t find userId for user info update',
        ),
      );
      return;
    }

    await _cancelableOps[method]?.cancel();

    final cancelToken = CancelToken();

    final operation = CancelableOperation.fromFuture(
      _performUpdate(identifier, method, emit, userId, cancelToken),
      onCancel: cancelToken.cancel,
    );

    _cancelableOps[method] = operation;

    await operation.valueOrCancellation();

    if (_cancelableOps[method] == operation) {
      _cancelableOps.remove(method);
    }
  }

  Future<void> _performUpdate(
    String? identifier,
    AuthMethod method,
    Emitter<ProfileState> emit,
    String userId,
    CancelToken cancelToken,
  ) async {
    emit(state.copyWith(isLoading: true));

    final res = await _authRepository.updateDetail(
      method: method,
      detail: identifier,
      id: userId,
      cancelToken: cancelToken,
    );

    if (cancelToken.isCancelled) return;
    if (res == null) return; // отменено в репозитории

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
      },
      (_) {
        emit(
          state
              .setDetail(method: method, value: identifier)
              .copyWith(isLoading: false),
        );
      },
    );
  }

  Future<void> _changePassword(
    _ChangePassword event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.password == state.user?.password) return;

    final userId = state.user?.id;
    if (userId == null) {
      ErrorManager().reportError(
        const .client(
          type: .state,
          msg: 'Couldn\'t find userId for user info update',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    final password = event.password;

    final res = await _authRepository.updatePassword(
      id: userId,
      password: password,
    );

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
        return;
      },
      (u) async {
        emit(
          state.copyWith(
            user: state.user?.copyWith(password: password),
            isLoading: false,
          ),
        );
      },
    );
  }

  Future<void> _changeName(
    _ChangeName event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.name == state.user?.name) return;

    final userId = state.user?.id;
    if (userId == null) {
      ErrorManager().reportError(
        const .client(
          type: .state,
          msg: 'Couldn\'t find userId for user info update',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    final res = await _authRepository.updateName(id: userId, name: event.name);

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
      },
      (_) {
        emit(
          state.copyWith(
            user: state.user?.copyWith(name: event.name),
            isLoading: false,
          ),
        );
      },
    );
  }
}
