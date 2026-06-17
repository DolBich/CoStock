part of 'user.dart';

/// Пользовательские настройки приложения
@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    /// Больше никогда не спрашивать/просить заполнить дополнительную
    /// информацию
    bool? dontAskDetails,

    /// Какие [ProductTemplate] являются избранными у этого пользователя
    /// чтобы каждый мог сам для себя выбрать нуные ему шаблоны
    @Default([]) List<String> favoriteTemplateIds,
  }) = _UserSettings;
}