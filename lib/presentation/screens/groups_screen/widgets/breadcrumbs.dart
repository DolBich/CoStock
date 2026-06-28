part of '../groups_screen.dart';

/// Виджет отображает умные хлебные крошки
/// Т.е. наименьший уникальный путь до данной сущности с возможностью быстро
/// перейти в конкретную группу из этого пути по нажатию
class _Breadcrumbs extends StatelessWidget {
  final List<String> crumbs;
  final ValueChanged<int> onTap;
  const _Breadcrumbs({required this.crumbs, required this.onTap});
  static const double _colorOpacity = 0.6;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      alignment: .center,
      children: crumbs
          .asMap()
          .entries
          .expand<Widget>((entry) {
        final idx = entry.key;
        final crumb = entry.value;
        final isLast = idx == crumbs.length - 1;
        return [
          TextButton(
            onPressed: () => onTap(idx),
            style: TextButton.styleFrom(
              padding: .zero,
              minimumSize: .zero,
              tapTargetSize: .shrinkWrap,
            ),
            child: Text(
              crumb,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                decoration: .underline,
              ),
            ),
          ),
          if (!isLast)
            Text(
              ' > ',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacityModern(_colorOpacity),
              ),
            ),
        ];
      })
          .toList(),
    );
  }
}