import 'package:co_stock/domain/extensions/iterable_ext.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_classic.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_seeded.dart';
import 'package:flutter/material.dart';

/// Система тем
abstract class AppThemeSystem {
  const AppThemeSystem();

  ThemeData get lightTheme;

  ThemeData get darkTheme;
}

/// Существующие варианты систем построения тем
enum ThemeSystemVariant {
  seeded(AppThemeSeeded()),
  classic(AppThemeClassic());

  final AppThemeSystem system;

  const ThemeSystemVariant(this.system);

  static ThemeSystemVariant byName(String name) =>
      values.firstWhereOrNull((e) => e.name == name);
}
