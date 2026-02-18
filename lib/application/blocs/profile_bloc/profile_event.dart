part of 'profile_bloc.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.init() = _Init;

  const factory ProfileEvent.changeLogin(String? login) = _ChangeLogin;

  const factory ProfileEvent.changePhone(String? phone) = _ChangePhone;

  const factory ProfileEvent.changeEmail(String? email) = _ChangeEmail;

  const factory ProfileEvent.changePassword(String password) = _ChangePassword;

  const factory ProfileEvent.changeName(String name) = _ChangeName;
}