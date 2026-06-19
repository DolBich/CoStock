import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/firebase_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/image_repo/firebase_image_repository.dart';
import 'package:co_stock/data/repositories/repos/image_repo/i_image_repository.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/firebase_groups_repository.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/i_groups_repository.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/firebase_stock_repository.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';

/// Набор репозиториев реализованных на основе firebase
class FirebaseInjector implements IInjector {
  const FirebaseInjector();

  @override
  IAuthRepository get authRepository => FirebaseAuthRepository();

  @override
  IGroupsRepository get groupsRepository => FirebaseGroupsRepository();

  @override
  IImageRepository get imageRepository => FirebaseImageRepository();

  @override
  IStockRepository get stockRepository => FirebaseStockRepository();
}