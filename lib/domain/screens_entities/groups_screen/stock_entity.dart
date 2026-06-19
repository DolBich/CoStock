import 'package:co_stock/data/repositories/repos/groups_repo/dto/stock_entities_dtos.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';
import 'package:equatable/equatable.dart';

/// Описывает класс для работы на экране групп
/// Пока что это только карточки группы и инвентаря
/// [freezed] плохо работает с наследованиями, поэтому здесь без него
abstract class StockEntity extends Equatable {
  final String id;
  final String name;
  final StockEntity? parent;

  const StockEntity({required this.id, required this.name, this.parent});

  /// Геттер для определения что за тип у этой сущности
  StockEntityType get type;

  StockEntity copyWith({String? id, String? name, StockEntity? parent});

  /// Полный путь от корня до текущего узла (список имён)
  List<String> get fullPath {
    final path = <String>[];
    StockEntity? current = this;
    while (current != null) {
      path.add(current.name);
      current = current.parent;
    }
    return path.reversed.toList();
  }

  /// Предки (от корня до родителя)
  List<StockEntity> get ancestors {
    final list = <StockEntity>[];
    StockEntity? current = parent;
    while (current != null) {
      list.add(current);
      current = current.parent;
    }
    return list.reversed.toList();
  }

  /// Является ли узел корневым
  bool get isRoot => parent == null;

  /// Список имён родителей (от корня до родителя)
  List<String> get parentNames => ancestors.map((e) => e.name).toList();

  /// Есть ли у узла родитель
  bool get hasParent => parent != null;

  /// Получить братьев по группе
  List<StockEntity> get siblings {
    final parentNode = parent;
    assert(
      parentNode is StockGroup,
      'Только StockGroup может быть родителем для другого StockEntity',
    );
    if (parentNode is! StockGroup) return [];
    return parentNode.children.where((s) => s.id != id).toList();
  }

  /// Полный путь из сущностей (от корня до текущего узла включительно)
  List<StockEntity> get pathToNode {
    final path = List<StockEntity>.from(ancestors);
    path.add(this);
    return path;
  }

  @override
  /// parent не включаем, чтобы избежать циклов
  List<Object?> get props => [id, name];
}
