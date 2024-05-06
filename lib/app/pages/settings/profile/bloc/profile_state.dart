part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final Profile profile;
  final Profile profileForm;

  final String? apiMessage;

  final Status status;
  final StatusSet statusSet;

  final Status formStatus;

  final List<Review> reviews;

  const ProfileState({
    Profile? profile,
    Profile? profileForm,
    this.apiMessage,
    this.status = Status.init,
    this.statusSet = const {},
    this.formStatus = Status.init,
    this.reviews = const [],
  })  : profile = profile ?? const Profile(),
        profileForm = profileForm ?? const Profile();

  ProfileState copyWith({
    Profile? profile,
    Profile? profileForm,
    Status? status,
    String? apiMessage,
    List<Review>? reviews,
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
