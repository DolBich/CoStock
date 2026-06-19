import 'package:co_stock/data/repositories/repos/auth_repo/i_auth_repo.dart';
import 'package:co_stock/data/repositories/repos/image_repo/i_image_repository.dart';
import 'package:co_stock/data/repositories/repos/groups_repo/i_groups_repository.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/i_stock_repository.dart';

/// Содержит в себе все актуальные реализации репозиториев
///
/// Можно по мере работы приложения менять реализации репозиториев для смены
/// сервера или на/c mock
abstract class IInjector {
  /// Репозиторий авторизации
  IAuthRepository get authRepository;

  /// Репозиторий хранилищ и групп
  IGroupsRepository get groupsRepository;

  /// Репозиторий картинок
  IImageRepository get imageRepository;

  /// Репозиторий элементов хранилища
  IStockRepository get stockRepository;
}