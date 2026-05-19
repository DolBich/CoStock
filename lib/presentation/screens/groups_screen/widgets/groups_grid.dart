part of '../groups_screen.dart';

/// Сетка карточек сущностей [StockEntity]
class _GroupsGrid extends StatelessWidget {
  final List<StockEntity> entities;
  final bool isEditMode;

  /// Для режима сортировки
  final void Function()? reorderStart;
  final void Function()? reorderEnded;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const _GroupsGrid({
    required this.entities,
    required this.isEditMode,
    this.reorderStart,
    this.reorderEnded,
    this.physics,
    this.shrinkWrap = false,
  });

  /// Инструкция по расположению элементов в сетке
  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    childAspectRatio: 1.0,
  );

  /// Действие при нажатии на карточку
  void _onTap(BuildContext context, StockEntity entity) {
    final bloc = context.read<GroupsBloc>();
    if (isEditMode) {
      bloc.add(.selectEntity(entity));
    } else {
      bloc.add(.navigateNode(entity));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsBloc, GroupsState>(
      buildWhen: (p, c) =>
          p.selectedIds != c.selectedIds || p.movingIds != c.movingIds,
      builder: (context, state) {
        final selectedIds = state.selectedIds.toSet();
        final movingIds = state.movingIds.toSet();

        return ReorderableGrid(
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: const .all(16),

          /// Декоратор для перетаскиваемого элемента (под пальцем)
          proxyDecorator: (child, index, animation) {
            /// index – исходный индекс перетаскиваемого элемента
            /// animation – анимация перетаскивания (обычно не нужна, если не хотим дополнительных эффектов)
            /// child – оригинальный виджет, созданный в itemBuilder
            return Material(
              elevation: 8,
              borderRadius: .circular(16),
              child: child,
            );
          },
          itemCount: entities.length,
          gridDelegate: _gridDelegate,
          onReorderStart: (_) => reorderStart?.call(),
          onDrop: (oldIndex, newIndex) {
            reorderEnded?.call();
          },
          onReorder: (int oldIndex, int newIndex) {
            /// Срабатывает только есть [oldIndex != newIndex]
            context.read<GroupsBloc>().add(
              .moveNode(
                node: entities[oldIndex],
                oldIndex: oldIndex,
                newParentId: state.currentNodeId,
                newIndex: newIndex,
              ),
            );
          },
          itemBuilder: (context, index) {
            final entity = entities[index];
            final id = entity.id;
            final isSelected = selectedIds.contains(id);
            final isMoving = movingIds.contains(id);

            return ReorderableGridDelayedDragStartListener(
              key: ValueKey(index),
              index: index,
              child: _StockCard(
                key: ValueKey('$isEditMode-$isSelected-$isMoving-$id'),
                entity: entity,
                isSelected: isSelected,
                isEditMode: isEditMode,
                isMoving: isMoving,
                onTap: () => _onTap(context, entity),
              ),
            );
          },
        );
      },
    );
  }
}
