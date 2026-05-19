import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';

abstract class IInjector {
  IAuthRepository get authRepository;
  IStockRepository get stockRepository;
}