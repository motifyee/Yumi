import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/domain/profile/entities/review.dart';
import 'package:yumi/domain/profile/use_cases/delete_photo.dart';
import 'package:yumi/domain/profile/use_cases/delete_profile.dart';
import 'package:yumi/domain/profile/use_cases/load_profile.dart';
import 'package:yumi/domain/profile/use_cases/load_reviews.dart';
import 'package:yumi/domain/profile/use_cases/update_profile.dart';
import 'package:yumi/domain/profile/use_cases/upload_photos.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

const String generalError = 'Something went wrong, please try again later.';

// TODO implement failure message mapper !Code repeated!
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<Profile> getProfile({
    bool init = false,
    Function(Profile)? action,
    Function(Profile)? failedAction,
  }) async {
    if (init) emit(state.copyWith(status: ObseleteStatusEnum.init));
    emit(state.copyWith(status: ObseleteStatusEnum.loading));

    final profile = await LoadProfile().call(LoadProfileParam());

    return profile.fold(
      (l) {
        emit(state.copyWith(
          status:
              init ? ObseleteStatusEnum.initError : ObseleteStatusEnum.error,
        ));

        if (failedAction != null) failedAction(state.profile);

        return state.profile;
      },
      (r) {
        final profile = r.copyWith(
          hygienePhoto: state.profile.hygienePhoto,
          riskPhoto: state.profile.riskPhoto,
          registerationPhoto: state.profile.registerationPhoto,
          //
          driverLicensePhoto: state.profile.driverLicensePhoto,
          driverLicenseCodePhoto: state.profile.driverLicenseCodePhoto,
          foodDeliveryInsurancePhoto: state.profile.foodDeliveryInsurancePhoto,
          //
          passportPhoto: state.profile.passportPhoto,
          nidPhoto: state.profile.nidPhoto,
          //
          contractPhoto: state.profile.contractPhoto,
        );

        emit(
          state.copyWith(
            status: init
                ? ObseleteStatusEnum.initSuccess
                : ObseleteStatusEnum.success,
            profile: profile,
          ),
        );

        if (action != null) action(r);

        return profile;
      },
    );
  }

  // returns the updated profile or null if failed
  Future<Profile?> updateProfile(Profile profile) async {
    final update = await UpdateProfile().call(UpdateProfileParam(profile));

    return update.fold(
      (l) {
        emit(state.copyWith(
          status: ObseleteStatusEnum.error,
          apiMessage: () {
            if (l is ApiFailure) return l.error.toString();
            return generalError;
          }(),
        ));

        return null;
      },
      (r) {
        emit(state.copyWith(
          status: ObseleteStatusEnum.success,
          profile: profile,
          apiMessage: r,
        ));

        return profile;
      },
    );
  }

  Future<String> uploadPhotos(List<String?> photos) async {
    final update = await UploadProfilePhotos().call(UploadProfilePhotoParam(
      state.profile,
      photos,
    ));

    return _updateMapper(update);
  }

  Future<String> deletePhoto({required String photo}) async {
    final update = await DeleteProfilePhoto().call(DeleteProfilePhotoParam(
      state.profile,
      photo,
    ));

    return _updateMapper(update);
  }

  Future<String> deleteProfile() async {
    final update = await DeleteProfile().call(NoParams());

    return _updateMapper(update);
  }

  Future<List<Review>> getReviews() async {
    state.copyWith.profile;
    return (await LoadReviews().call(NoParams())).fold(
      (l) {
        emit(
          state.copyWith(
            reviews: state.reviews.copyWith(
              status: ObseleteStatusEnum.error,
              message: l is ApiFailure ? l.error.toString() : generalError,
            ),
          ),
        );
        return [];
      },
      (r) {
        emit(
          state.copyWith(
            reviews: state.reviews.copyWith(
              value: r,
              status: ObseleteStatusEnum.success,
              message: '',
            ),
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
          if (l is ApiFailure) return l.error.toString();
          return generalError;
        }();

        emit(state.copyWith(
          status: ObseleteStatusEnum.error,
          apiMessage: msg,
        ));

        return msg;
      },
      (r) {
        emit(state.copyWith(status: ObseleteStatusEnum.success));
        return r;
      },
    );
  }
}
