import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/use_cases/update_profile.dart';
import 'package:yumi/global.dart';

part 'profile_form_cubit.freezed.dart';

@freezed
class ProfileFormState with _$ProfileFormState {
  const factory ProfileFormState({
    GlobalKey<FormState>? profileFormKey,
    Profile? profile,
    @Default('') String fullName,
    @Default('') String mobile,
    @Default('') String about,
    @Default(false) bool pickupOnly,
    @Default(false) bool isLoading,
  }) = _Initial;
}

class ProfileFormCubit extends Cubit<ProfileFormState> {
  ProfileFormCubit() : super(const ProfileFormState());

  void setState(ProfileFormState Function(ProfileFormState) update) =>
      emit(update(state));

  void toggleDeliveryAvailable() {
    emit(state.copyWith(pickupOnly: !state.pickupOnly));
  }

  void initializeForm() {
    if (state.profileFormKey == null) {
      emit(state.copyWith(profileFormKey: GlobalKey<FormState>()));
    }
  }

  Future<void> loadProfile() async {
    emit(state.copyWith(isLoading: true));
    final profile = await G.rd<ProfileCubit>().getProfileForm();
    emit(state.copyWith(isLoading: false));

    if (profile == null) return;

    setState(
      (state) => state.copyWith(
        profile: profile,
        fullName: profile.fullName,
        mobile: profile.mobile,
        about: profile.about,
        pickupOnly: profile.pickupOnly,
      ),
    );
  }

  /// returns error string or null if successful
  Future<String?> updateProfile() async {
    if (state.profile == null) return 'Profile not loaded!';

    final params = UpdateProfileParam(state.profile!.copyWith(
      fullName: state.fullName,
      mobile: state.mobile,
      about: state.about,
      pickupOnly: state.pickupOnly,
    ));

    emit(state.copyWith(isLoading: true));
    final task = await UpdateProfile().call(params);
    emit(state.copyWith(isLoading: false));

    return task.fold(
      (l) => l.toString(),
      (r) {
        setState((s) => s.copyWith(profile: r));
        return null;
      },
    );
  }
}
