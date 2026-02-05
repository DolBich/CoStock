import 'dart:ui';

extension ColorOpacityExtension on Color {
  Color withOpacityModern(double opacity) {
    return withAlpha((opacity * 255).round());
  }
}
