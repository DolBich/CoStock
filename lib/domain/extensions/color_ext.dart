import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color withOpacityModern(double opacity) {
    return withAlpha((opacity * 255).round());
  }

  Map<String, double> toJson() {
    return {
      'red': r,
      'green': g,
      'blue': b,
      'alpha': a,
    };
  }

  static Color? fromJsonOrNull(Map<String, double> json) {
    try {
      return Color.from(
        alpha: json['alpha']!,
        red: json['red']!,
        green: json['green']!,
        blue: json['blue']!,
      );
    } catch (e) {
      debugPrint('Exception in [getThemeSeed]: $e');
      return null;
    }
  }
}
