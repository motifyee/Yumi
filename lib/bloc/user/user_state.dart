part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final UserModel user;

  UserState({required this.user});

  UserState copyWith({required UserModel user}) {
    return UserState(user: user);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
