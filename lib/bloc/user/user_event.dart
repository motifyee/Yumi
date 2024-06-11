part of 'user_bloc.dart';

@immutable
abstract class xUserEvent extends Equatable {}

class UserUpdateLocationEvent extends xUserEvent {
  final Address address;
  UserUpdateLocationEvent({required this.address});

  @override
  List<Object?> get props => [address];
}

class SavexUserFromJsonEvent extends xUserEvent {
  final dynamic user;
  final bool? loading;
  final Function()? routeAfterLogin;

  SavexUserFromJsonEvent({this.user, this.loading, this.routeAfterLogin});

  @override
  List<Object?> get props => [user, loading];
}

class LoadxUserFromSharedRefEvent extends xUserEvent {
  final BuildContext context;
  final String? route;
  final Function(BuildContext, String?, UserModel?) afterFetchSuccess;
  final Function(BuildContext) autoLogin;

  LoadxUserFromSharedRefEvent({
    required this.context,
    required this.route,
    required this.afterFetchSuccess,
    required this.autoLogin,
  });

  @override
  List<Object?> get props => [afterFetchSuccess];
}

class UserStatusUpdateEvent extends xUserEvent {
  final StatusEnum? statusEnum;

  UserStatusUpdateEvent({this.statusEnum});

  @override
  List<Object?> get props => [];
}

class UserResetEvent extends xUserEvent {
  @override
  List<Object?> get props => [];
}
