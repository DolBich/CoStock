import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repo_di/injectors/firebase_injector.dart';
import 'package:co_stock/data/repositories/repo_di/injectors/mock_injector.dart';

/// Фабрика по созданию инъекторов
///
/// Каждый метод похволяет получить набор связанных реализаций репозиториев
class InjectorFactory {
  /// Реализации репозиториев на основе mock
  static IInjector createMockInjector() => const MockInjector();

  /// Реализации репозиториев на основе firebase
  static IInjector createFirebaseInjector() => const FirebaseInjector();
}