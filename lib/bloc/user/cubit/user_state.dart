part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserModel()) UserModel user,
    Address? address,
    @Default(false) bool loading,
  }) = _Initial;
}
