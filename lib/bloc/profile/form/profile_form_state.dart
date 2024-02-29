part of 'profile_form_bloc.dart';

@immutable
class ProfileFormState extends Equatable {
  final ProfileModel profileModel;
  final bool loading;

  const ProfileFormState({required this.profileModel, this.loading = false});

  ProfileFormState copyWith(
      {required ProfileModel profileModel, bool? loading}) {
    return ProfileFormState(
        profileModel: profileModel, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [profileModel];
}
