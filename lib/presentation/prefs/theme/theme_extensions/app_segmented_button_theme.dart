import 'dart:ui';

import 'package:flutter/material.dart';

/// Цветовая тема для [AppSegmentedButton]
@immutable
class AppSegmentedButtonTheme extends ThemeExtension<AppSegmentedButtonTheme> {
  final Color backgroundColor;
  final Color selectedColor;
  final Color foregroundColor;
  final Color selectedForegroundColor;
  final double borderRadius;
  final EdgeInsets padding;
  final Duration animationDuration;

  const AppSegmentedButtonTheme({
    required this.backgroundColor,
    required this.selectedColor,
    required this.foregroundColor,
    required this.selectedForegroundColor,
    required this.borderRadius,
    this.padding = EdgeInsets.zero,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  AppSegmentedButtonTheme copyWith({
    Color? backgroundColor,
    Color? selectedColor,
    Color? foregroundColor,
    Color? selectedForegroundColor,
    double? borderRadius,
    EdgeInsets? padding,
    Duration? animationDuration,
  }) {
    return AppSegmentedButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedColor: selectedColor ?? this.selectedColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      selectedForegroundColor:
      selectedForegroundColor ?? this.selectedForegroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }

  @override
  AppSegmentedButtonTheme lerp(
      ThemeExtension<AppSegmentedButtonTheme>? other,
      double t,
      ) {
    if (other is! AppSegmentedButtonTheme) return this;

    return AppSegmentedButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t)!,
      selectedForegroundColor:
      Color.lerp(selectedForegroundColor, other.selectedForegroundColor, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      animationDuration: other.animationDuration,
    );
  }
}