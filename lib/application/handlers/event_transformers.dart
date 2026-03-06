import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

/// Трансформер, который группирует события по ключу и внутри каждой группы
/// работает как restartable (последнее событие отменяет предыдущее в группе).
/// События с разными ключами обрабатываются параллельно.
EventTransformer<Event> restartableByKey<Event, Key>(
  Key Function(Event) getKey,
) {
  return (events, mapper) {
    return events.groupBy(getKey).flatMap((group) => group.switchMap(mapper));
  };
}

EventTransformer<Event> restartable<Event>() {
  return (events, mapper) => events.switchMap(mapper);
}

/// Трансформер, который игнорирует все новые события того же типа,
/// пока обработка предыдущего события не завершится.
/// После завершения обработки следующее событие (если оно поступило) начнёт обработку.
EventTransformer<Event> droppableByKey<Event, Key>(Key Function(Event) getKey) {
  return (events, mapper) {
    return events.groupBy(getKey).flatMap((group) => group.exhaustMap(mapper));
  };
}

EventTransformer<Event> droppable<Event>() {
  return (events, mapper) => events.exhaustMap(mapper);
}

/// Трансформер, который ставит события в очередь и обрабатывает их последовательно,
/// добавляя заданную задержку после завершения каждого обработчика
/// перед началом следующего.
EventTransformer<Event> sequentialByKey<Event, Key>(
    Key Function(Event) getKey,
    Duration delay,
    ) {
  return (events, mapper) {
    return events
        .groupBy(getKey)
        .flatMap((group) => group.flatMap((event) async* {
      yield* mapper(event);
      await Future.delayed(delay);
    }, maxConcurrent: 1));
  };
}

EventTransformer<Event> sequentialWithDelay<Event>(Duration delay) {
  return (events, mapper) {
    return events.flatMap((event) async* {
      yield* mapper(event);
      await Future.delayed(delay);
    }, maxConcurrent: 1);
  };
}
