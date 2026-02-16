import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repo_di/injector_factory.dart';

class InjectorManager {
  static final InjectorManager _instance = InjectorManager._internal();

  factory InjectorManager() => _instance;

  InjectorManager._internal();

  IInjector _currentInjector = InjectorFactory.createMockInjector();

  void initialize({required IInjector initialInjector}) {
    _currentInjector = initialInjector;
  }

  IInjector get current => _currentInjector;

  void useMock() {
    _currentInjector = InjectorFactory.createMockInjector();
  }

  void useFirebase() {
    _currentInjector = InjectorFactory.createFirebaseInjector();
  }
}
