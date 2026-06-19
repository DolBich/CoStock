import 'package:co_stock/data/repositories/repos/groups_repo/dto/stock_entities_dtos.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/stock_screen/stock_item.dart';

/// Инвентарь, который хранит в себе продукты/элементы [StockItem]
/// [freezed] плохо работает с наследованиями, поэтому здесь без него
class Stock extends StockEntity {
  final List<StockItem> items;

   const Stock({
    required super.id,
    required super.name,
    super.parent,
    this.items = const [],
  });

  @override
  StockEntityType get type => .stock;

  @override
  Stock copyWith({
    String? id,
    String? name,
    StockEntity? parent,
    List<StockItem>? items,
  }) {
    return Stock(
      id: id ?? this.id,
      name: name ?? this.name,
      parent: parent ?? this.parent,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [id, name, items];
}