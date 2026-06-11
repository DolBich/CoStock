part of '../groups_bloc.dart';

/// Предназначем для обработки ошибочных случаев, для сокращения кода в блоке
class _GroupsErrorHandler {

  /// Не получилось найти узел внутри сервиса [StockTreeService]
  static AppError noNode(StockEntity entity) {
    final f = AppError.client(
      type: .state,
      error: Exception(
        'Не был найден узел в дереве сущностей [${entity.id}]:'
            '\n${{...StockEntityDto.fromDomain(entity).toJson(), 'parent': entity.parent}} ',
      ),
      stackTrace: .current,
    );
    f.report();
    return f;
  }

  /// Не получилось найти узел внутри сервиса [StockTreeService], но известен только его id
  static AppError noNodeId(String id) {
    final f = AppError.client(
      type: .state,
      error: Exception(
        'Не был найден узел в дереве [$id]',
      ),
      stackTrace: .current,
    );
    f.report();
    return f;
  }
}