part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final ProfileModel profile;

  ProfileState({required this.profile});

  ProfileState copyWith({required ProfileModel profile}) {
    return ProfileState(profile: profile);
  }

  @override
  List<Object?> get props => [profile];
}
