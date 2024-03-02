part of 'profile_form_bloc.dart';

@immutable
abstract class ProfileFormEvent extends Equatable {
  const ProfileFormEvent([List props = const []]);
}

class ProfileFormUpdateEvent implements ProfileFormEvent {
  final ProfileModel profileModel;

  const ProfileFormUpdateEvent({required this.profileModel});

  @override
  List<Object> get props => [profileModel];

  @override
  bool? get stringify => true;
}

class ProfileFormResetEvent implements ProfileFormEvent {
  final ProfileModel profileModel;

  const ProfileFormResetEvent({required this.profileModel});

  @override
  List<Object?> get props => [profileModel];

  @override
  bool? get stringify => true;
}
