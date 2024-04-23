part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final Profile profile;
  final Profile profileForm;

  final String? apiMessage;

  final ObseleteStatusEnum status;
  final StatusSet statusSet;

  final ObseleteStatusEnum formStatus;

  final Status<List<Review>> reviews;

  const ProfileState({
    Profile? profile,
    Profile? profileForm,
    this.apiMessage,
    this.status = ObseleteStatusEnum.init,
    this.statusSet = const {},
    this.formStatus = ObseleteStatusEnum.init,
    this.reviews = const Status<List<Review>>(),
  })  : profile = profile ?? const Profile(),
        profileForm = profileForm ?? const Profile();

  ProfileState copyWith({
    Profile? profile,
    Profile? profileForm,
    ObseleteStatusEnum? status,
    String? apiMessage,
    Status<List<Review>>? reviews,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      profileForm: profileForm ?? this.profileForm,
      apiMessage: apiMessage ?? this.apiMessage,
      status: status ?? this.status,
      statusSet: status != null ? {...statusSet, status} : statusSet,
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  List<Object?> get props => [profile, status, profileForm, formStatus];
}
