import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/domain/bases/cancel_token.dart';
import 'package:co_stock/domain/errors/app_errors.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_method.dart';
import 'package:co_stock/domain/screens_entities/user_screen/user.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseAuthRepository extends IAuthRepository {
  @override
  Future<Either<AppError, String>> checkAuthAccount({required AuthMethod method, required String identifier}) {
    // TODO: implement checkAuthAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>> checkRegAccount({required AuthMethod method, required String identifier}) {
    // TODO: implement checkRegAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, User>> getCurrentUser({required String id}) {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, User>> login({required String id, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, String>> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>> updateName({required String id, required String name}) {
    // TODO: implement updateName
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> updateEmail({required String id, required String? email, CancelToken? cancelToken}) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> updateLogin({required String id, required String? login, CancelToken? cancelToken}) {
    // TODO: implement updateLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>> updatePassword({required String id, required String password}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, Unit>?> updatePhone({required String id, required String? phone, CancelToken? cancelToken}) {
    // TODO: implement updatePhone
    throw UnimplementedError();
  }

}