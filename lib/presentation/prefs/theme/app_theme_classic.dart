import 'package:co_stock/domain/extensions/color_ext.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_system.dart';
import 'package:flutter/material.dart';

/// Система тем основанная на ручном выборе всех цветов
/// Для расширения нужно унаследовать от этого класса другие варианты
/// Например [class AppThemeNewYear extends AppThemeClassic]
/// А дальше разработать систему смены конкретных видов тем
/// Этот подход даёт большие возможности и очень тонкую настройку
/// Но добавление каждой новой темы крайне муторное и при этом
/// трубет полного тестирования всего приложения, чтобы убедиться, что везде
/// всё выглядит как
class AppThemeClassic extends AppThemeSystem {
  const AppThemeClassic();
  // Основные цвета оранжевая палитра)
  static const Color primaryColor = Color(0xFFFF6B35); // Теплый оранжевый
  static const Color primaryLight = Color(0xFFFF9B70); // Светлый оранжевый
  static const Color primaryDark = Color(0xFFC43C00); // Темный оранжевый

  // Вспомогательные цвета
  static const Color secondaryColor = Color(0xFF4ECDC4); // Бирюзовый (для контраста)
  static const Color successColor = Color(0xFF4CAF50); // Зеленый успеха
  static const Color warningColor = Color(0xFFFFC107); // Желтый предупреждения
  static const Color errorColor = Color(0xFFEF5350); // Красный ошибки
  static const Color infoColor = Color(0xFF2196F3); // Синий информации

  // Нейтральные цвета
  static const Color surfaceColor = Color(0xFFFFFFFF); // Белый
  static const Color backgroundColor = Color(0xFFF8F9FA); // Светло-серый фон
  static const Color onSurfaceColor = Color(0xFF212121); // Темно-серый текст
  static const Color secondaryTextColor = Color(0xFF757575); // Серый текст
  static const Color borderColor = Color(0xFFE0E0E0); // Цвет границ
  static const Color dividerColor = Color(0xFFEEEEEE); // Цвет разделителей

  // Темная тема
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkOnSurface = Color(0xFFE0E0E0);

  // Градиенты (если нужно)
  static Gradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFF9B70)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Классические темы
  @override
  ThemeData get lightTheme => _buildLightTheme();

  @override
  ThemeData get darkTheme => _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        primaryContainer: primaryLight,
        secondary: secondaryColor,
        secondaryContainer: Color(0xFFB2EBF2),
        surface: backgroundColor,
        error: errorColor,
        onSurface: onSurfaceColor,
        outline: borderColor,
      ),

      // Текстовые стили
      textTheme: TextTheme(
        displayLarge: base.textTheme.displayLarge?.copyWith(
          color: onSurfaceColor,
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: base.textTheme.displayMedium?.copyWith(
          color: onSurfaceColor,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
        displaySmall: base.textTheme.displaySmall?.copyWith(
          color: onSurfaceColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: base.textTheme.headlineMedium?.copyWith(
          color: onSurfaceColor,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: base.textTheme.headlineSmall?.copyWith(
          color: onSurfaceColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: base.textTheme.titleLarge?.copyWith(
          color: onSurfaceColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: base.textTheme.titleMedium?.copyWith(
          color: onSurfaceColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: base.textTheme.titleSmall?.copyWith(
          color: secondaryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: base.textTheme.bodyLarge?.copyWith(
          color: onSurfaceColor,
          fontSize: 16,
        ),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          color: onSurfaceColor,
          fontSize: 14,
        ),
        bodySmall: base.textTheme.bodySmall?.copyWith(
          color: secondaryTextColor,
          fontSize: 12,
        ),
        labelLarge: base.textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: base.textTheme.labelMedium?.copyWith(
          color: secondaryTextColor,
          fontSize: 14,
        ),
        labelSmall: base.textTheme.labelSmall?.copyWith(
          color: secondaryTextColor,
          fontSize: 12,
        ),
      ),

      // Карточки
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(8),
      ),

      // Кнопки
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input поля
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        labelStyle: const TextStyle(
          color: secondaryTextColor,
          fontSize: 16,
        ),
        hintStyle: const TextStyle(
          color: secondaryTextColor,
          fontSize: 16,
        ),
        errorStyle: const TextStyle(
          color: errorColor,
          fontSize: 14,
        ),
      ),

      // Чекбоксы, радиокнопки, переключатели
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return null;
        }),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return Colors.grey[300];
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor.withOpacityModern(0.5);
          }
          return Colors.grey[400];
        }),
      ),

      // AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: onSurfaceColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: onSurfaceColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        actionsIconTheme: IconThemeData(
          color: primaryColor,
        ),
      ),

      // Bottom Navigation
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryTextColor,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
        ),
      ),

      // Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        elevation: 4,
      ),

      // Разделители
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 0,
      ),

      // Progress indicators
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: Color(0xFFE0E0E0),
        circularTrackColor: Color(0xFFE0E0E0),
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: onSurfaceColor,
        contentTextStyle: const TextStyle(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Диалоги
      dialogTheme: DialogThemeData(
        backgroundColor: surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: const TextStyle(
          color: onSurfaceColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: const TextStyle(
          color: onSurfaceColor,
          fontSize: 16,
        ),
      ),

      // Chip
      chipTheme: ChipThemeData(
        backgroundColor: primaryColor.withOpacityModern(0.1),
        selectedColor: primaryColor,
        labelStyle: const TextStyle(color: onSurfaceColor),
        secondaryLabelStyle: const TextStyle(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    final lightTheme = _buildLightTheme();
    final darkBase = ThemeData.dark(useMaterial3: true);

    return lightTheme.copyWith(
      brightness: Brightness.dark,
      colorScheme: darkBase.colorScheme.copyWith(
        primary: primaryColor,
        primaryContainer: primaryDark,
        secondary: secondaryColor,
        surface: darkSurface,
        onSurface: darkOnSurface,
      ),
      scaffoldBackgroundColor: darkBackground,
      cardTheme: lightTheme.cardTheme.copyWith(
        color: darkSurface,
        elevation: 4,
      ),
      appBarTheme: lightTheme.appBarTheme.copyWith(
        backgroundColor: darkSurface,
        foregroundColor: darkOnSurface,
      ),
      bottomNavigationBarTheme: lightTheme.bottomNavigationBarTheme.copyWith(
        backgroundColor: darkSurface,
      ),
      inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: darkSurface,
      ),
      dividerTheme: lightTheme.dividerTheme.copyWith(
        color: Colors.white.withOpacityModern(0.1),
      ),
    );
  }
}