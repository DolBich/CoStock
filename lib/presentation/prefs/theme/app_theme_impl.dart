import 'package:co_stock/domain/extensions/color_ext.dart';
import 'package:co_stock/presentation/prefs/theme/app_theme_system.dart';
import 'package:co_stock/presentation/prefs/theme/theme_config.dart';
import 'package:co_stock/presentation/prefs/theme/theme_extensions/app_segmented_button_theme.dart';
import 'package:flutter/material.dart';

/// Система тем основанная на ручном выборе всех цветов
/// Для расширения нужно унаследовать от этого класса другие варианты
/// Например [class AppThemeNewYear extends AppThemeClassic]
/// А дальше разработать систему смены конкретных видов тем
/// Этот подход даёт большие возможности и очень тонкую настройку
/// Но добавление каждой новой темы крайне муторное и при этом
/// трубет полного тестирования всего приложения, чтобы убедиться, что везде
/// всё выглядит как
class AppThemeImpl extends AppThemeSystem {
  const AppThemeImpl._internal();

  factory AppThemeImpl() => _instance;

  static const AppThemeImpl _instance = AppThemeImpl._internal();

  static ThemeConfig config = ThemeConfig.classic();

  // Основные цвета оранжевая палитра
  static const Color primary = Color(0xFFFF8A00);
  static const Color primaryLight = Color(0xFFFFB74D);
  static const Color primaryDark = Color(0xFFF57C00);

  // Вспомогательные цвета
  static const Color secondary = Color(0xFF6D4C41);
  static const Color secondaryLight = Color(0xFF8D6E63);

  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;

  static const Color surfaceVariant = Color(0xFFFFF1E6);
  static const Color outlineVariant = Color(0xFFFFEAD6);

