import 'package:co_stock/presentation/prefs/theme/theme_extensions/app_segmented_button_theme.dart';
import 'package:flutter/material.dart';

/// Кастомный виджет для выбора одного варианта из нескольких
/// Выглядит как SegmentedButton с закосом под стиль telegram
class AppSegmentButton<T> {
  final T value;
  final Widget label;
  final IconData? icon;

  const AppSegmentButton({required this.value, required this.label, this.icon});
}

class AppSegmentedButton<T> extends StatelessWidget {
  final List<AppSegmentButton<T>> segments;
  final T selected;
  final ValueChanged<T> onChanged;

  const AppSegmentedButton({
    super.key,
    required this.segments,
    required this.selected,
    required this.onChanged,
  });

  static const double _padding = 4;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppSegmentedButtonTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = (constraints.maxWidth - 2 * _padding) / segments.length;
        final index = segments.indexWhere((e) => e.value == selected);

        return Container(
          padding: const .all(_padding),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: .circular(theme.borderRadius),
          ),
          child: Stack(
            children: [
              /// Ездящая таблетка
              if(index != -1) AnimatedPositioned(
                duration: theme.animationDuration,
                curve: Curves.ease,
                left: index * width,
                width: width,
                top: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.selectedColor,
                    borderRadius: .circular(theme.borderRadius),
                  ),
                ),
              ),

              /// Варианты выбора
              Row(
                children: segments.map((segment) {
                  final isSelected = segment.value == selected;

                  return Expanded(
                    child: InkWell(
                      borderRadius: .circular(theme.borderRadius),
                      onTap: () => onChanged(segment.value),
                      child: Padding(
                        padding: theme.padding,
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            if (segment.icon != null)
                              Icon(segment.icon, size: 18),
                            if (segment.icon != null) const SizedBox(width: 6),
                            DefaultTextStyle(
                              style: TextStyle(
                                color: theme.foregroundColor,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                              child: segment.label,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
