part of 'profile_cubit.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(Profile()) Profile profile,
    @Default(Profile()) Profile form,
    GlobalKey<FormState>? profileFormKey,
    @Default([]) List<Review> reviews,
    @Default(EntityStatus(status: Status.idle)) EntityStatus reviewsStatus,
  }) = _ProfileState;

  // const ProfileState._();
}
