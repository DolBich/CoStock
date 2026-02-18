part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({required bool isLoading, required User? user}) =
      _ProfileState;

  factory ProfileState.initial() {
    return const ProfileState(isLoading: true, user: null);
  }
}

extension ProfileStateExt on ProfileState {
  bool get canDeleteInfo {
    final user = this.user;
    if(user == null) return false;

    int count = 0;

    if(user.login != null) count++;
    if(user.phone != null) count++;
    if(user.email != null) count++;
    return count >= 2;
  }

  ProfileState setDetail({required AuthMethod method, String? value}) {
    return copyWith(
      user: user?.copyWith(
        login: method == .login ? some(value): null,
        phone: method == .phone ? some(value): null,
        email: method == .email ? some(value): null,
      )
    );
  }
}
