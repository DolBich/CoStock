import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/firebase_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/firebase_stock_repository.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';

class FirebaseInjector implements IInjector {
  const FirebaseInjector();

  @override
  IAuthRepository get authRepository => FirebaseAuthRepository();

  @override
  IStockRepository get stockRepository => FirebaseStockRepository();
}