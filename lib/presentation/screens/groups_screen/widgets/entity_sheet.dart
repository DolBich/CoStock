part of '../groups_screen.dart';

/// Форма для добавления/редактирования сущностей [StockEntity]
class _EntitySheet extends StatefulWidget {
  /// null – создание, не null – редактирование
  final StockEntity? entity;

  const _EntitySheet([this.entity]);

  @override
  State<_EntitySheet> createState() => _EntitySheetState();
}

class _EntitySheetState extends State<_EntitySheet> {
  late final TextEditingController _nameController;
  StockEntityType? _selectedType;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.entity?.name ?? '');
    if (widget.entity != null) {
      _selectedType = widget.entity!.type;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  /// Проверка на правильность заполнения формы
  bool get _isValid {
    if (widget.entity != null) {
      return _nameController.text.trim().isNotEmpty;
    }
    return _selectedType != null && _nameController.text.trim().isNotEmpty;
  }

  /// Подтверждение выбора
  /// Добавление/Обновление
  void _submit() {
    if (!_isValid) return;
    final bloc = context.read<GroupsBloc>();
    if (widget.entity != null) {
      bloc.add(
        .updateNode(
          nodeId: widget.entity!.id,
          newName: _nameController.text.trim(),
        ),
      );
    } else {
      bloc.add(
        .addNode(name: _nameController.text.trim(), type: _selectedType!),
      );
    }
    Navigator.of(context).pop();
  }

  /// Виджет выбора типа сущности
  Widget _entityChooser(BuildContext context) {
    const types = StockEntityType.values;
    final theme = Theme.of(context);
    const double spacing = 12;

    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        Text('Тип', style: theme.textTheme.titleSmall),
        LayoutBuilder(
          builder: (context, constraints) {
            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: types.map((type) {
                /// Ширина: (доступная ширина - spacing) / 2
                final availableWidth = constraints.maxWidth - spacing;
                final itemWidth = availableWidth / 2;
                return _StockCard(
                  type: type,
                  width: itemWidth,
                  height: itemWidth,
                  isSelected: _selectedType == type,
                  onTap: () => setState(() => _selectedType = type),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  static const double _horizontalPadding = 24;

  EdgeInsetsGeometry _padding(double bottomInset) =>
      .fromLTRB(_horizontalPadding, 16, _horizontalPadding, 24 + bottomInset);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEdit = widget.entity != null;

    /// Отслеживает изменение видимой части экрана при появлении клавиатуры
    /// и даёт нам отступ равный размеру, который занимает клавиатура
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: _padding(bottomInset),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 20,
        children: [
          /// Индикатор свайпа
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

          /// Поле имени
          TextField(
            controller: _nameController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: isEdit ? 'Новое название' : 'Название',
            ),
            onChanged: (_) => setState(() {}),
            onSubmitted: (_) => _submit(),
          ),

          /// Выбор типа только при создании
          if (!isEdit) _entityChooser(context),

          /// Действие
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isValid ? _submit : null,
              child: Text(isEdit ? 'Сохранить' : 'Добавить'),
            ),
          ),
        ],
      ),
    );
  }
}
