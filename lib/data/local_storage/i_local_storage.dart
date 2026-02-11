abstract class ILocalStorage {
  static ILocalStorage? _instance;

  static ILocalStorage get instance {
    if (_instance == null) {
      throw Exception('LocalStorage not initialized. Call init() first.');
    }
    return _instance!;
  }

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