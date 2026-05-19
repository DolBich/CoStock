import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';

extension StockTreeCounter on Iterable<StockEntity> {
  /// Общее количество узлов (сущностей) во всём дереве, включая вложенных детей.
  int get totalNodeCount {
    int count = 0;
    for (final entity in this) {
      count++;
      if (entity is StockGroup) {
        count += entity.children.totalNodeCount;
      }
    }
    return count;
  }
}

extension SingleEntityCounter on StockEntity {
  /// Сколько всего узлов в поддереве, начиная с этой сущности (включая её саму).
  int get subtreeNodeCount {
    if (this is StockGroup) {
      return 1 + (this as StockGroup).children.totalNodeCount;
    }
    return 1;
  }
}