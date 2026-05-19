import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';

extension StockEntitySearcher on List<StockEntity> {
  /// Ищет узел среди всех корней и их потомков
  StockEntity? findEntityById(String id) {
    for (final root in this) {
      if (root.id == id) return root;
      if (root is StockGroup) {
        final found = root.findNodeById(id);
        if (found != null) return found;
      }
    }
    return null;
  }
}