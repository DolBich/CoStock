import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';

/// Преобразует плоский/вложенный список [StockEntityDto] в дерево [StockEntity].
class StockMapper {
  /// Вызывается как функция: StockMapper()(rootDtos).
  List<StockEntity> call(List<StockEntityDto> rootDtos) {
    final idToEntity = <String, StockEntity>{};

    /// 1-й проход: создаём все сущности (без связей)
    void collect(StockEntityDto dto) {
      idToEntity[dto.id] = dto.toDomain();
      for (final child in dto.children) {
        collect(child);
      }
    }
    for (final root in rootDtos) {
      collect(root);
    }

    /// 2-й проход: устанавливаем parent и children
    void link(StockEntityDto dto, StockEntity? parent) {
      final entity = idToEntity[dto.id]!.copyWith(parent: parent);
      idToEntity[dto.id] = entity;
      if (entity is StockGroup) {
        final children = dto.children.map((childDto) {
          link(childDto, entity);
          return idToEntity[childDto.id]!;
        }).toList();
        idToEntity[dto.id] = entity.copyWith(children: children);
      }
    }

    for (final root in rootDtos) {
      link(root, null);
    }

    /// Возвращаем корни (те, у которых parent == null)
    return rootDtos.map((dto) => idToEntity[dto.id]!).toList();
  }
}