part of 'groups_screen.dart';

class _GroupsForm extends StatelessWidget {
  const _GroupsForm();

  /// Добавление новой сущности
  Widget _addButton(BuildContext context) {
    final bloc = context.read<GroupsBloc>();

    return FloatingActionButton.extended(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: .vertical(top: .circular(24)),
          ),
          builder: (_) => BlocProvider<GroupsBloc>.value(
            value: bloc,
            child: const _EntitySheet(),
          ),
        );
      },
      icon: const Icon(Icons.add),
      label: const Text('Добавить'),
    );
  }

  /// Тело страницы с сеткой сущностей
  Widget get _body {
    return BlocBuilder<GroupsBloc, GroupsState>(
      buildWhen: (p, c) =>
          p.isLoading != c.isLoading ||
          p.children != c.children ||
          p.sortMode != c.sortMode ||
          p.filterMode != c.filterMode ||
          p.arrangement != c.arrangement,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        /// Кастомная расстановка
        final entities = state.customOrderedChildren;
        if (entities.isEmpty) {
          return const Center(child: Text('Пока ничего нет'));
        }

        /// Режим редактирования — всегда единый список с moving entities
        if (state.isEditMode) {
          return _GroupsGrid(entities: entities, isEditMode: true);
        }

        /// Режим сортировки
        if (state.sortMode != null || state.filterMode != null) {
          final sections = state.sortedSections;
          final groups = sections.groups;
          final stocks = sections.stocks;

          if (state.filterMode != null) {
            /// Проверка на наличие нужных сущностей
            if(state.filterMode == .groupsOnly && groups.isEmpty) {
              return const Center(child: Text('Здесь нет никаких групп'));
            }

            /// Проверка на наличие нужных сущностей
            if(state.filterMode == .stocksOnly && stocks.isEmpty) {
              return const Center(child: Text('Здесь нет никаких хранилищ'));
            }

            return _GroupsGrid(
              entities: state.filterMode == .groupsOnly ? groups : stocks,
              isEditMode: false,
            );
          }

          if (groups.isEmpty && stocks.isEmpty) {
            return const Center(child: Text('Пока ничего нет'));
          }

          return _SortedGroupsGrid(
            groups: groups,
            stocks: stocks,
            sortMode: state.sortMode!,
            currentNodeId: state.currentNodeId,
          );
        }

        return _GroupsGrid(entities: entities, isEditMode: false);
      },
    );
  }

  /// Обеспечивает навигацию на другие страницы при переходе на хранилище [Stock]
  void _listener(BuildContext context, GroupsState state) {
    final entity = state.currentNode;
    if (entity == null) return;

    final router = context.router;

    if (entity is Stock) router.navigate(StockRoute(stockId: entity.id));
  }

  static const _appBar = _GroupsAppBar();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupsBloc, GroupsState>(
      listenWhen: (p, c) => p.currentNodeId != c.currentNodeId,
      listener: _listener,
      child: Scaffold(
        appBar: _appBar,
        body: _body,
        floatingActionButton: _addButton(context),
      ),
    );
  }
}
