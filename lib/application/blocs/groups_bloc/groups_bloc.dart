import 'package:co_stock/application/services/session_service.dart';
import 'package:co_stock/application/services/stock/stock_tree_service.dart';
import 'package:co_stock/application/tools/cancel_token.dart';
import 'package:co_stock/application/tools/id_setter.dart';
import 'package:co_stock/data/local_storage/local_storage_impl/local_storage_service.dart';
import 'package:co_stock/data/repositories/repo_di/injector_manager.dart';
import 'package:co_stock/data/repositories/repos/stock_repo/dto/stock_dtos.dart';
import 'package:co_stock/domain/notifications/snack/snack_notification.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/sort_filter/sort_arrangement.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/sort_filter/sort_filter.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_entity.dart';
import 'package:co_stock/domain/screens_entities/groups_screen/stock_group.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'groups_bloc.freezed.dart';

part 'groups_event.dart';
part 'groups_state.dart';

part 'handlers/groups_error_handler.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  CancelToken? _cancelToken;

  GroupsBloc() : super(const GroupsState()) {
    on<_LoadTree>(_onLoadRootTree);
    on<_NavigateNode>(_onNavigateNode);
    on<_AddNode>(_onAddNode);
    on<_DeleteNode>(_onDeleteNode);
    on<_UpdateNode>(_onUpdateNode);
    on<_MoveNode>(_onMoveNode);
    on<_ApplySortFilter>(_onApplySortFilter);

    /// Редактирование
    on<_ToggleEditMode>(_onToggleEditMode);
    on<_SelectEntity>(_onSelectEntity);
    on<_ToggleMoveEntities>(_onToggleMoveEntities);
    on<_ConfirmMoveEntity>(_onConfirmMoveEntity);
    on<_DeleteSelectedEntities>(_onDeleteSelectedEntities);
    on<_SaveEditedTree>(_onSaveEditedTree);

    add(const .loadTree());
  }

  final _treeService = StockTreeService();
  final _repository = InjectorManager().current.stockRepository;

  void _restartOperation() {
    _cancelCurrentRequest();
    _cancelToken = CancelToken();
  }

  void _cancelCurrentRequest() {
    _cancelToken?.cancel();
    _cancelToken = null;
  }

  /// Возвращает актуальные currentNode и список детей для отображения
  /// на основе текущего состояния сервиса.
  (StockEntity?, List<StockEntity>) _computeCurrentDisplay({
    StockEntity? refundNode,
  }) {
    final currentNodeId = state.currentNodeId;
    StockEntity? node;
    if (currentNodeId != null) {
      node = _treeService.findEntityById(currentNodeId) ?? refundNode;
    }
    final children = node is StockGroup
        ? node.children
        : _treeService.rootEntities;
    return (node, children);
  }

  /// TODO[2t375t5832985]: В будущем вероятно через что-то такое мы будем периодически обновлять информацию
  /// о ныншнем дереве с сервера
  /// И если это обновление произойдёт во время режима редактирования - это может
  /// вызвать конфликт версий.
  /// Нужно продумать какую-нибудь систему, которая бы могла защитить нас от такого
  /// сценария
  Future<void> _onLoadRootTree(
    _LoadTree event,
    Emitter<GroupsState> emit,
  ) async {
    /// Отменяем предыдущий запрос и начинаем новый
    _restartOperation();
    emit(state.copyWith(isLoading: true));

    /// Запрос в репозиторий на получение всего дерева сущностей
    final result = await _repository.getUserTreeIfChanged(
      userId: SessionService.id,
      cancelToken: _cancelToken,
    );

    /// Операция отменена
    if (_cancelToken?.isCancelled == true || result == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    /// Нужно дожидаться [await result.fold] в bloc, в случае, если какой-то
    /// из его вариантов async, чтобы обработчик не закрыл этот event до того
    /// как сработает [emit] внутри ассинхронности
    await result.fold(
      (error) {
        /// TODO[2]: если нет интеренета загрузить данные из локального хранилища
        /// для просмотра (вопрос в том, чтобы понять как мы будет определять, что
        /// нет инетрнета именно
        error.report();
        emit(state.copyWith(isLoading: false));
      },
      (roots) async {
        List<StockEntity> resultRoot = List.from(roots ?? []);
        if (roots != null) {
          /// сервер вернул обновлённое дерево – кешируем
          await LocalStorageService.replaceAllStockEntities(roots).catchError((
            e,
            st,
          ) {
            AppError.client(type: .smth, error: e, stackTrace: st).report();
          });
          resultRoot = roots;
        } else {
          /// Изменений нет - берём из локального хранилища
          final localRoots = await LocalStorageService.loadStockTree()
              .catchError((e, st) {
                AppError.client(type: .smth, error: e, stackTrace: st).report();
                return null;
              });

          /// Есть локальные данные, можно ими воспользоваться
          if (localRoots != null && localRoots.isNotEmpty) {
            resultRoot = localRoots;
          } else {
            /// Нет локальных данных - надо запросить с сервера данные
            /// пусть те и не обновлялись с прошлого раза

            /// Отмена предыдущей операции и подготовка к новой
            _restartOperation();

            /// Запрос у репозитория полного дерева
            final fullResult = await _repository.getUserTree(
              userId: SessionService.id,
              cancelToken: _cancelToken,
            );

            /// Операция была отменена в репозитории
            if (_cancelToken?.isCancelled == true || fullResult == null) {
              emit(state.copyWith(isLoading: false));
              return;
            }

            await fullResult.fold(
              (error) {
                error.report();
                emit(state.copyWith(isLoading: false));
              },
              (roots) async {
                /// Локальное сохранение всего дерева
                await LocalStorageService.replaceAllStockEntities(
                  roots,
                ).catchError((e, st) {
                  AppError.client(
                    type: .smth,
                    error: e,
                    stackTrace: st,
                  ).report();
                });

                resultRoot = roots;
              },
            );
          }
        }

        /// Добавляем в сервис для построения дерева
        _treeService.replaceTree(resultRoot);

        /// Подгружаем из локального хранилища информацию о том, как пользователь
        /// расставил сущности в дереве
        final arrangement = await SortArrangement.load();

        /// Загружаем сохранённый режим сортировки
        final savedSortMode = await LocalStorageService.getSortMode();

        emit(
          state.copyWith(
            sortMode: savedSortMode,
            arrangement: arrangement,
            isLoading: false,
            savedRootEntities: resultRoot,
            currentNode: null,
            currentChildren: resultRoot,
          ),
        );

        return;
      },
    );
  }

  Future<void> _onNavigateNode(
    _NavigateNode event,
    Emitter<GroupsState> emit,
  ) async {
    final entity = event.entity;

    /// Навигация к корню
    if (entity == null) {
      emit(
        state.copyWith(
          currentNode: null,

          /// Получаем актуальный корень вне зависимости от режима
          currentChildren: _treeService.rootEntities,

          /// В любом режиме сбрасываем выбранные сущности при переходе
          selectedEntities: [],
        ),
      );
      return;
    }

    /// Поиск группы по id в дереве
    final node = _treeService.findEntityById(entity.id);
    if (node == null) {
      _GroupsErrorHandler.noNode(entity);
      return;
    }

    emit(
      state.copyWith(
        currentNode: node,

        /// Наваигация отсюда доступна только в другие группы
        currentChildren: node is StockGroup
            ? node.children
            : state.currentChildren,

        /// В любом режиме сбрасываем выбранные сущности при переходе
        selectedEntities: [],
      ),
    );
  }

  Future<void> _onAddNode(_AddNode event, Emitter<GroupsState> emit) async {
    /// Отдельная логика на случай режима редактирования
    if (state.isEditMode) return _onEditAddNode(event, emit);

    /// Отмена предыдущей операции
    if (state.isLoading) return;
    _restartOperation();
    emit(state.copyWith(isLoading: true));

    /// Запрос в репозиторий на добавление группы
    final result = await _repository.addNode(
      userId: SessionService.id,
      name: event.name,
      type: event.type,
      parentId: state.currentNodeId,
      cancelToken: _cancelToken,
    );

    /// Операция была отменена
    /// Операция была отменена в репозитории
    if (_cancelToken?.isCancelled == true || result == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    await result.fold(
      (error) {
        error.report();
        emit(state.copyWith(isLoading: false));
      },
      (newEntity) async {
        /// Регистрация новой сущности в сервисе
        _treeService.addEntity(newEntity, state.currentNodeId);

        /// Сохранение в локальном хрранилище данных о новой группе
        await LocalStorageService.saveStockEntity(newEntity).catchError((
          e,
          st,
        ) {
          AppError.client(type: .smth, error: e, stackTrace: st).report();
        });

        /// Обновляем отображаемые данные
        final updatedRoots = _treeService.rootEntities;
        final (updatedCurrent, displayed) = _computeCurrentDisplay();

        /// Оставляем displayedChildren теми же
        emit(
          state.copyWith(
            isLoading: false,
            savedRootEntities: updatedRoots,
            currentNode: updatedCurrent,
            currentChildren: displayed,
          ),
        );
      },
    );
  }

  /// Позволяет добавить новую сущность в режиме редактирвания
  /// без запросов на сервер
  /// На сервер эти данные добавятся через сохранение [_onSaveEditedTree]
  void _onEditAddNode(_AddNode event, Emitter<GroupsState> emit) {
    /// Создаём новую сущность
    final localId = IdSetter()();
    StockEntity newEntity;
    if (event.type == .group) {
      newEntity = StockGroup(
        id: localId,
        name: event.name,
        parent: state.currentNode,
      );
    } else {
      newEntity = Stock(
        id: localId,
        name: event.name,
        parent: state.currentNode,
      );
    }

    /// Добавляем её в сервисе и получаем обновлённое дерево
    _treeService.addEntity(newEntity, state.currentNodeId);

    /// Обновляем состояние из сервиса
    final updatedRoots = _treeService.rootEntities;
    final (updatedCurrent, displayed) = _computeCurrentDisplay();

    emit(
      state.copyWith(
        editRootEntities: updatedRoots,
        currentChildren: displayed,
        currentNode: updatedCurrent,
      ),
    );
    return;
  }

  Future<void> _onDeleteNode(
    _DeleteNode event,
    Emitter<GroupsState> emit,
  ) async {
    /// Отдельная логика для удаления в режиме редактирования
    if (state.isEditMode) return _onEditDeleteNode(event, emit);

    /// Отмена предыдущей операции и подготовка новой
    if (state.isLoading) return;
    _restartOperation();
    emit(state.copyWith(isLoading: true));

    /// Поиск целевой сущности на удаление
    final target = _treeService.findEntityById(event.nodeId);
    if (target == null) {
      _GroupsErrorHandler.noNodeId(event.nodeId);
      emit(state.copyWith(isLoading: false));
      return;
    }

    /// Запрос к репозиторию на удаление цели
    final result = await _repository.deleteNode(
      userId: SessionService.id,
      nodeId: event.nodeId,
      cancelToken: _cancelToken,
    );

    /// Операция была отменена в репозитории
    if (_cancelToken?.isCancelled == true || result == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    await result.fold(
      (error) {
        error.report();
        emit(state.copyWith(isLoading: false));
      },
      (_) async {
        /// Удаление сущности из дерева
        _treeService.removeEntityTree(target);

        /// Обновляем состояние экрана из сервиса
        final updatedRoots = _treeService.rootEntities;
        final (newCurrent, displayed) = _computeCurrentDisplay(
          refundNode: target.parent,
        );

        /// Удаление этой сущности в локальном хранилище
        await LocalStorageService.deleteStockEntityRecursive(
          event.nodeId,
        ).catchError((e, st) {
          AppError.client(type: .smth, error: e, stackTrace: st).report();
        });

        emit(
          state.copyWith(
            isLoading: false,
            savedRootEntities: updatedRoots,
            currentNode: newCurrent,
            currentChildren: displayed,
          ),
        );
      },
    );
  }

  /// Позволяет удалить сущность в режиме редактирвания без запросов на сервер
  /// На сервер эти данные добавятся через сохранение [_onSaveEditedTree]
  void _onEditDeleteNode(_DeleteNode event, Emitter<GroupsState> emit) {
    /// Ищем цель удаления
    final target = _treeService.findEntityById(event.nodeId);
    if (target == null) {
      _GroupsErrorHandler.noNodeId(event.nodeId);
      return;
    }

    /// Убираем из сервиса и обновляем дерево
    _treeService.removeEntityTree(target);

    /// Обновляем состояние экрана из сервиса
    final updatedRoots = _treeService.rootEntities;
    final (updatedCurrent, displayed) = _computeCurrentDisplay(
      refundNode: target.parent,
    );

    /// Убираем удалённое из selected
    /// Из moving нет возможности удалить с точки зрения UI
    final deletedId = event.nodeId;
    final newSelected = state.selectedEntities
        .where((e) => e.id != deletedId)
        .toList();

    emit(
      state.copyWith(
        editRootEntities: updatedRoots,
        currentNode: updatedCurrent,
        currentChildren: displayed,
        selectedEntities: newSelected,
      ),
    );
    return;
  }

  Future<void> _onUpdateNode(
    _UpdateNode event,
    Emitter<GroupsState> emit,
  ) async {
    if (state.isEditMode) return _onEditUpdateNode(event, emit);

    /// Отмена предыдущей опреации и подготовка новой
    if (state.isLoading) return;
    _restartOperation();
    emit(state.copyWith(isLoading: true));

    /// Запрос в репозиторий на изменение сущности
    final result = await _repository.updateNode(
      userId: SessionService.id,
      nodeId: event.nodeId,
      newName: event.newName,
      cancelToken: _cancelToken,
    );

    /// Операция была отменена
    /// Операция была отменена в репозитории
    if (_cancelToken?.isCancelled == true || result == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    await result.fold(
      (error) {
        error.report();
        emit(state.copyWith(isLoading: false));
      },
      (updated) async {
        _treeService.updateEntity(updated);

        /// Сохраняем всю сущность в локальное хранилище
        await LocalStorageService.saveStockEntity(updated);

        /// Обновляем отображаемые сущности
        final updatedRoots = _treeService.rootEntities;
        final (updatedCurrent, displayed) = _computeCurrentDisplay(
          refundNode: state.currentNode,
        );

        emit(
          state.copyWith(
            isLoading: false,
            savedRootEntities: updatedRoots,
            currentNode: updatedCurrent,
            currentChildren: displayed,
          ),
        );
      },
    );
  }

  /// Позволяет обновить сущность в режиме редактирвания без запросов на сервер
  /// На сервер эти данные добавятся через сохранение [_onSaveEditedTree]
  void _onEditUpdateNode(_UpdateNode event, Emitter<GroupsState> emit) {
    /// Поиск обовляемой сущности
    final target = _treeService.findEntityById(event.nodeId);
    if (target == null) {
      _GroupsErrorHandler.noNodeId(event.nodeId);
      return;
    }

    /// Обновление сущности в сервисе и получение обновлённого дерева
    final updated = target.copyWith(name: event.newName);
    _treeService.updateEntity(updated);

    /// Обновляем отображаемые сущности
    final updatedRoots = _treeService.rootEntities;
    final (updatedCurrent, displayed) = _computeCurrentDisplay(
      refundNode: state.currentNode,
    );

    emit(
      state.copyWith(
        editRootEntities: updatedRoots,
        currentNode: updatedCurrent,
        currentChildren: displayed,
      ),
    );
    return;
  }

  Future<void> _onMoveNode(_MoveNode event, Emitter<GroupsState> emit) async {
    /// Перемещение в режиме редактирования
    if (state.isEditMode) return _onEditMoveNode(event, emit);

    /// Перемещение в режиме сортировки
    if (state.sortMode != null) return _onSortMoveNode(event, emit);

    final node = event.node;
    final parentId = state.currentNodeId;

    /// Обновляем кастомную расстановку (без сортировки)
    final currentOrder = state.arrangement.getCustomOrderedList(
      parentId: parentId,
      physicalChildren: state.currentChildren,
    );

    /// Обновление порядка (перемещаем сущность)
    final newOrder = List<String>.from(currentOrder.map((e) => e.id));
    newOrder.removeAt(event.oldIndex);
    newOrder.insert(event.newIndex, node.id);

    /// Обновляем расстановку и сохраняем в локальном хранилище
    final newArrangement = state.arrangement.withUpdatedCustomOrder(
      parentId,
      newOrder,
    );

    /// Не ждём сохранения, чтобы в UI всё было без лагов
    newArrangement.save();

    emit(state.copyWith(arrangement: newArrangement));
  }

  /// Изменение расстановки в режиме сортировки
  /// Переместить сущность возможно только в рамках объединения других сущностей
  /// того же типа
  /// Эта расстановка сохраняется отдельно от обычной расстановки
  Future<void> _onSortMoveNode(
    _MoveNode event,
    Emitter<GroupsState> emit,
  ) async {
    final node = event.node;
    final parentId = state.currentNodeId;

    /// Получаем наши разделённые секции во время сортировки
    final sections = state.arrangement.getSortedSections(
      parentId: parentId,
      physicalChildren: state.currentChildren,
    );

    /// Определяем, к какой секции относится элемент
    final isGroup = node.type == .group;
    final currentOrder = (isGroup ? sections.groups : sections.stocks)
        .map((e) => e.id)
        .toList();

    /// Обновление порядка (перемещаем сущность)
    final newOrder = List<String>.from(currentOrder);
    newOrder.removeAt(event.oldIndex);
    newOrder.insert(event.newIndex, node.id);

    /// Обновляем распределение сущностей внутри режима сортировки и сохраняем
    /// в локальном хранилище
    final newArrangement = state.arrangement.withUpdatedSortOrder(
      parentId: parentId,
      type: node.type,
      newOrder: newOrder,
    );

    /// Не ждём сохранения, чтобы в UI всё было без лагов
    newArrangement.save();

    emit(state.copyWith(arrangement: newArrangement));
    return;
  }

  /// Позволяет перенести сущность в режиме редактирвания без запросов на сервер
  /// На сервер эти данные добавятся через сохранение [_onSaveEditedTree]
  void _onEditMoveNode(_MoveNode event, Emitter<GroupsState> emit) {
    /// Перемещаем в сервисе сущность и получаем обновлённое дерево
    _treeService.moveNode(event.node.id, event.newParentId, event.newIndex);

    /// Обновляем состояние экрана из сервиса
    final updatedRoots = _treeService.rootEntities;
    final (updatedCurrent, displayed) = _computeCurrentDisplay();

    emit(
      state.copyWith(
        currentNode: updatedCurrent,
        editRootEntities: updatedRoots,
        currentChildren: displayed,
      ),
    );
    return;
  }

  void _onApplySortFilter(_ApplySortFilter event, Emitter<GroupsState> emit) {
    emit(
      state.copyWith(sortMode: event.sortMode, filterMode: event.filterMode),
    );

    /// Сохраняем выбранные режимы (можем не ждать)
    LocalStorageService.saveSortMode(event.sortMode);
  }

  ///
  /// Режим редактирования
  ///

  Future<void> _onToggleEditMode(
    _ToggleEditMode event,
    Emitter<GroupsState> emit,
  ) async {
    if (state.isEditMode) {
      /// Выход из режима редактирования - возвращаем основное дерево
      _treeService.replaceTree(state.savedRootEntities);

      /// Восстанавливаем текущую позицию из сохранённого дерева
      final (restoredCurrent, children) = _computeCurrentDisplay();

      emit(
        state.copyWith(
          isEditMode: false,
          editRootEntities: [],
          selectedEntities: [],
          movingEntities: [],
          currentNode: restoredCurrent,
          currentChildren: children,
        ),
      );
      return;
    }

    /// Переход в режм редактирования
    final editRoots = List<StockEntity>.from(state.savedRootEntities);

    emit(
      state.copyWith(
        isEditMode: true,
        editRootEntities: editRoots,
        selectedEntities: [],
        movingEntities: [],
      ),
    );
  }

  Future<void> _onToggleMoveEntities(
    _ToggleMoveEntities event,
    Emitter<GroupsState> emit,
  ) async {
    /// Не можем вызвать в обычном режиме
    if (!state.isEditMode) return;

    /// Если есть выбранные сущности - переводим их в перемещаемые
    if (state.selectedEntities.isNotEmpty) {
      final newMoving = List<MovingEntityInfo>.from(state.movingEntities);

      /// Оперделяем положение сущности в сетке
      for (final sel in state.selectedEntities) {
        final idx = state.currentChildren.indexWhere((e) => e.id == sel.id);
        newMoving.add(
          MovingEntityInfo(entity: sel, originalIndex: idx == -1 ? 0 : idx),
        );
      }

      /// Удаляем выбранные из сервиса (edit-дерева)
      for (final sel in state.selectedEntities) {
        _treeService.removeEntityTree(sel);
      }

      /// Обновляем состояние экрана из сервиса
      final updatedRoots = _treeService.rootEntities;
      final (updatedCurrent, displayed) = _computeCurrentDisplay();

      emit(
        state.copyWith(
          movingEntities: newMoving,
          selectedEntities: [],
          currentNode: updatedCurrent,
          currentChildren: displayed,
          editRootEntities: updatedRoots,
        ),
      );
      return;
    }

    /// Если нет выбранных - переносим перемещаемые сущности в нынешнюю группу
    if (state.movingEntities.isNotEmpty) {
      final sorted = List<MovingEntityInfo>.from(state.movingEntities)
        ..sort((a, b) => a.originalIndex.compareTo(b.originalIndex));

      /// Вставляем в сервис перемещаемые сущности под выбраным индексом
      for (final m in sorted) {
        _treeService.insertEntity(
          m.entity,
          state.currentNodeId,
          m.originalIndex,
        );
      }

      /// Обновляем состояние экрана из сервиса
      final updatedRoots = _treeService.rootEntities;
      final (updatedCurrent, displayed) = _computeCurrentDisplay();

      emit(
        state.copyWith(
          movingEntities: [],
          currentNode: updatedCurrent,
          currentChildren: displayed,
          editRootEntities: updatedRoots,
        ),
      );
    }
  }

  Future<void> _onSelectEntity(
    _SelectEntity event,
    Emitter<GroupsState> emit,
  ) async {
    /// Работает только в режиме редактирования
    if (!state.isEditMode) return;

    final entity = event.entity;
    final isSelected = state.selectedIds.contains(entity.id);
    if (isSelected) {
      /// Если элемент уже был выбраным - убираем из выбранных
      emit(
        state.copyWith(
          selectedEntities: state.selectedEntities
              .where((e) => e.id != entity.id)
              .toList(),
        ),
      );
    } else {
      /// Иначе - добавляем к выбраным
      emit(
        state.copyWith(selectedEntities: [...state.selectedEntities, entity]),
      );
    }
  }

  Future<void> _onConfirmMoveEntity(
    _ConfirmMoveEntity event,
    Emitter<GroupsState> emit,
  ) async {
    /// Доступно только в режиме редактирования
    if (!state.isEditMode) return;

    /// Ищем индекс нужного нам перемещаемой сущности
    final id = event.id;
    final movingIndex = state.movingEntities.indexWhere(
      (m) => m.entity.id == id,
    );
    if (movingIndex == -1) return;

    final moving = state.movingEntities[movingIndex];

    /// Получаем текущий отображаемый список (с перемещаемыми)
    final displayed = state.children;

    /// Находим индекс этой сущности в отображаемом списке
    final visualIndex = displayed.indexWhere((e) => e.id == id);

    /// Удаляем из moving
    final newMoving = List<MovingEntityInfo>.from(state.movingEntities)
      ..removeAt(movingIndex);

    /// Вставляем в текущую группу с этим индексом
    _treeService.insertEntity(
      moving.entity,
      state.currentNodeId,
      visualIndex == -1 ? state.currentChildren.length : visualIndex,
    );

    /// Обновляем состояние экрана из сервиса
    final updatedRoots = _treeService.rootEntities;
    final (updatedCurrent, newChildren) = _computeCurrentDisplay();

    emit(
      state.copyWith(
        currentNode: updatedCurrent,
        movingEntities: newMoving,
        currentChildren: newChildren,
        editRootEntities: updatedRoots,
      ),
    );
  }

  Future<void> _onDeleteSelectedEntities(
    _DeleteSelectedEntities event,
    Emitter<GroupsState> emit,
  ) async {
    /// Доступно только в режиме редактироания и если есть выбранные
    if (!state.isEditMode || state.selectedEntities.isEmpty) return;

    /// Удаляем каждую выбранную сущность из сервиса
    for (final entity in state.selectedEntities) {
      _treeService.removeEntityTree(entity);
    }

    /// Обновляем состояние экрана из сервиса
    final updatedRoots = _treeService.rootEntities;
    final (updatedCurrent, displayed) = _computeCurrentDisplay();

    emit(
      state.copyWith(
        selectedEntities: [],
        currentChildren: displayed,
        editRootEntities: updatedRoots,
        currentNode: updatedCurrent,
      ),
    );
  }

  Future<void> _onSaveEditedTree(
    _SaveEditedTree event,
    Emitter<GroupsState> emit,
  ) async {
    /// Доступно только в режиме редактирования
    if (!state.isEditMode) return;

    /// Отменяем предыдущий запрос и начинаем новый
    _restartOperation();
    emit(state.copyWith(isLoading: true));

    /// Отправляем запрос на сохранение всего обновлённого дерева
    final result = await _repository.saveFullTree(
      userId: SessionService.id,
      roots: state.editRootEntities,
      cancelToken: _cancelToken,
    );

    /// Операция была отменена в репозитории
    if (_cancelToken?.isCancelled == true || result == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    await result.fold(
      (error) {
        error.report();
        emit(state.copyWith(isLoading: false));
      },
      (_) async {
        /// Сервер сохранил успешно – теперь сохраняем локально
        await LocalStorageService.replaceAllStockEntities(
          state.editRootEntities,
        ).catchError((e, st) {
          /// Локальное сохранение не удалось, но сервер уже обновлён
          /// По идее ничего страшного, просто при отсутсвии интернета не получится
          /// посмотреть в обновлённое дерево
          AppError.client(type: .smth, error: e, stackTrace: st).report();
        });

        /// Обновляем последнее сохранённое дерево, не выходя из режима редактирования
        emit(
          state.copyWith(
            isLoading: false,
            savedRootEntities: state.editRootEntities,
          ),
        );
      },
    );
  }
}
