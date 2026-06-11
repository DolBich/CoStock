part of 'user.dart';

/// Пользовательские настройки приложения
@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    /// Больше никогда не спрашивать/просить заполнить дополнительную
    /// информацию
    bool? dontAskDetails,
  }) = _UserSettings;
}