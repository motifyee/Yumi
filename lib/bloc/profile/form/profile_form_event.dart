part of 'profile_form_bloc.dart';

@immutable
abstract class ProfileFormEvent {}

class ProfileFormUpdateEvent implements ProfileFormEvent {
  ProfileModel profileModel;

  ProfileFormUpdateEvent({required this.profileModel});
}

class ProfileFormResetEvent implements ProfileFormEvent {
  ProfileModel profileModel;

  ProfileFormResetEvent({required this.profileModel});
}