  static const Color success = Color(0xFF66BB6A);
  static const Color warning = Color(0xFFFFA000);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF8E24AA);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color scrim = Color(0x66000000);

  // Нейтральные цвета
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFFF8F3);
  static const Color border = Color(0xFFFFE0B2);

  // Темно-серый текст
  static const Color textPrimary = Color(0xFF2E2E2E);
  static const Color textSecondary = Color(0xFF8D6E63);

  // Темная тема
  static const Color darkSurface = Color(0xFF1C1816);
  static const Color darkBackground = Color(0xFF161311);
  static const Color darkOnSurface = Color(0xFFEDE0D6);
  static const Color darkOutline = Color(0xFF3A312C);
  static const Color darkOutlineVariant = Color(0xFF2F2723);
  static const Color darkSurfaceVariant = Color(0xFF2A2421);
  static const Color darkOnPrimary = Color(0xFF2B1A00);

  static final ColorScheme _seededScheme = ColorScheme.fromSeed(
    seedColor: config.seed,
  );

  static ColorScheme get _lightColorScheme => config.useSeed
      ? _seedScheme(_lightColorSchemeUnseeded)
      : _lightColorSchemeUnseeded;

  static ColorScheme get _darkColorScheme => config.useSeed
      ? _seedScheme(_darkColorSchemeUnseeded)
      : _darkColorSchemeUnseeded;

  static ColorScheme _seedScheme(ColorScheme scheme) {
    return _seededScheme.copyWith(
      brightness: scheme.brightness,
      primary: scheme.primary,
      onPrimary: scheme.onPrimary,
      primaryContainer: scheme.primaryContainer,
      onPrimaryContainer: scheme.onPrimaryContainer,
      secondary: scheme.secondary,
      onSecondary: scheme.onSecondary,
      secondaryContainer: scheme.secondaryContainer,
      onSecondaryContainer: scheme.onSecondaryContainer,
      surface: scheme.surface,
      onSurface: scheme.onSurface,
      surfaceContainerHighest: scheme.surfaceContainerHighest,
      error: scheme.error,
      onError: scheme.onError,
      outline: scheme.outline,
      outlineVariant: scheme.outlineVariant,
      scrim: scheme.scrim,
      surfaceTint: scheme.surfaceTint,
    );
  }

  static const ColorScheme _lightColorSchemeUnseeded = ColorScheme.light(
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryLight,
    onPrimaryContainer: textPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryLight,
    onSecondaryContainer: Colors.white,
    surface: background,
    onSurface: textPrimary,
    surfaceContainerHighest: surfaceVariant,
    error: error,
    onError: Colors.white,
    outline: border,
    outlineVariant: outlineVariant,
    scrim: scrim,
  );

  static const ColorScheme _darkColorSchemeUnseeded = ColorScheme.light(
    brightness: Brightness.dark,
    primary: primaryLight,
    onPrimary: darkOnPrimary,
    primaryContainer: primaryDark,
    onPrimaryContainer: Colors.white,
    secondary: secondaryLight,
    onSecondary: Colors.white,
    secondaryContainer: secondary,
    onSecondaryContainer: Colors.white,
    surface: darkSurface,
    onSurface: darkOnSurface,
    surfaceContainerHighest: darkSurfaceVariant,
    error: error,
    onError: Colors.white,
    outline: darkOutline,
    outlineVariant: darkOutlineVariant,
    scrim: scrim,
    surfaceTint: primaryLight,
  );

  @override
  ThemeData get lightTheme => _buildTheme(_lightColorScheme);

  @override
  ThemeData get darkTheme => _buildTheme(_darkColorScheme);

  static ThemeData _buildTheme(ColorScheme scheme) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: scheme.brightness,
      extensions: [
        AppSegmentedButtonTheme(
          backgroundColor: Colors.grey.shade200,
          selectedColor: Colors.white,
          foregroundColor: Colors.black,
          selectedForegroundColor: Colors.black,
          borderRadius: 24,
          padding: const .symmetric(horizontal: 16, vertical: 8),
          animationDuration: const Duration(milliseconds: 200),
        ),
      ],
    );

    return base.copyWith(
      /// CardTheme
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),

      /// Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ElevatedButton.styleFrom(
              backgroundColor: scheme.primary,
              foregroundColor: scheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ).copyWith(
              overlayColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return scheme.primary.withOpacityModern(0.1);
                }
                return null;
              }),
            ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.outline),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: scheme.primary),
      ),

      // Input поля
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: scheme.error, width: 1.5),
        ),
      ),

      // // Чекбоксы, радиокнопки, переключатели
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(color: scheme.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primary;
          }
          return scheme.onSurfaceVariant;
        }),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primary;
          }
          return scheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primaryContainer;
          }
          return scheme.outlineVariant;
        }),
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: scheme.primary),
        actionsIconTheme: IconThemeData(color: scheme.primary),
      ),

      // Bottom Navigation
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurface,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      // Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
      ),

      // Разделители
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 0,
      ),

      // Progress indicators
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.outlineVariant,
        circularTrackColor: scheme.outlineVariant,
      ),
      //
      //   // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: TextStyle(color: scheme.onInverseSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      //
      //   // Диалоги
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        titleTextStyle: TextStyle(color: scheme.onSurface),
        contentTextStyle: TextStyle(color: scheme.onSurface),
      ),
      //
      //   // Chip
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerHighest,
        selectedColor: scheme.primary,
        disabledColor: scheme.outlineVariant,
        labelStyle: TextStyle(color: scheme.onSurface),
        secondaryLabelStyle: TextStyle(color: scheme.onPrimary),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      /// Segmented buttons
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          shape: const StadiumBorder(),
          side: .none,
          padding: const .symmetric(horizontal: 18, vertical: 10),
          foregroundColor: scheme.onSurface,
          selectedForegroundColor: scheme.onPrimary,
          backgroundColor: scheme.surfaceContainerHighest,
          selectedBackgroundColor: scheme.primary,
          elevation: 0,
          minimumSize: const Size(0, 36),
          visualDensity: .compact,
          tapTargetSize: .shrinkWrap,
          alignment: .center,
          animationDuration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
