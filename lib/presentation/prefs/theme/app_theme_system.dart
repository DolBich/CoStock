import 'package:flutter/material.dart';

/// Система возможных тем для набора
abstract class AppThemeSystem {
  const AppThemeSystem();

  ThemeData get lightTheme;

  ThemeData get darkTheme;
}