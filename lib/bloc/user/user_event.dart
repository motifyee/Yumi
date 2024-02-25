part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserFromJsonEvent extends UserEvent {
  final dynamic user;

  UserFromJsonEvent({required this.user});
}
