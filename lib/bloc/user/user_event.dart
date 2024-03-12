part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {}

class UserUpdateEvent extends UserEvent {
  final UserModel? user;
  final bool? loading;
  UserUpdateEvent({this.user, this.loading});

  @override
  List<Object?> get props => [user, loading];
}

class UserFromJsonEvent extends UserEvent {
  final dynamic user;
  final bool? loading;

  UserFromJsonEvent({this.user, this.loading});

  @override
  List<Object?> get props => [user, loading];
}

class UserResetEvent extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
