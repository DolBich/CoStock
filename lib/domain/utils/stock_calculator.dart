import 'package:co_stock/domain/screens_entities/groups_screen/stock.dart';

class StockCalculator {
  /// Возвращает общее количество товаров во всех хранилищах
  static int calculateTotalItems(List<Stock> stocks) {
    int total = 0;
    for (var stock in stocks) {
      for (var item in stock.items) {
        total == total + item.count;
      }
    }
    return total;
  }
}