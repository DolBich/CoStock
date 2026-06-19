import 'package:co_stock/data/repositories/repos/groups_repo/dto/stock_entities_dtos.dart';
import 'package:co_stock/domain/extensions/color_ext.dart';
import 'package:flutter/material.dart';

extension StockEntityTypeX on StockEntityType {
  String get widgetName {
    switch (this) {
      case .stock:
        return 'StockCard';
      case .group:
        return 'GroupCard';
    }
  }

  String get typeName {
    switch (this) {
      case .stock:
        return 'Хранилище';
      case .group:
        return 'Группа';
    }
  }

  Icon icon(BuildContext context) {
    return Icon(
      iconData,
      size: 120,
      color: color(context).withOpacityModern(0.1),
    );
  }

  IconData get iconData {
    switch (this) {
      case .stock:
        return Icons.inventory_2_outlined;
      case .group:
        return Icons.folder_outlined;
    }
  }

  Color color(BuildContext context) {
    final theme = Theme.of(context);
    switch (this) {
      case .stock:
        return theme.colorScheme.secondary;
      case .group:
        return theme.colorScheme.primary;
    }
  }
}