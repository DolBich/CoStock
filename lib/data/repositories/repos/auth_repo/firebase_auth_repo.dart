import 'package:co_stock/data/repositories/repo_data/errors/repo_errors/auth_error.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/domain/screens_entities/auth_screen/auth_data.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseAuthRepository implements IAuthRepository {
  @override
  Future<Either<AuthError, AuthData>> sentData(AuthData data) {
    // TODO: implement sentData
    throw UnimplementedError();
  }

}