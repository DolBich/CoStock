part of '../groups_screen.dart';

class _SortedGroupsGrid extends StatefulWidget {
  final List<StockEntity> groups;
  final List<StockEntity> stocks;
  final SortMode sortMode;
  final String? currentNodeId;

  const _SortedGroupsGrid({
    required this.groups,
    required this.stocks,
    required this.sortMode,
    required this.currentNodeId,
  });

  @override
  State<_SortedGroupsGrid> createState() => _SortedGroupsGridState();
}

class _SortedGroupsGridState extends State<_SortedGroupsGrid> {
  late List<StockEntity> firstSection;
  late List<StockEntity> secondSection;
  late StockEntityType firstType;
  late StockEntityType secondType;

  @override
  void initState() {
    super.initState();
    _configWidget();
  }

  @override
  void didUpdateWidget(covariant _SortedGroupsGrid oldWidget) {
    _configWidget();
    super.didUpdateWidget(oldWidget);
  }

  /// Настроить список от переданных аргументов
  void _configWidget() {
    if (widget.sortMode == .groupsFirst) {
      firstSection = widget.groups;
      secondSection = widget.stocks;
      firstType = .group;
      secondType = .stock;
    } else {
      firstSection = widget.stocks;
      secondSection = widget.groups;
      firstType = .stock;
      secondType = .group;
    }
  }

  /// Элемент какого типа мы сейчас перетаскиваем
  StockEntityType? _currentDragType;

  /// Отвечают за автоскролл
  final ScrollController _scrollController = ScrollController();

  /// На каждый тик перемещает нас на некоторую величину
  Timer? _autoScrollTimer;

  /// Как часто мы меняем нашу позиции при автоскролле
  static const _autoScrollDuration = Duration(milliseconds: 16);

  /// зона у краёв, где начинается скролл
  static const double _edgeThreshold = 60.0;

  /// На какую величину мы смещаемся на каждый тик таймера [_autoScrollTimer]
  static const double _scrollSpeed = 10.0;

  /// Срабатывает при опускании элемента списка
  void _reorderEnd() {
    _stopAutoScroll();
    setState(() => _currentDragType = null);
  }

  /// Отслеживает перемщение пальца/курсора
  void _onPointerMove(PointerMoveEvent event) {
    if (_currentDragType == null) return;
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    /// Преобразуем глобальные координаты пальца в локальные относительно виджета
    final localPosition = renderBox.globalToLocal(event.position);
    _autoScrollBasedOnPosition(localPosition);
  }

  /// Автоскролл в зависисмости от позиции
  void _autoScrollBasedOnPosition(Offset localPosition) {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final double height = renderBox.size.height;

    if (localPosition.dy < _edgeThreshold) {
      /// вверх
      _startAutoScroll(-_scrollSpeed);
    } else if (localPosition.dy > height - _edgeThreshold) {
      /// вниз
      _startAutoScroll(_scrollSpeed);
    } else {
      _stopAutoScroll();
    }
  }

  /// Запускаем автоскролл с учётом границ контента
  void _startAutoScroll(double speed) {
    /// Если таймер уже активен, не запускаем повторно
    if (_autoScrollTimer != null && _autoScrollTimer!.isActive) return;

    /// Включаем таймер для изменения позиции на каждый тик
    _autoScrollTimer = .periodic(_autoScrollDuration, (timer) {
      if (!_scrollController.hasClients) {
        timer.cancel();
        _autoScrollTimer = null;
        return;
      }

      final double currentOffset = _scrollController.offset;
      final double newOffset = currentOffset + speed;

      /// Проверяем границы: не выше 0 и не ниже maxScrollExtent
      if (newOffset <= 0.0) {
        _scrollController.jumpTo(0.0);
        timer.cancel();
        _autoScrollTimer = null;
      } else if (newOffset >= _scrollController.position.maxScrollExtent) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        timer.cancel();
        _autoScrollTimer = null;
      } else {
        _scrollController.jumpTo(newOffset);
      }
    });
  }

  /// Останавливаем автоскролл при отпускании элемента
  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: _onPointerMove,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            /// Верхняя сетка сущностей
            if (firstSection.isNotEmpty)
              _SortSectionWrapper(
                enabled:
                    _currentDragType != null && _currentDragType != firstType,
                child: _GroupsGrid(
                  physics: const NeverScrollableScrollPhysics(),
                  entities: firstSection,
                  isEditMode: false,
                  shrinkWrap: true,
                  reorderStart: () =>
                      setState(() => _currentDragType = firstType),
                  reorderEnded: _reorderEnd,
                ),
              ),

            /// Разделитель появляется только при перетаскивании
            if (firstSection.isNotEmpty && secondSection.isNotEmpty)
              Padding(
                padding: const .symmetric(vertical: 12),
                child: _currentDragType != null
                    ? Divider(
                        thickness: 2,
                        color: Theme.of(context).colorScheme.error,
                      )
                    : null,
              ),

            /// Нижняя сетка сущностей
            if (secondSection.isNotEmpty)
              _SortSectionWrapper(
                enabled:
                    _currentDragType != null && _currentDragType != secondType,
                child: _GroupsGrid(
                  physics: const NeverScrollableScrollPhysics(),
                  entities: secondSection,
                  isEditMode: false,
                  shrinkWrap: true,
                  reorderStart: () =>
                      setState(() => _currentDragType = secondType),
                  reorderEnded: _reorderEnd,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Покрытие поверх сетки для отображения запретной зоны для переноса сущности
class _SortSectionWrapper extends StatelessWidget {
  final bool enabled;
  final Widget child;

  const _SortSectionWrapper({required this.enabled, required this.child});

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      /// Накрываем запрещающим слоем
      return Stack(
        children: [
          child,
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.error.withOpacityModern(0.2),
                  borderRadius: .circular(12),
                  border: .all(
                    color: Theme.of(context).colorScheme.error,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Нельзя перемещать между типами\n в режиме сортировки',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: .bold,
                      fontSize: 14,
                    ),
                    textAlign: .center,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return child;
  }
}
