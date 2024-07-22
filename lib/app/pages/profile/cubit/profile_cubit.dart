import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/util/constants.dart';
import 'package:common_code/util/status.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:common_code/domain/profile/entities/profile.dart';
import 'package:common_code/domain/profile/entities/review.dart';
import 'package:common_code/domain/profile/use_cases/delete_photo.dart';
import 'package:common_code/domain/profile/use_cases/delete_profile.dart';
import 'package:common_code/domain/profile/use_cases/get_otp.dart';
import 'package:common_code/domain/profile/use_cases/load_profile.dart';
import 'package:common_code/domain/profile/use_cases/load_reviews.dart';
import 'package:common_code/domain/profile/use_cases/update_profile.dart';
import 'package:common_code/domain/profile/use_cases/update_profile_photo.dart';
import 'package:common_code/domain/profile/use_cases/upload_photos.dart';
import 'package:common_code/domain/profile/use_cases/verify_add_mobile_otp.dart';
import 'package:yumi/global.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

const String generalError = 'Something went wrong, please try again later.';

// TODO implement failure message mapper !Code repeated!
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<Profile?> getProfile() async {
    emit(state.copyWith.profile(entityStatus: state.profile.entityStatus.copyWith(status: Status.loading)));

    final params = LoadProfileParam(
      G().rd<UserCubit>().state.user.id,
      G().rd<UserCubit>().state.user.email,
    );
    final profile = await LoadProfile().call(params);

    return profile.fold(
      (l) {
        emit(state.copyWith(profile: state.profile.copyWith(entityStatus: state.profile.entityStatus.copyWith(status: Status.error))));

        return null;
      },
      (r) {
        emit(state.copyWith(profile: r.copyWith(mobile: _removeUKCountryCode(r.mobile), entityStatus: state.profile.entityStatus.copyWith(status: Status.success))));

        return r;
      },
    );
  }

  Future<Profile?> getProfileForm() async {
    emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.loading)));

    final params = LoadProfileParam(
      G().rd<UserCubit>().state.user.id,
      G().rd<UserCubit>().state.user.email,
    );
    final profile = await LoadProfile().call(params);

    return profile.fold(
      (l) {
        emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.error)));

        return null;
      },
      (r) {
        emit(state.copyWith(
          form: r.copyWith(mobile: _removeUKCountryCode(r.mobile), entityStatus: state.form.entityStatus.copyWith(status: Status.success)),
        ));

        return r;
      },
    );
  }

  String _addUKCountryCode(String mobile) {
    return '$kUKCountryCode${mobile.trim()}';
  }

  String _removeUKCountryCode(String mobile) {
    return mobile.replaceAll(RegExp(r'^' + kUKCountryCode), '');
  }

  void setState(ProfileState Function(ProfileState) update) => emit(update(state));

  void toggleFormDeliveryAvailable() {
    emit(state.copyWith.form(pickupOnly: !state.form.pickupOnly));
  }

  void initializeForm() {
    if (state.profileFormKey == null) {
      emit(state.copyWith(profileFormKey: GlobalKey<FormState>()));
    }
  }

  // returns the updated profile or null if failed
  Future<Profile?> updateProfileForm([Profile? profile]) async {
    var profile0 = profile ?? state.form;
    profile0 = profile0.copyWith(mobile: _addUKCountryCode(profile0.mobile));

    emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.loading)));

    final update = await UpdateProfile().call(UpdateProfileParam(profile0));

    return update.fold(
      (l) {
        emit(
          state.copyWith.form(
            entityStatus: state.form.entityStatus.copyWith(status: Status.error, message: switch (l) { ServerFailure() => l.error.toString(), _ => generalError }),
          ),
        );

        return null;
      },
      (r) {
        emit(
          state.copyWith(
            form: r.copyWith(
              mobile: _removeUKCountryCode(r.mobile),
              entityStatus: state.form.entityStatus.copyWith(
                status: Status.success,
                message: 'Profile updated successfully.',
              ),
            ),
            profile: profile0.copyWith(entityStatus: state.profile.entityStatus),
          ),
        );

        return profile0;
      },
    );
  }

  Future<Profile> uploadFormPhotos(List<String?> photos) async {
    emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.loading)));

    final profile = await UploadProfilePhotos().call(UploadProfilePhotosParam(
      state.form.copyWith(mobile: _addUKCountryCode(state.form.mobile)),
      photos,
    ));

    return profile.fold((l) {
      emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.error)));

      return state.form;
    }, (r) {
      emit(state.copyWith(form: r.copyWith(mobile: _removeUKCountryCode(r.mobile), entityStatus: state.form.entityStatus.copyWith(status: Status.success))));

      return r;
    });
  }

  Future<Profile> updateProfilePhoto(String? photo) async {
    emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.loading)));

    final profile = await UpdateProfilePhoto().call(UpdateProfilePhotoParam(
      state.form.copyWith(mobile: _addUKCountryCode(state.form.mobile)),
      photo,
    ));

    return profile.fold((l) {
      emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.error)));

      return state.form;
    }, (r) {
      emit(state.copyWith(form: r.copyWith(mobile: _removeUKCountryCode(r.mobile), entityStatus: state.form.entityStatus.copyWith(status: Status.success))));

      return r;
    });
  }

  Future<Profile> deleteFormPhoto({required String photo}) async {
    emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.loading)));

    final update = await DeleteProfilePhoto().call(DeleteProfilePhotoParam(
      state.form.copyWith(mobile: _addUKCountryCode(state.form.mobile)),
      photo,
    ));

    return update.fold((l) {
      emit(state.copyWith.form(entityStatus: state.form.entityStatus.copyWith(status: Status.error)));

      return state.form;
    }, (r) {
      emit(state.copyWith(form: r.copyWith(mobile: _removeUKCountryCode(r.mobile), entityStatus: state.form.entityStatus.copyWith(status: Status.success))));

      return r;
    });
  }

  Future<String> deleteProfile() async {
    final update = await DeleteProfile().call(NoParams());

    return _updateMapper(update);
  }

  void toggleDeliveryAvailable() {
    emit(state.copyWith.form(pickupOnly: !state.form.pickupOnly));
  }

  Future<List<Review>> getReviews() async {
    emit(state.copyWith(reviewsStatus: state.reviewsStatus.copyWith(status: Status.loading)));

    return (await LoadReviews().call(NoParams())).fold(
      (l) {
        emit(
          state.copyWith(
            reviewsStatus: state.reviewsStatus.copyWith(
              status: Status.error,
              message: l is ServerFailure ? l.error.toString() : generalError,
            ),
          ),
        );
        return [];
      },
      (r) {
        emit(
          state.copyWith(
            reviewsStatus: state.reviewsStatus.copyWith(
              status: Status.success,
              message: '',
            ),
            reviews: r,
          ),
        );
        return r;
      },
    );
  }

  String _updateMapper(Either<Failure, String> update) {
    return update.fold(
      (l) {
        final msg = () {
          if (l is ServerFailure) return l.error.toString();
          return generalError;
        }();

        emit(
          state.copyWith.form(
            entityStatus: state.form.entityStatus.copyWith(message: msg, status: Status.error),
          ),
        );

        return msg;
      },
      (r) {
        emit(
          state.copyWith.form(
            entityStatus: state.form.entityStatus.copyWith(status: Status.success),
          ),
        );
        return r;
      },
    );
  }

  Future<String?> setMobile(String mobile) async {
    var profile = G().rd<ProfileCubit>().state.form.copyWith(mobile: mobile);
    var update = await G().rd<ProfileCubit>().updateProfileForm(profile);

    if (update == null) {
      emit(state.copyWith.form(
        entityStatus: const EntityStatus(status: Status.error),
      ));
      return null;
    }

    emit(state.copyWith.form(mobile: mobile));

    return (await getMobileOTP()).fold(
      (l) => null,
      (r) => r,
    );
  }

  Future<Either<Failure, String>> getMobileOTP() async {
    emit(state.copyWith.form(
      entityStatus: const EntityStatus(status: Status.loading),
    ));
    final getOTP = await GetMobileOTP().call(NoParams());

    return getOTP.fold(
      (l) {
        emit(state.copyWith.form(
          entityStatus: const EntityStatus(status: Status.error),
        ));

        return left(l);
      },
      (r) {
        emit(
          state.copyWith(
            form: state.form.copyWith(
              entityStatus: const EntityStatus(status: Status.success),
            ),
          ),
        );

        return right(r);
      },
    );
  }

  Future<bool> verifyMobileOTP(String otp) async {
    emit(state.copyWith.form(
      entityStatus: const EntityStatus(status: Status.loading),
    ));
    final verify = await VerifyMobileOTP().call(VerifyOTPParams(otp));

    return verify.fold(
      (l) {
        emit(state.copyWith.form(
          entityStatus: const EntityStatus(status: Status.error),
        ));
        return false;
      },
      (r) {
        emit(state.copyWith.form(
          entityStatus: const EntityStatus(status: Status.success),
        ));
        return true;
      },
    );
  }

  void reset() {
    emit(const ProfileState());
  }
}
