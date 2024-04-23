part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(Profile()) Profile profile,
    @Default(ObseleteStatusEnum.init) ObseleteStatusEnum status,
    @Default({}) StatusSet statusSet,
    //
    @Default(Profile()) Profile profileForm,
    @Default(ObseleteStatusEnum.init) ObseleteStatusEnum formStatus,
    //
    String? apiMessage,
    //
    @Default(Status<List<Review>>()) Status<List<Review>> reviews,
    Status<Profile>? test,
  }) = _ProfileState;

  // const ProfileState._();
}
