import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/mock_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/image_repo/i_image_repository.dart';
import 'package:co_stock/data/repositories/repos/image_repo/mock_image_repository.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/i_groups_repository.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/mock_groups_repository.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/mock_stock_repository.dart';

/// Набор репозиториев реализованных на основе mock
class MockInjector implements IInjector {
  const MockInjector();

  @override
  IAuthRepository get authRepository => MockAuthRepository();

  @override
  IGroupsRepository get groupsRepository => MockGroupsRepository();

  @override
  IImageRepository get imageRepository => MockImageRepository();

  @override
  IStockRepository get stockRepository => MockStockRepository();
}