part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final UserModel user;
  final Address? address;
  final bool loading;
  final bool isStatusLocked;

  const UserState(
      {required this.user,
      this.address,
      this.loading = false,
      this.isStatusLocked = false});

  UserState copyWith(
      {UserModel? user,
      Address? address,
      bool? loading,
      bool? isStatusLocked}) {
    return UserState(
        user: user ?? this.user,
        address: address ?? this.address,
        loading: loading ?? this.loading,
        isStatusLocked: isStatusLocked ?? this.isStatusLocked);
  }

  @override
  List<Object?> get props => [user, address, loading, isStatusLocked];
}
