part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class ProfileInitEvent extends ProfileEvent {
  final BuildContext? context;
  final Function(Profile)? action;
  final Function(Profile)? failedAction;

  const ProfileInitEvent({this.context, this.action, this.failedAction});
}

class ProfileLoadingEvent extends ProfileEvent {}

class ProfileLoadedEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final BuildContext? context;
  final Profile profile;
  final bool update;
  const ProfileUpdateEvent(
      {this.context, required this.profile, this.update = true});

  @override
  List<Object> get props => [profile];
}

class ProfileFormSavedEvent extends ProfileEvent {
  final Profile profile;
  const ProfileFormSavedEvent(this.profile);

  @override
  List<Object> get props => [profile];
}

class ProfileUploadPhotosEvent extends ProfileEvent {
  final List<String?> photos;
  const ProfileUploadPhotosEvent(this.photos);
  @override
  List<Object?> get props => [photos];
}

class ProfileDeletePhotoEvent extends ProfileEvent {
  final String photo;
  const ProfileDeletePhotoEvent(this.photo);
  @override
  List<Object?> get props => [photo];
}

class ProfileDeleteEvent extends ProfileEvent {}

class ProfileLoadReviewsEvent extends ProfileEvent {}
