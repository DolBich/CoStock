import 'package:co_stock/data/repositories/repo_di/i_injector.dart';
import 'package:co_stock/data/repositories/repo_di/injectors/firebase_injector.dart';
import 'package:co_stock/data/repositories/repo_di/injectors/mock_injector.dart';

class InjectorFactory {
  static IInjector createMockInjector() => const MockInjector();

  static IInjector createFirebaseInjector() => const FirebaseInjector();
}