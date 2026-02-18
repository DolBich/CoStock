import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/domain/errors/app_errors.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/user_screen/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository implements IRepository {
  Future<Either<AppError, String>> checkAuthAccount({
    required AuthMethod method,
    required String identifier,
  });

  Future<Either<AppError, Unit>> checkRegAccount({
    required AuthMethod method,
    required String identifier,
  });

  Future<Either<AppError, User>> login({
    required String id,
    required String password,
  });

  /// Возвращает в случае успеха новый id с сервера
  Future<Either<AppError, String>> register(User user);

  Future<Either<AppError, User>> getCurrentUser({required String id});

  ///
  /// Editing
  ///

  /// Перед каждым изменением надо сначала проверить на ui части
  /// не существует ли уже аккаунта с такими параметрами
  /// Кроме пароля
  Future<Either<AppError, Unit>> updateDetail({
    required AuthMethod method,
    required String? detail,
    required String id,
}) {
    switch(method) {
      case .email:
        return updateEmail(id: id, email: detail);
      case .login:
        return updateLogin(id: id, login: detail);
      case .phone:
        return updatePhone(id: id, phone: detail);
    }
  }

  /// if null - delete
  Future<Either<AppError, Unit>> updateLogin({
    required String id,
    required String? login,
  });

  Future<Either<AppError, Unit>> updatePassword({
    required String id,
    required String password,
  });

  Future<Either<AppError, Unit>> updatePhone({
    required String id,
    required String? phone,
  });

  Future<Either<AppError, Unit>> updateEmail({
    required String id,
    required String? email,
  });

  Future<Either<AppError, Unit>> updateName({
    required String id,
    required String name,
  });
}
