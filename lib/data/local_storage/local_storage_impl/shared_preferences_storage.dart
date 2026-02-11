import 'package:co_stock/data/local_storage/i_local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager implements ILocalStorage {
  static SharedPreferences? _prefs;

  @override
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> saveData<T>({required String key, required T value}) async {
    try {
      if (value is String) {
        return await _prefs!.setString(key, value);
      } else if (value is int) {
        return await _prefs!.setInt(key, value);
      } else if (value is double) {
        return await _prefs!.setDouble(key, value);
      } else if (value is bool) {
        return await _prefs!.setBool(key, value);
      } else if (value is List<String>) {
        return await _prefs!.setStringList(key, value);
      } else {
        throw Exception('Unsupported type: ${value.runtimeType}');
      }
    } catch (e) {
      throw Exception('Failed to save data: $e');
    }
  }

  @override
  Future<T?> getData<T>({required String key}) async {
    try {
      final value = _prefs!.get(key);
      return value as T?;
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }

  @override
  Future<bool> removeData({required String key}) async {
    try {
      return await _prefs!.remove(key);
    } catch (e) {
      throw Exception('Failed to remove data: $e');
    }
  }

  @override
  Future<bool> clearAll() async {
    try {
      return await _prefs!.clear();
    } catch (e) {
      throw Exception('Failed to clear data: $e');
    }
  }

  @override
  Future<bool> containsKey({required String key}) async {
    try {
      return _prefs!.containsKey(key);
    } catch (e) {
      throw Exception('Failed to check key: $e');
    }
  }
}