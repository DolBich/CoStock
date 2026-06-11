import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repo_di/injector_factory.dart';

/// Менеджер для управления набором используемых реализаций репозиториев
class InjectorManager {
  /// Dependency Injector для синглтона
  static final InjectorManager _instance = InjectorManager._internal();
  factory InjectorManager() => _instance;
  InjectorManager._internal();

  /// Пока по умолчанию используем mock реализацию репозиториев
  IInjector _currentInjector = InjectorFactory.createMockInjector();

  /// Позволяет инициализировать кастомный набор репозиториев
  void initialize({required IInjector initialInjector}) {
    _currentInjector = initialInjector;
  }

  IInjector get current => _currentInjector;

  /// Заменяет нынешний инъектор на инъектор с mock репозиториями
  void useMock() {
    _currentInjector = InjectorFactory.createMockInjector();
  }

  /// Заменяет нынешний инъектор на инъектор с firebase репозиториями
  void useFirebase() {
    _currentInjector = InjectorFactory.createFirebaseInjector();
  }
}
