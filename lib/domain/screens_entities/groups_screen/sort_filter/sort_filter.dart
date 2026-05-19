/// Убрал отсюда [custom] чтобы варианты помещались на экран
enum SortMode { groupsFirst, stocksFirst }

/// Убрал отсюда [all] чтобы варианты помещались на экран
enum FilterMode { groupsOnly, stocksOnly }

// extension FilterModeTransformation on FilterMode {
//   List<StockEntity> filter(List<StockEntity> values) {
//     switch (this) {
//       case .groupsOnly:
//         return values.whereType<StockGroup>().toList();
//       case .stocksOnly:
//         return values.whereType<Stock>().toList();
//     }
//   }
// }
//
// extension SortModeTransformation on SortMode {
//   List<StockEntity> sort(List<StockEntity> values) {
//     final List<Stock> stocks = [];
//     final List<StockGroup> groups = [];
//
//     for (final value in values) {
//       value is Stock
//           ? stocks.add(value)
//           : value is StockGroup
//           ? groups.add(value)
//           : () {/*Do nothing*/};
//     }
//
//     switch (this) {
//       case .stocksFirst:
//         return [...stocks, ...groups];
//       case .groupsFirst:
//         return [...groups, ...stocks];
//     }
//   }
// }

extension FilterModeTitle on FilterMode {
  String get name {
    switch (this) {
      case .groupsOnly:
        return 'Без хранилищ';
      case .stocksOnly:
        return 'Без групп';
    }
  }
}

extension SortModeTitle on SortMode {
  String get name {
    switch (this) {
      case .stocksFirst:
        return 'Группы внизу';
      case .groupsFirst:
        return 'Группы вверху';
    }
  }
}
