part of '../groups_screen.dart';

class _GroupsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _GroupsAppBar();

  List<Widget> get _editActions {
    return [
      /// Объединение кнопки редактирования и удаления
      BlocBuilder<GroupsBloc, GroupsState>(
        /// Смотрим по ids, а не [selectedEntities], чтобы сравнивало по
        /// меньшему числу переменных
        buildWhen: (p, c) => p.selectedIds != c.selectedIds,
        builder: (context, state) {
          final bloc = context.read<GroupsBloc>();

          return Row(
            mainAxisSize: .min,
            children: [
              /// Редактирование выбранной сущности (только если одна выбрана)
              if (state.selectedEntities.length == 1)
                IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Редактировать',
                  onPressed: () => _editSelectedEntity(
                    context,
                    state.selectedEntities.first,
                  ),
                ),

              /// Удалить выбранные сущности
              if (state.selectedEntities.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.delete),
                  tooltip: 'Удалить выбранное',
                  onPressed: () => bloc.add(const .deleteSelectedEntities()),
                ),
            ],
          );
        },
      ),

      /// Кнопка для перемещения выбранных сущностей в перемещаемые
      const _RelocateButton(),

      /// Объединение сохранения и выхода из режима редактирования
      BlocBuilder<GroupsBloc, GroupsState>(
        buildWhen: (p, c) => p.hasChanges != c.hasChanges,
        builder: (context, state) {
          final bloc = context.read<GroupsBloc>();

          return Row(
            mainAxisSize: .min,
            children: [
              /// Сохранение изменений
              IconButton(
                icon: const Icon(Icons.save),
                tooltip: 'Сохранить',
                onPressed: state.hasChanges
                    ? () => bloc.add(const .saveEditedTree())
                    : null,
              ),

              /// Выйти из режима редактирования
              IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'Выйти из редактирования',
                onPressed: () => _showExitEditDialog(context, state.hasChanges),
              ),
            ],
          );
        },
      ),
    ];
  }

  /// Шапка в режиме редактирования
  Widget get _editAppBar {
    return BlocBuilder<GroupsBloc, GroupsState>(
      buildWhen: (p, c) => p.currentNode != c.currentNode,
      builder: (context, state) {
        final theme = Theme.of(context);
        final currentNode = state.currentNode;
        final parent = currentNode?.parent;
        final title = currentNode?.name ?? '';
        final path = currentNode?.pathToNode ?? [];
        final crumbs = path.isNotEmpty
            ? StockTreeService().getSmartBreadcrumbs(path)
            : <String>[];
        final bloc = context.read<GroupsBloc>();

        return AppBar(
          /// Вовзрат к родителю
          leading: currentNode != null
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => bloc.add(.navigateNode(parent)),
                )
              : null,

          /// Показ названия группы и его умного пути
          title: Column(
            mainAxisSize: .min,
            children: [
              Text(title, style: theme.textTheme.titleMedium),
              if (crumbs.length > 1)
                _Breadcrumbs(
                  crumbs: crumbs,
                  onTap: (index) {
                    if (index < path.length) {
                      bloc.add(.navigateNode(path[index]));
                    }
                  },
                ),
            ],
          ),
          centerTitle: true,
          actions: _editActions,
        );
      },
    );
  }

  /// Редактирование выбранной сущности
  /// Возможно редактировать только если выбрана одна сущность
  void _editSelectedEntity(BuildContext context, StockEntity entity) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(24)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<GroupsBloc>(),
        child: _EntitySheet(entity),
      ),
    );
  }

  /// Диалог перед выходом из режима редактирования
  /// в случае наличия несохранённых данных
  void _showExitEditDialog(BuildContext context, bool hasChanges) {
    final bloc = context.read<GroupsBloc>();
    if (!hasChanges) {
      bloc.add(const .toggleEditMode());
      return;
    }

    /// Если есть несохранённые изменения - диалоговое окно с уточнением что с
    /// ними делать
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Несохранённые изменения'),
        content: const Text(
          'У вас есть несохранённые изменения. Что вы хотите сделать?',
        ),
        actions: [
          /// Вернуться к редактированию
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Продолжить редактирование'),
          ),

          /// Выйти без сохранения изменений
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              bloc.add(const .toggleEditMode());
            },
            child: const Text('Отменить изменения и выйти'),
          ),

          /// Сохранить и выйти
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _saveAndExit(context);
            },
            child: const Text('Сохранить и выйти'),
          ),
        ],
      ),
    );
  }

  /// Сохранить и выйти из режима редактирования
  void _saveAndExit(BuildContext context) {
    final bloc = context.read<GroupsBloc>();
    bloc.add(const .saveEditedTree());

    /// Смотрим когда закончится загрузка после сохранения нового дерева
    /// и подаём сигнал на смену режима после сохранения
    late StreamSubscription<GroupsState> sub;
    sub = bloc.stream.listen((state) {
      if (!state.isLoading && state.isEditMode) {
        bloc.add(const .toggleEditMode());
        sub.cancel();
      }
    });
  }

  /// Стрелка назад с названием родительской группы в шапке слева
  Widget get _leading {
    return BlocBuilder<GroupsBloc, GroupsState>(
      buildWhen: (p, c) =>
          p.currentNodeId != c.currentNodeId ||
          p.savedRootEntities != c.savedRootEntities,
      builder: (context, state) {
        final currentNodeId = state.currentNodeId;
        if (currentNodeId == null) return const SizedBox.shrink();

        final parent = state.savedRootEntities
            .findEntityById(currentNodeId)
            ?.parent;

        return IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
              context.read<GroupsBloc>().add(.navigateNode(parent));
          },
        );
      },
    );
  }

  /// Название нынешней группы в шапке
  Widget get _title {
    return BlocBuilder<GroupsBloc, GroupsState>(
      buildWhen: (p, c) =>
          p.currentNodeId != c.currentNodeId ||
          p.savedRootEntities != c.savedRootEntities,
      builder: (context, state) {
        final currentNodeId = state.currentNodeId;
        if (currentNodeId == null) return const SizedBox.shrink();

        final title = state.savedRootEntities
            .findEntityById(currentNodeId)
            ?.name;
        if (title == null) return const SizedBox.shrink();

        final theme = Theme.of(context);

        return Text(title, style: theme.textTheme.titleMedium);
      },
    );
  }

  /// Диалог сортировки и фильтрации
  void _showSortFilterSheet(BuildContext context) {
    final bloc = context.read<GroupsBloc>();

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(24)),
      ),
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: const _GroupsSortFilterSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsBloc, GroupsState>(
      buildWhen: (p, c) => p.isEditMode != c.isEditMode,
      builder: (context, state) {
        /// Переход на шапку в режиме редактирования
        if (state.isEditMode) return _editAppBar;

        /// Основная шапка страницы
        return AppBar(
          leading: _leading,
          title: _title,
          centerTitle: true,
          actions: [
            /// Сортировка и фильтр
            IconButton(
              icon: const Icon(Icons.filter_list),
              tooltip: 'Сортировка и фильтр',
              onPressed: () => _showSortFilterSheet(context),
            ),

            ///TODO: Пока режим редактирования полностью вырезаю через просто
            ///невозможность в него перейти через эту кнопку.
            ///Планируется совсем другая обновлённая логика режима редактирования
            /// Она уже описана в задачах
            // /// Перевод в режим редактирования
            // IconButton(
            //   icon: const Icon(Icons.edit_outlined),
            //   tooltip: 'Режим редактирования',
            //   onPressed: () =>
            //       context.read<GroupsBloc>().add(const .toggleEditMode()),
            // ),

            /// Глобальный поиск
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Поиск',
              onPressed: () {
                // TODO: открыть экран поиска
              },
            ),

            /// TODO: убрать потом это на экран профиля
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              tooltip: 'Выйти',
              onPressed: () {
                _logOut(context);
              },
            ),
          ],
        );
      },
    );
  }

  /// TODO: убрать потом это на экран профиля
  void _logOut(BuildContext context) {
      LocalStorageService.removeAuth();
      SessionService.id = null;
      context.router.replaceAll([const AuthRoute()]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Кнопка перемещения выбранных/перемещаемых сущностей в режиме редактирования
class _RelocateButton extends StatelessWidget {
  const _RelocateButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsBloc, GroupsState>(
      buildWhen: (p, c) =>
          p.movingIds != c.movingIds || p.selectedIds != c.selectedIds,
      builder: (context, state) {
        final bloc = context.read<GroupsBloc>();
        final movingCount = state.movingEntities.length;
        final selectedCount = state.selectedEntities.length;
        final hasMoving = movingCount > 0;
        final hasSelected = selectedCount > 0;
        final isActive = hasMoving || hasSelected;

        /// Текст на кнопке и подсказке
        final String label;
        final String tooltip;
        if (hasSelected) {
          label = 'Переместить';
          tooltip = 'Добавить выбранные ($selectedCount) к перемещаемым';
        } else if (hasMoving) {
          label = 'Разместить';
          tooltip = 'Разместить перемещаемые ($movingCount) в текущей группе';
        } else {
          label = 'Переместить';
          tooltip = 'Переместить (нет выбранных или перемещаемых)';
        }

        return Tooltip(
          message: tooltip,
          child: Stack(
            clipBehavior: .none,
            children: [
              /// Кнопка
              OutlinedButton.icon(
                icon: const Icon(Icons.drive_file_move_outline, size: 20),
                label: Text(label, style: const TextStyle(fontSize: 12)),
                onPressed: isActive
                    ? () => bloc.add(const .toggleMoveEntities())
                    : null,
                style: OutlinedButton.styleFrom(
                  padding: const .symmetric(horizontal: 12, vertical: 8),
                  visualDensity: .compact,
                ),
              ),

              /// Бейдж с количеством перемещаемых/добавляемых
              if (hasMoving || hasSelected)
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const .symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: .circular(10),
                    ),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: .bold,
                      ),
                      child: _buildBadgeText(
                        movingCount,
                        selectedCount,
                        hasMoving,
                        hasSelected,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  static const TextStyle _movingStyle = TextStyle(fontWeight: .bold);
  static const TextStyle _selectedStyle = TextStyle(fontWeight: .normal);

  Widget _buildBadgeText(
    int movingCount,
    int selectedCount,
    bool hasMoving,
    bool hasSelected,
  ) {
    if (hasMoving && hasSelected) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(text: '$movingCount', style: _movingStyle),
            TextSpan(text: ' +$selectedCount', style: _selectedStyle),
          ],
        ),
      );
    } else if (hasMoving) {
      return Text('$movingCount', style: _movingStyle);
    } else {
      // только selected
      return Text('+$selectedCount', style: _selectedStyle);
    }
  }
}
