import 'package:flutter/material.dart';

/// Система тем
abstract class AppThemeSystem {
  const AppThemeSystem();

  ThemeData get lightTheme;
  ThemeData get darkTheme;
}

