import 'dart:ui';

/// Глобальная настройка темы
class ThemeConfig {
  /// ПОзволяет выбрать, использовать ли тему на основе сида и какого
  const ThemeConfig({Color? seed, this.useSeed = false})
    : seed = seed ?? defaultSeed;

  /// Построение классической темы
  factory ThemeConfig.classic() => const ThemeConfig(useSeed: false);

  /// Построение темы на основе сида
  factory ThemeConfig.seeded(Color seed) =>
      ThemeConfig(seed: seed, useSeed: true);

  final Color seed;
  final bool useSeed;

  static const Color defaultSeed = Color(0xFFFF6B35);

  ThemeConfig copyWith({Color? seed, bool? useSeed}) {
    return ThemeConfig(
      seed: seed ?? this.seed,
      useSeed: useSeed ?? this.useSeed,
    );
  }
}
