import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
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
    on<_ChangeLogin>(_changeLogin);
    on<_ChangePhone>(_changePhone);
    on<_ChangeEmail>(_changeEmail);
    on<_ChangePassword>(_changePassword);
    on<_ChangeName>(_changeName);

    _authRepository = InjectorManager().current.authRepository;
    add(const ProfileEvent.init());
  }

  late final IAuthRepository _authRepository;

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

  Future<void> _changeLogin(
    _ChangeLogin event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.login == state.user?.login) return;

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

    final login = event.login;
    if (login == null) {
      if (state.canDeleteInfo) {
        await _deleteDetail(.login, userId, emit);
        return;
      } else {
        ErrorManager().reportError(const .auth(type: .lastDetail));
        emit(state.copyWith(isLoading: false));
        return;
      }
    }

    final res = await _authRepository.checkRegAccount(
      method: .login,
      identifier: login,
    );

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
        return;
      },
      (u) async {
        final updateRes = await _authRepository.updateDetail(
          method: .login,
          detail: login,
          id: userId,
        );

        updateRes.fold(
          (f) {
            f.report();
            emit(state.copyWith(isLoading: false));
            return;
          },
          (u) {
            emit(
              state
                  .setDetail(method: .login, value: login)
                  .copyWith(isLoading: false),
            );
          },
        );
      },
    );
  }

  Future<void> _changePhone(
    _ChangePhone event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.phone == state.user?.phone) return;

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

    final phone = event.phone;
    if (phone == null) {
      if (state.canDeleteInfo) {
        await _deleteDetail(.phone, userId, emit);
        return;
      } else {
        ErrorManager().reportError(const .auth(type: .lastDetail));
        emit(state.copyWith(isLoading: false));
        return;
      }
    }

    final res = await _authRepository.checkRegAccount(
      method: .phone,
      identifier: phone,
    );

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
        return;
      },
      (u) async {
        final updateRes = await _authRepository.updateDetail(
          method: .phone,
          detail: phone,
          id: userId,
        );

        updateRes.fold(
          (f) {
            f.report();
            emit(state.copyWith(isLoading: false));
            return;
          },
          (u) {
            emit(
              state
                  .setDetail(method: .phone, value: phone)
                  .copyWith(isLoading: false),
            );
          },
        );
      },
    );
  }

  Future<void> _changeEmail(
    _ChangeEmail event,
    Emitter<ProfileState> emit,
  ) async {
    if (event.email == state.user?.email) return;

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

    final email = event.email;
    if (email == null) {
      if (state.canDeleteInfo) {
        await _deleteDetail(.email, userId, emit);
        return;
      } else {
        ErrorManager().reportError(const .auth(type: .lastDetail));
        emit(state.copyWith(isLoading: false));
        return;
      }
    }

    final res = await _authRepository.checkRegAccount(
      method: .email,
      identifier: email,
    );

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
        return;
      },
      (u) async {
        final updateRes = await _authRepository.updateDetail(
          method: .email,
          detail: email,
          id: userId,
        );

        updateRes.fold(
          (f) {
            f.report();
            emit(state.copyWith(isLoading: false));
            return;
          },
          (u) {
            emit(
              state
                  .setDetail(method: .email, value: email)
                  .copyWith(isLoading: false),
            );
          },
        );
      },
    );
  }

  Future<void> _deleteDetail(
    AuthMethod method,
    String id,
    Emitter<ProfileState> emit,
  ) async {
    final res = await _authRepository.updateDetail(
      method: method,
      detail: null,
      id: id,
    );

    res.fold(
      (f) {
        f.report();
        emit(state.copyWith(isLoading: false));
        return;
      },
      (u) {
        emit(state.setDetail(method: method).copyWith(isLoading: false));
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
