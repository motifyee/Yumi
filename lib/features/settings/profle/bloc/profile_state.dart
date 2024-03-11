part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final Profile profile;
  final Profile profileForm;

  final BlocStatus status;
  final BlocStatusSet statusSet;

  final BlocStatus formStatus;

  const ProfileState({
    Profile? profile,
    Profile? profileForm,
    this.status = BlocStatus.initial,
    this.statusSet = const {},
    this.formStatus = BlocStatus.initial,
  })  : profile = profile ?? const Profile(),
        profileForm = profileForm ?? const Profile();

  ProfileState copyWith({
    Profile? profile,
    Profile? profileForm,
    BlocStatus? status,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      profileForm: profileForm ?? this.profileForm,
      status: status ?? this.status,
      statusSet: status != null ? {...statusSet, status} : statusSet,
    );
  }

  @override
  List<Object?> get props => [profile, status, profileForm, formStatus];
}
