part of 'profile_bloc.dart';

// @immutable
abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitEvent extends ProfileEvent {
  final BuildContext context;

  ProfileInitEvent({required this.context});
}

class ProfileLoadingEvent extends ProfileEvent {}

class ProfileLoadedEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final BuildContext context;
  final Profile profile;
  ProfileUpdateEvent({required this.context, required this.profile});

  @override
  List<Object> get props => [profile];
}

class ProfileFormSavedEvent extends ProfileEvent {
  final Profile profile;
  ProfileFormSavedEvent(this.profile);

  @override
  List<Object> get props => [profile];
}

class ProfileFormResetEvent extends ProfileEvent {}
