import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/mock_auth_repo.dart';

class MockInjector implements IInjector {
  const MockInjector();

  @override
  IAuthRepository get authRepository => MockAuthRepository();
}