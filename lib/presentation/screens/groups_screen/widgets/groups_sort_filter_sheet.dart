part of '../groups_screen.dart';

class _GroupsSortFilterSheet extends StatefulWidget {
  const _GroupsSortFilterSheet();

  @override
  State<_GroupsSortFilterSheet> createState() => _GroupsSortFilterSheetState();
}

class _GroupsSortFilterSheetState extends State<_GroupsSortFilterSheet> {
  late SortMode? _sortMode;
  late FilterMode? _filterMode;

  @override
  void initState() {
    super.initState();

    final state = context.read<GroupsBloc>().state;
    _sortMode = state.sortMode;
    _filterMode = state.filterMode;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const .fromLTRB(24, 16, 24, 24),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 20,
        children: [
          /// Иконка свайпа
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacityModern(0.3),
                borderRadius: .circular(2),
              ),
            ),
          ),

          /// Сортировка
          _GroupsSortFilterTile<SortMode>(
            title: 'Сортировка',
            values: SortMode.values,
            initialValue: _sortMode,
            toName: (e) => e.name,
            onSelectionChanged: (e) => _sortMode = e,
          ),

          /// Фильтры
          _GroupsSortFilterTile<FilterMode>(
            title: 'Фильтр',
            values: FilterMode.values,
            initialValue: _filterMode,
            toName: (e) => e.name,
            onSelectionChanged: (e) => _filterMode = e,
          ),

          /// Кнопка применения фильтров и сортировки
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<GroupsBloc>().add(
                      .applySortFilter(
                        sortMode: _sortMode,
                        filterMode: _filterMode,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Применить'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    context.read<GroupsBloc>().add(
                      const .applySortFilter(sortMode: null, filterMode: null),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Сбросить'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GroupsSortFilterTile<T> extends StatefulWidget {
  final String title;
  final List<T> values;
  final String Function(T) toName;
  final T? initialValue;
  final void Function(T?) onSelectionChanged;

  const _GroupsSortFilterTile({
    required this.title,
    required this.values,
    required this.toName,
    this.initialValue,
    required this.onSelectionChanged,
  });

  @override
  State<_GroupsSortFilterTile<T>> createState() =>
      _GroupsSortFilterTileState<T>();
}

class _GroupsSortFilterTileState<T> extends State<_GroupsSortFilterTile<T>> {
  late T? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        Text(widget.title, style: theme.textTheme.titleSmall),

        AppSegmentedButton(
          segments: widget.values.map((e) {
            return AppSegmentButton(value: e, label: Text(widget.toName(e)));
          }).toList(),
          selected: selected,
          onChanged: (value) {
            if (value == null) return;
            if (selected == value) value = null;
            widget.onSelectionChanged(value);
            setState(() => selected = value);
          },
        ),
      ],
    );
  }
}
