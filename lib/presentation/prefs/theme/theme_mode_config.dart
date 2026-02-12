import 'dart:ui';

class ThemeModeConfig {
  const ThemeModeConfig({Color? seed, this.useSeed = false})
    : seed = seed ?? defaultSeed;

  factory ThemeModeConfig.classic() => const ThemeModeConfig(useSeed: false);

  factory ThemeModeConfig.seeded(Color seed) =>
      ThemeModeConfig(seed: seed, useSeed: true);

  final Color seed;
  final bool useSeed;

  static const Color defaultSeed = Color(0xFFFF6B35);

  ThemeModeConfig copyWith({Color? seed, bool? useSeed}) {
    return ThemeModeConfig(
      seed: seed ?? this.seed,
      useSeed: useSeed ?? this.useSeed,
    );
  }
}
