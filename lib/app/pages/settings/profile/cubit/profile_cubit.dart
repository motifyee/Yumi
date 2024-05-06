import 'dart:async';
import 'dart:developer';

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
import 'package:yumi/domain/profile/use_cases/update_profile_photo.dart';
import 'package:yumi/domain/profile/use_cases/upload_photos.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

const String generalError = 'Something went wrong, please try again later.';

// TODO implement failure message mapper !Code repeated!
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<Profile?> getProfile() async {
    emit(state.copyWith.profile(
        entityStatus:
            state.profile.entityStatus.copyWith(status: Status.loading)));

    final profile = await LoadProfile().call(LoadProfileParam());

    return profile.fold(
      (l) {
        emit(state.copyWith.profile(
            entityStatus:
                state.profile.entityStatus.copyWith(status: Status.error)));

        return null;
      },
      (r) {
        emit(state.copyWith(
            profile: r.copyWith(
                entityStatus: state.profile.entityStatus
                    .copyWith(status: Status.success))));

        return r;
      },
    );
  }

  Future<Profile?> getProfileForm() async {
    emit(state.copyWith.form(
        entityStatus:
            state.form.entityStatus.copyWith(status: Status.loading)));

    final profile = await LoadProfile().call(LoadProfileParam());

    return profile.fold(
      (l) {
        emit(state.copyWith.form(
            entityStatus:
                state.form.entityStatus.copyWith(status: Status.error)));

        return null;
      },
      (r) {
        final profile = r.copyWith(
          hygienePhoto: state.form.hygienePhoto,
          riskPhoto: state.form.riskPhoto,
          registerationPhoto: state.form.registerationPhoto,
          //
          driverLicensePhoto: state.form.driverLicensePhoto,
          driverLicenseCodePhoto: state.form.driverLicenseCodePhoto,
          foodDeliveryInsurancePhoto: state.form.foodDeliveryInsurancePhoto,
          //
          passportPhoto: state.form.passportPhoto,
          nidPhoto: state.form.nidPhoto,
          //
          contractPhoto: state.form.contractPhoto,
        );

        emit(state.copyWith(
            form: profile.copyWith(
                entityStatus:
                    state.form.entityStatus.copyWith(status: Status.success))));

        return profile;
      },
    );
  }

  // returns the updated profile or null if failed
  Future<Profile?> updateProfileForm([Profile? profile]) async {
    var profile0 = profile ?? state.form;

    emit(state.copyWith.form(
        entityStatus:
            state.form.entityStatus.copyWith(status: Status.loading)));

    final update = await UpdateProfile().call(UpdateProfileParam(profile0));

    return update.fold(
      (l) {
        emit(
          state.copyWith.form(
            entityStatus: state.form.entityStatus.copyWith(
                status: Status.error,
                message: switch (l) {
                  ServerFailure() => l.error.toString(),
                  _ => generalError
                }),
          ),
        );

        return null;
      },
      (r) {
        emit(
          state.copyWith(
            form: (profile0).copyWith(
              entityStatus: state.form.entityStatus.copyWith(
                status: Status.success,
              ),
            ),
            profile:
                profile0.copyWith(entityStatus: state.profile.entityStatus),
          ),
        );

        return profile0;
      },
    );
  }

  Future<Profile> uploadFormPhotos(List<String?> photos) async {
    emit(state.copyWith.form(
        entityStatus:
            state.form.entityStatus.copyWith(status: Status.loading)));

    final profile = await UploadProfilePhotos().call(UploadProfilePhotosParam(
      state.form,
      photos,
    ));

    return profile.fold((l) {
      emit(state.copyWith.form(
          entityStatus:
              state.form.entityStatus.copyWith(status: Status.error)));

      return state.form;
    }, (r) {
      emit(state.copyWith(
          form: r.copyWith(
              entityStatus:
                  state.form.entityStatus.copyWith(status: Status.success))));

      return r;
    });
  }

  Future<Profile> updateProfilePhoto(String? photo) async {
    emit(state.copyWith.form(
        entityStatus:
            state.form.entityStatus.copyWith(status: Status.loading)));

    final profile = await UpdateProfilePhoto().call(UpdateProfilePhotoParam(
      state.form,
      photo,
    ));

    return profile.fold((l) {
      emit(state.copyWith.form(
          entityStatus:
              state.form.entityStatus.copyWith(status: Status.error)));

      return state.form;
    }, (r) {
      emit(state.copyWith(
          form: r.copyWith(
              entityStatus:
                  state.form.entityStatus.copyWith(status: Status.success))));

      return r;
    });
  }

  Future<Profile> deleteFormPhoto({required String photo}) async {
    emit(state.copyWith.form(
        entityStatus:
            state.form.entityStatus.copyWith(status: Status.loading)));

    final update = await DeleteProfilePhoto().call(DeleteProfilePhotoParam(
      state.form,
      photo,
    ));

    return update.fold((l) {
      emit(state.copyWith.form(
          entityStatus:
              state.form.entityStatus.copyWith(status: Status.error)));

      return state.form;
    }, (r) {
      emit(state.copyWith(
          form: r.copyWith(
              entityStatus:
                  state.form.entityStatus.copyWith(status: Status.success))));

      return r;
    });
  }

  Future<String> deleteProfile() async {
    final update = await DeleteProfile().call(NoParams());

    return _updateMapper(update);
  }

  Future<List<Review>> getReviews() async {
    emit(state.copyWith(
        reviewsStatus: state.reviewsStatus.copyWith(status: Status.loading)));

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
            entityStatus: state.form.entityStatus
                .copyWith(message: msg, status: Status.error),
          ),
        );

        return msg;
      },
      (r) {
        emit(
          state.copyWith.form(
            entityStatus:
                state.form.entityStatus.copyWith(status: Status.success),
          ),
        );
        return r;
      },
    );
  }
}
