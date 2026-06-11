import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';

/// Содержит в себе все актуальные реализации репозиториев
///
/// Можно по мере работы приложения менять реализации репозиториев для смены
/// сервера или на/c mock
abstract class IInjector {
  /// Репозиторий авторизации
  IAuthRepository get authRepository;

  /// Репозиторий хранилищ и групп
  IStockRepository get stockRepository;
}