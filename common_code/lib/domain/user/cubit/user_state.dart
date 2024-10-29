part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(User()) User user,
    Address? address,
    @Default(false) bool loading,
  }) = _Initial;

  const UserState._();

  bool get isLoggedIn => user.accessToken.isNotEmpty;
}
