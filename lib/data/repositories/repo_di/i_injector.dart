import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';

abstract class IInjector {
  IAuthRepository get authRepository;
}