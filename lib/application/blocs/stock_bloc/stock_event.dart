part of 'stock_bloc.dart';

@freezed
sealed class StockEvent with _$StockEvent {
  const factory StockEvent.loadStock(String stockId) = _LoadStock;
  const factory StockEvent.reorderItems(int oldIndex, int newIndex) = _ReorderItems;
  const factory StockEvent.swipeAction(String itemId, SwipeAction action) = _SwipeAction; // удаление, редактирование и т.п.
  const factory StockEvent.openAddEditScreen({StockItem? item}) = _OpenAddEditScreen;
  const factory StockEvent.addItem(StockItem item) = _AddItem;
  const factory StockEvent.updateItem(StockItem item) = _UpdateItem;
  const factory StockEvent.deleteItem(String itemId) = _DeleteItem;
}