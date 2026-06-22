import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/sort_filter/sort_filter.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';
import 'package:co_stock/domain/services/group_list_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupListService', () {
    late List<StockEntity> testEntities;

    setUp(() {
      testEntities = [
        StockGroup(id: 'g1', name: 'Группа А'),
        Stock(id: 's1', name: 'Хранилище Б'),
        StockGroup(id: 'g2', name: 'Группа В'),
        Stock(id: 's2', name: 'Хранилище Г'),
        Stock(id: 's3', name: 'Хранилище А'),
      ];
    });

    test('sortEntities не должен мутировать исходный список', () {
      final service = GroupListService();
      final originalLength = testEntities.length;
      final originalOrder = testEntities.map((e) => e.id).toList();

      service.sortEntities(testEntities, SortMode.groupsFirst);

      // ❌ Этот тест должен упасть — исходный список мутировался
      expect(testEntities.length, originalLength);
      expect(testEntities.map((e) => e.id).toList(), originalOrder);
    });

    test('sortEntities сортирует группы первыми при groupsFirst', () {
      final service = GroupListService();
      final sorted = service.sortEntities(testEntities, SortMode.groupsFirst);

      // Проверяем, что сначала идут все группы
      final types = sorted.map((e) => e.type).toList();
      final groupIndex = types.indexOf(StockEntityType.group);
      final stockIndex = types.lastIndexOf(StockEntityType.stock);

      // ❌ Этот тест должен упасть — сортировка неправильная
      expect(groupIndex, lessThan(stockIndex));

      // Проверяем, что внутри групп сохраняется порядок по имени
      final groups = sorted.whereType<StockGroup>().toList();
      expect(groups.map((e) => e.name).toList(), ['Группа А', 'Группа В']);

      // Проверяем, что внутри хранилищ сохраняется порядок по имени
      final stocks = sorted.whereType<Stock>().toList();
      expect(stocks.map((e) => e.name).toList(), ['Хранилище А', 'Хранилище Б', 'Хранилище Г']);
    });

    test('sortEntities сортирует хранилища первыми при stocksFirst', () {
      final service = GroupListService();
      final sorted = service.sortEntities(testEntities, SortMode.stocksFirst);

      // Проверяем, что сначала идут все хранилища
      final types = sorted.map((e) => e.type).toList();
      final stockIndex = types.indexOf(StockEntityType.stock);
      final groupIndex = types.lastIndexOf(StockEntityType.group);

      // ❌ Этот тест должен упасть — сортировка неправильная
      expect(stockIndex, lessThan(groupIndex));

      // Проверяем, что внутри хранилищ сохраняется порядок по имени
      final stocks = sorted.whereType<Stock>().toList();
      expect(stocks.map((e) => e.name).toList(), ['Хранилище А', 'Хранилище Б', 'Хранилище Г']);

      // Проверяем, что внутри групп сохраняется порядок по имени
      final groups = sorted.whereType<StockGroup>().toList();
      expect(groups.map((e) => e.name).toList(), ['Группа А', 'Группа В']);
    });
  });
}