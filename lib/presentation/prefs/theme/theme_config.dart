import 'dart:ui';

class ThemeConfig {
  const ThemeConfig({Color? seed, this.useSeed = false})
    : seed = seed ?? defaultSeed;

  factory ThemeConfig.classic() => const ThemeConfig(useSeed: false);

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
