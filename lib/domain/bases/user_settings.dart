part of 'user.dart';

@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    bool? dontAskDetails,
  }) = _UserSettings;
}