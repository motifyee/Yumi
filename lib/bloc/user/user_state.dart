part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final UserModel user;
  final bool loading;

  const UserState({required this.user, this.loading = false});

  UserState copyWith({UserModel? user, bool? loading}) {
    return UserState(user: user ?? this.user, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [user];
}
