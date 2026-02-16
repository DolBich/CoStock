import 'package:co_stock/data/repositories/repo_data/errors/repo_errors/auth_error.dart';
import 'package:co_stock/data/repositories/repos/i_repository.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_data.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository implements IRepository {
  Future<Either<AuthError, AuthData>> sentData(AuthData data);
}