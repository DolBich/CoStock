part of '../groups_screen.dart';

/// Карточка используемая для обозначения карточки в сетке и карточки при
/// выборе типа сущности (при её создании)
/// Если [entity] == null - используется для выбора типа
/// [entity] != null - используется в сетке
/// Мы обязательно должны иметь инфорацию о том, с каким типом сущности [StockEntityType]
/// мы имеем дело
class _StockCard extends StatelessWidget {
  final StockEntity? entity;
  final StockEntityType? type;
  final Function()? onTap;
  final double? width;
  final double? height;

  /// В меню выбора типа нужно обозначать, что выбран этот тип (эта карточка)
  final bool isSelected;

  /// В сетке сущностей некоторый функционал доступен только в обычном режиме,
  /// а некоторый только в режиме редактирования
  final bool isEditMode;

  /// В сетке эту карточку можно перемещать и для визуального обозначения этого
  /// можно слегка менять его стиль
  final bool isMoving;

  const _StockCard({
    super.key,
    this.entity,
    this.type,
    this.onTap,
    this.width,
    this.height,
    this.isSelected = false,
    this.isEditMode = false,
    this.isMoving = false,
  }) : assert(
         type != null || entity != null,
         'Мы должны иметь источник информации о том, с каким типом сущности мы работаем',
       );

  /// Стоит [assert], так что не боимся ошибки отсюда
  StockEntityType get getType => (entity?.type ?? type)!;

  /// Название сущности или типа сущности по середине карточки
  Widget _entityName(BuildContext context) {
    return FittedBox(
      fit: .scaleDown,
      child: Text(
        entity?.name ?? getType.typeName,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: .w600),
        maxLines: 2,
        textAlign: .center,
      ),
    );
  }

  /// Меню редактирования в правом верхнем углу
  Widget _editMenu(BuildContext context) {
    return PopupMenuButton<_EditAction>(
      icon: const Icon(Icons.more_vert, size: 20),
      padding: .zero,
      color: Theme.of(context).colorScheme.surface,
      onSelected: (value) => value.act(context, entity!),
      itemBuilder: (_) => List.generate(_EditAction.values.length, (i) {
        final action = _EditAction.values[i];
        return PopupMenuItem(value: action, child: action.tile);
      }),
    );
  }

  /// Форма карточки
  ShapeBorder _cardShape(BuildContext context) => RoundedRectangleBorder(
    borderRadius: .circular(16),
    side: BorderSide(color: getType.color(context), width: isSelected ? 2 : 1),
  );

  @override
  Widget build(BuildContext context) {
    final entity = this.entity;
    final isInGrid = entity != null;

    return GestureDetector(
      key: key,
      onTap:
          onTap ??
          (isInGrid
              ? () => context.read<GroupsBloc>().add(.navigateNode(entity))
              : null),
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          clipBehavior: .antiAlias,
          shape: _cardShape(context),
          child: Stack(
            children: [
              /// Иконка типа
              Center(child: getType.icon(context)),

              /// Название сущности
              Center(
                child: Padding(
                  padding: const .all(16),
                  child: _entityName(context),
                ),
              ),

              /// Меню редактирования карточки
              if (isInGrid && !isEditMode)
                Positioned(top: 0, right: 0, child: _editMenu(context)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Какие действия нам доступны над сущностью в [_StockCard]
enum _EditAction { edit, delete }

/// Элементы визуала действия
extension _EditActionUI on _EditAction {
  /// Наименование действий
  String get name {
    switch (this) {
      case .delete:
        return 'Удалить';
      case .edit:
        return 'Редактировать';
    }
  }

  /// Иконка действия
  IconData get icon {
    switch (this) {
      case .delete:
        return Icons.delete_forever;
      case .edit:
        return Icons.edit;
    }
  }

  /// Цвет действия
  Color? get color {
    switch (this) {
      case .delete:
        return Colors.red;
      default:
        return null;
    }
  }

  /// Сборка визуальных элементов типа действия в единный виджет
  Widget get tile {
    return Row(
      mainAxisSize: .min,
      spacing: 4,
      children: [
        Icon(icon, color: color,),
        Text(name, style: TextStyle(color: color),)
      ],
    );
  }
}

/// Что происходит при выборе этого действия
extension _EditActionFunction on _EditAction {
  /// Открытие формы для редактирования сущности
  void _editEntity(BuildContext context, StockEntity entity) {
    final bloc = context.read<GroupsBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(24)),
      ),
      builder: (_) =>
          BlocProvider.value(value: bloc, child: _EntitySheet(entity)),
    );
  }

  /// Совершить действие в соответствии с типом дейсвтия
  void act(BuildContext context, StockEntity entity) {
    switch (this) {
      case .delete:
        return context.read<GroupsBloc>().add(.deleteNode(entity.id));
      case .edit:
        return _editEntity(context, entity);
    }
  }
}
