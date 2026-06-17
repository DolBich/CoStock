import 'package:async/async.dart';
import 'package:co_stock/application/handlers/event_transformers.dart';
import 'package:co_stock/application/services/session_service.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/core/user/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(.initial()) {
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

    /// Это тот случай, когда мы подтягиваем юзера от сохранённого
    /// id при автоматической авторизации при входе в приложение
    if (SessionService.registered) add(const .init());
  }

  final _authRepository = InjectorManager().current.authRepository;

  final Map<AuthMethod, CancelableOperation> _cancelableOps = {};

  Future<void> waitForInit({User? user}) async {
    /// Если уже загружено или загрузка неактивна — выходим сразу
    if (state.user != null) return;
    add(.init(user));

    await stream.firstWhere((state) => !state.isLoading);
    return;
  }

  Future<void> _init(_Init event, Emitter<ProfileState> emit) async {
    User? user = event.user;

    if (user == null) {
      final id = SessionService.id;

      final res = await _authRepository.getCurrentUser(id: id);

      user = res.fold<User?>((f) {
        f.report();

        /// На стороне UI сделать проверку
        /// [if(!isLoading && user == null) - отображать на экране ошибку загрузки данных]
        return null;
      }, (user) => user);
    }

    emit(state.copyWith(user: user, isLoading: false));
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
      final f = AppError.client(
        type: .state,
        error: Exception('Couldn\'t find userId for user info update'),
        stackTrace: .current,
      );
      f.report();
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
      final f = AppError.client(
        type: .state,
        error: Exception('Couldn\'t find userId for user info update'),
        stackTrace: .current,
      );
      f.report();
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
      final f = AppError.client(
        type: .state,
        error: Exception('Couldn\'t find userId for user info update'),
        stackTrace: .current,
      );
      f.report();
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
