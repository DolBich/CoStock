part of 'user.dart';

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    bool? dontAskDetails,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);
}