/// Local Storage Keys
/// Ключи для сохранения в локальном хранилище
class LSKeys {
  /// Ключ для сохранения выбранной локали приложения
  static const String appLocale = 'app_locale';
  /// Ключ для сохранения системной локали телефона
  static const String phoneLocale = 'phone_locale';
  /// Ключ для сохранения флага использования цвета-сида в теме
  static const String useSeed = 'use_seed';
  /// Ключ для сохранения режима темы (светлая/тёмная/системная)
  static const String themeMode = 'theme_mode';
  /// Ключ для сохранения цвета-сида темы
  static const String themeSeed = 'theme_seed';
  /// Ключ для сохранения флага использования мок-репозитория
  static const String useMock = 'use_mock';
  /// Ключ для сохранения идентификатора пользователя (сессия)
  static const String userId = 'user_id';
  /// Префикс ключа для сохранения отдельной сущности [StockEntity] (добавляется id)
  static const String stockEntityPrefix = 'stock_entity_';
  /// Ключ для хранения списка всех id сущностей [StockEntity]
  static const String stockEntityIds = 'stock_entity_ids';
  /// Префикс ключа для сохранения отдельного предмета [StockItem] (добавляется id)
  static const String stockItemPrefix = 'stock_item_';
  /// Префикс ключа для хранения списка id предметов конкретного хранилища (добавляется stockId)
  static const String stockItemIdsPrefix = 'stock_item_ids_';
  /// Ключ для хранения данных [SortArrangement] (порядок отображения сущностей)
  static const String sortArrangementKey = 'sort_arrangement';
  /// Ключ для сохранения выбранного режима сортировки
  static const String sortModeKey = 'sort_mode';
  /// Префикс ключа для хранения конкретного [ProductTemplate] (добавляется [ProductTemplate.id])
  static const String productTemplatePrefix = 'product_template_';
  /// Ключ для хранения списка всех хранимых [ProductTemplate]
  static const String productTemplateIds = 'product_template_ids';
  /// Префикс ключа для хранения конкретного [ImageAsset] (добавляется [ImageAsset.id])
  static const String imageAssetPrefix = 'image_asset_';
  /// Ключ для хранения списка всех хранимых [ImageAsset]
  static const String imageAssetIds = 'image_asset_ids';
}