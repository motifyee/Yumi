part of 'profile_form_bloc.dart';

@immutable
class ProfileFormState extends Equatable {
  ProfileModel profileModel;

  ProfileFormState({required this.profileModel});

  ProfileFormState copyWith({required ProfileModel profileModel}) {
    return ProfileFormState(profileModel: profileModel);
  }

  @override
  List<Object?> get props => [profileModel];
}
