import 'package:co_stock/domain/screens_entities/groups_screen/stock.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_item.dart';
import 'package:co_stock/domain/utils/stock_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StockCalculator', () {
    test('calculateTotalItems возвращает сумму всех товаров', () {
      const stock1 = Stock(
        id: '1',
        name: 'Склад 1',
        items: [
          StockItem(id: 'i1', name: 'Товар 1', count: 10),
          StockItem(id: 'i2', name: 'Товар 2', count: 5),
        ],
      );
      const stock2 = Stock(
        id: '2',
        name: 'Склад 2',
        items: [
          StockItem(id: 'i3', name: 'Товар 3', count: 3),
        ],
      );
      final result = StockCalculator.calculateTotalItems([stock1, stock2]);
      expect(result, 18); // 10 + 5 + 3 = 18
    });

    test('calculateTotalItems возвращает 0 для пустого списка', () {
      final result = StockCalculator.calculateTotalItems([]);
      expect(result, 0);
    });
  });
}