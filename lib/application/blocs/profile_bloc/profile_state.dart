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
    User? newUser = user;
    if (newUser != null) {
      if (method == .login) newUser = newUser.withLogin(value);
      if (method == .phone) newUser = newUser.withPhone(value);
      if (method == .email) newUser = newUser.withEmail(value);
    }
    return copyWith(user: newUser);
  }

  String? detailFromMethod(AuthMethod method) {
    switch(method) {
      case .phone:
        return user?.phone;
      case .email:
        return user?.email;
      case .login:
        return user?.login;
    }
  }
}
