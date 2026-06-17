part of 'stock_bloc.dart';

@freezed
sealed class StockState with _$StockState {
  const factory StockState({
    @Default(false) bool isLoading,
    StockEntity? stockEntity,          // данные самого склада (название, путь)
    @Default([]) List<StockItem> items, // текущие элементы
    // Может быть режим редактирования, но пока не нужен
  }) = _StockState;
}