import 'package:co_stock/domain/screens_entities/groups_screen/sort_filter/sort_filter.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';

class GroupListService {
  /// Возвращает отсортированный список сущностей
  List<StockEntity> sortEntities(
      List<StockEntity> entities,
      SortMode mode,
      ) {
    final result = entities;

    if (mode == SortMode.groupsFirst) {
      result.sort((a, b) {
        if (a is StockGroup && b is Stock) return -1;
        if (a is Stock && b is StockGroup) return 1;
        return 0;
      });
    } else {
      result.sort((a, b) {
        if (a is Stock && b is StockGroup) return -1;
        if (a is StockGroup && b is Stock) return 1;
        return 0;
      });
    }

    return result;
  }
}