part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {}

class UserUpdateLocationEvent extends UserEvent {
  final Address address;
  UserUpdateLocationEvent({required this.address});

  @override
  List<Object?> get props => [address];
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
