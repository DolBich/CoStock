import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';

/// Объединение нескольких [StockEntity] (групп и инвентарей)
/// [freezed] плохо работает с наследованиями, поэтому здесь без него
class StockGroup extends StockEntity {
  final List<StockEntity> children;

  const StockGroup({
    required super.id,
    required super.name,
    super.parent,
    this.children = const [],
  });

  @override
  StockEntityType get type => .group;

  /// Есть ли дети
  bool get hasChildren => children.isNotEmpty;

  /// Является ли узел листом
  bool get isLeaf => children.isEmpty;

  /// Список имён всех потомков
  List<String> get descendantNames => descendants.map((e) => e.name).toList();

  /// Количество прямых детей
  int get directChildrenCount => children.length;

  /// Все потомки
  List<StockEntity> get descendants {
    final result = <StockEntity>[];
    void traverse(StockGroup group) {
      for (final child in group.children) {
        result.add(child);
        if (child is StockGroup) traverse(child);
      }
    }
    traverse(this);
    return result;
  }

  /// Найти узел по ID во всём поддереве
  StockEntity? findNodeById(String targetId) {
    if (id == targetId) return this;
    for (final child in children) {
      final found = child is StockGroup
          ? child.findNodeById(targetId)
          : child.id == targetId ? child : null;
      if (found != null) return found;
    }
    return null;
  }

  @override
  StockGroup copyWith({
    String? id,
    String? name,
    StockEntity? parent,
    List<StockEntity>? children,
  }) {
    return StockGroup(
      id: id ?? this.id,
      name: name ?? this.name,
      parent: parent ?? this.parent,
      children: children ?? this.children,
    );
  }

  @override
  /// [children] просматриваем только по [id], чтобы не было рекурсии
  List<Object?> get props => [id, name, children.map((c) => c.id).toList()];
}
