import 'package:co_stock/application/services/theme_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeSaver', () {
    test('сохраняет и загружает тему правильно', () async {
      SharedPreferences.setMockInitialValues({});

      final saver = ThemeSaver();

      await saver.saveTheme(ThemeMode.light);

      // Проверяем, что сохранилось корректно
      final loaded = await saver.loadTheme();
      expect(loaded, ThemeMode.light);

      // Проверяем, что currentTheme обновился
      expect(saver.currentTheme, ThemeMode.light);
    });

    test('при отсутствии сохранённой темы возвращает system', () async {
      SharedPreferences.setMockInitialValues({});

      final saver = ThemeSaver();
      final loaded = await saver.loadTheme();

      expect(loaded, ThemeMode.system);
      expect(saver.currentTheme, ThemeMode.system);
    });

    test('сохраняет и загружает тёмную тему', () async {
      SharedPreferences.setMockInitialValues({});

      final saver = ThemeSaver();
      await saver.saveTheme(ThemeMode.dark);

      final loaded = await saver.loadTheme();
      expect(loaded, ThemeMode.dark);
      expect(saver.currentTheme, ThemeMode.dark);
    });
  });
}
