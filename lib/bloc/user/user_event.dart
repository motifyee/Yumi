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
  final Function()? routeAfterLogin;

  UserFromJsonEvent({this.user, this.loading, this.routeAfterLogin});

  @override
  List<Object?> get props => [user, loading];
}

class UserFromSharedRefEvent extends UserEvent {
  final BuildContext context;
  final String? route;
  final Function(BuildContext, String?) afterFetchSuccess;
  final Function(BuildContext) autoLogin;

  UserFromSharedRefEvent({
    required this.context,
    required this.route,
    required this.afterFetchSuccess,
    required this.autoLogin,
  });

  @override
  List<Object?> get props => [afterFetchSuccess];
}

class UserResetEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
