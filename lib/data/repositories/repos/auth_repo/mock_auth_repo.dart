import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/domain/errors/app_errors.dart';
import 'package:co_stock/domain/extensions/iterable_ext.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/user_screen/user.dart';
import 'package:fpdart/fpdart.dart';

class MockAuthRepository  extends IAuthRepository  with MockRepoDelay {
  Map<String, User> savedUsers = {
    'UniqueId': User(
      id: 'UniqueId',
      name: 'Иванов Дмитрий Игоревич',
      login: 'DolBich',
      phone: '+7 (965) 032-98-29',
      email: 'shotgunz@yandex.ru',
      password: 'P@__w0rd',
    ),
  };

  @override
  Future<Either<AppError, String>> checkAuthAccount({
    required AuthMethod method,
    required String identifier,
  }) async {
    await delay();

    final res = savedUsers.values.firstWhereOrNull(
      (User e) => method.check(e, identifier),
    );

    return res != null ? right(res.id) : left(const .auth(type: .identifier));
  }

  @override
  Future<Either<AppError, Unit>> checkRegAccount({
    required AuthMethod method,
    required String identifier,
  }) async {
    await delay();

    final res = savedUsers.values.firstWhereOrNull(
      (User e) => method.check(e, identifier),
    );

    return res == null ? right(unit) : left(.auth(type: method.error));
  }

  @override
  Future<Either<AppError, User>> login({
    required String id,
    required String password,
  }) async {
    await delay();

    final user = savedUsers[id];
    if (user == null) {
      return left(
        .client(type: .state, msg: 'Пользователь с id [$id] не был найден'),
      );
    }
    final res = user.password == password;

    if (res) {
      return right(user);
    }
    return left(const .auth(type: .password));
  }

  @override
  Future<Either<AppError, String>> register(User user) async {
    await delay();

    savedUsers.addAll({user.id: user});
    return right(user.id);
  }

  @override
  Future<Either<AppError, User>> getCurrentUser({required String id}) async {
    await delay();

    final user = savedUsers[id];
    if (user == null) {
      return left(
        .client(type: .state, msg: 'Не был найден пользователь с id [$id]'),
      );
    }

    return right(user);
  }

  @override
  Future<Either<AppError, Unit>> updateEmail({
    required String id,
    required String? email,
  }) async {
    await delay();

    final user = savedUsers[id];
    if (user == null) {
      return left(
            .client(type: .state, msg: 'Не был найден пользователь с id [$id]'),
      );
    }

    /// Когда будем делать сервер эта проверка должна быть на стороне сервера
    /// в целях экономии трафика, а не отдельным запросом
    if(email != null) {
      final checker = await checkRegAccount(method: .email, identifier: email);

      if(checker.isLeft()) {
        return checker;
      }
    }

    savedUsers[id] = user.copyWith(email: some(email));
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> updateLogin({
    required String id,
    required String? login,
  }) async {
    await delay();

    final user = savedUsers[id];
    if (user == null) {
      return left(
            .client(type: .state, msg: 'Не был найден пользователь с id [$id]'),
      );
    }

    /// Когда будем делать сервер эта проверка должна быть на стороне сервера
    /// в целях экономии трафика, а не отдельным запросом
    if(login != null) {
      final checker = await checkRegAccount(method: .login, identifier: login);

      if(checker.isLeft()) {
        return checker;
      }
    }

    savedUsers[id] = user.copyWith(login: some(login));
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> updatePassword({
    required String id,
    required String password,
  }) async {
    await delay();

    final user = savedUsers[id];
    if (user == null) {
      return left(
            .client(type: .state, msg: 'Не был найден пользователь с id [$id]'),
      );
    }

    savedUsers[id] = user.copyWith(password: password);
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> updatePhone({
    required String id,
    required String? phone,
  }) async {
    await delay();

    final user = savedUsers[id];
    if (user == null) {
      return left(
            .client(type: .state, msg: 'Не был найден пользователь с id [$id]'),
      );
    }

    /// Когда будем делать сервер эта проверка должна быть на стороне сервера
    /// в целях экономии трафика, а не отдельным запросом
    if(phone != null) {
      final checker = await checkRegAccount(method: .phone, identifier: phone);

      if(checker.isLeft()) {
        return checker;
      }
    }


    savedUsers[id] = user.copyWith(phone: some(phone));
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> updateName({
    required String id,
    required String name,
  }) async {
    await delay();
    final user = savedUsers[id];

    if (user == null) {
      return left(.client(type: .state, msg: 'Не был найден пользователь с id [$id]'));
    }

    savedUsers[id] = user.copyWith(name: name);
    return right(unit);
  }
}
