import 'package:co_stock/domain/bases/i_local_storage.dart';
import 'package:co_stock/domain/extensions/color_ext.dart';
import 'package:co_stock/domain/extensions/iterable_ext.dart';
import 'package:co_stock/domain/local_storage_impl/local_storage_keys.dart';
import 'package:co_stock/presentation/prefs/locale/locale_data.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_system.dart';
import 'package:flutter/material.dart';

class LocalStorageService {
  ///
  /// Общие методы
  ///
  static Future<bool> saveData<T>({
    required String key,
    required T value,
  }) async {
    return await ILocalStorage.instance.saveData(key: key, value: value);
  }

  static Future<T?> getData<T>({required String key}) async {
    return await ILocalStorage.instance.getData<T>(key: key);
  }

  static Future<bool> removeData({required String key}) async {
    return await ILocalStorage.instance.removeData(key: key);
  }

  static Future<bool> clearAll() async {
    return await ILocalStorage.instance.clearAll();
  }

  static Future<bool> containsKey({required String key}) async {
    return await ILocalStorage.instance.containsKey(key: key);
  }

  ///
  /// Частные случаи
  ///

  /// Locale
  static Future<void> saveLocale(AppLocale locale) async {
    await saveData(key: LocalStorageKeys.locale.name, value: locale.name);
  }

  static Future<AppLocale?> getLocale() async {
    final str = await getData<String>(key: LocalStorageKeys.locale.name);
    if (str == null) return null;

    return AppLocale.byName(str);
  }

  /// Theme
  static Future<void> saveThemeMode(ThemeMode mode) async {
    await saveData(key: LocalStorageKeys.themeMode.name, value: mode.name);
  }

  static Future<ThemeMode?> getThemeMode() async {
    final str = await getData<String>(key: LocalStorageKeys.themeMode.name);
    if (str == null) return null;

    return ThemeMode.values.firstWhereOrNull((e) => e.name == str);
  }

  static Future<void> saveThemeSeed(Color seed) async {
    await saveData<Map<String, double>>(
      key: LocalStorageKeys.themeSeed.name,
      value: seed.toJson(),
    );
  }

  static Future<Color?> getThemeSeed() async {
    final map = await getData<Map<String, double>>(
      key: LocalStorageKeys.themeSeed.name,
    );
    if (map == null) return null;

    return ColorExt.fromJsonOrNull(map);
  }

  static Future<void> saveThemeSysVar(ThemeSystemVariant themeSysVar) async {
    await saveData(
      key: LocalStorageKeys.themeSysVar.name,
      value: themeSysVar.name,
    );
  }

  static Future<ThemeSystemVariant?> getThemeSysVar() async {
    final str = await getData<String>(key: LocalStorageKeys.themeSysVar.name);
    if (str == null) return null;

    return ThemeSystemVariant.byName(str);
  }
}
