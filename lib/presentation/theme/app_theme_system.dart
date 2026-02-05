import 'package:flutter/material.dart';

abstract class AppThemeSystem {
  const AppThemeSystem();

  ThemeData get lightTheme;
  ThemeData get darkTheme;
}

