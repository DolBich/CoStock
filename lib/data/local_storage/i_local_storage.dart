/// Абстрактный класс локального хранилища
/// Описывает все основные методы для работы с любым локальных хранилищем
abstract class ILocalStorage {
  static ILocalStorage? _instance;

  /// Требует обязательно инициализации перед использованием

  static ILocalStorage get instance {
    if (_instance == null) {
      throw Exception('LocalStorage not initialized. Call init() first.');
    }
    return _instance!;
  }

  /// Инициализация подразумевает под собой выбор конкретной реализации
  /// этого абстрактного класса
  /// [implementation] - реализация локального хранилища
  static Future<void> init(ILocalStorage implementation) async {
    await implementation.initialize();
    _instance = implementation;
  }

  Future<void> initialize();
  Future<bool> saveData<T>({required String key, required T value});
  Future<T?> getData<T>({required String key});
  Future<bool> removeData({required String key});
  Future<bool> clearAll();
  Future<bool> containsKey({required String key});
}