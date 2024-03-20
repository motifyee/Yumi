part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final UserModel user;
  final Address? address;
  final bool loading;

  const UserState({required this.user, this.address, this.loading = false});

  UserState copyWith({UserModel? user, Address? address, bool? loading}) {
    return UserState(
        user: user ?? this.user,
        address: address ?? this.address,
        loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [user, address, loading];
}
