part of 'profile_form_bloc.dart';

@immutable
abstract class ProfileFormEvent {}

class ProfileFormUpdateEvent implements ProfileFormEvent {
  final ProfileModel profileModel;

  const ProfileFormUpdateEvent({required this.profileModel});
}

class ProfileFormResetEvent implements ProfileFormEvent {
  final ProfileModel profileModel;

  const ProfileFormResetEvent({required this.profileModel});
}
