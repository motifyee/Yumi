import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/domain/profile/entities/review.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/app/pages/settings/profile/profile_service.dart';
import 'package:yumi/global.dart';
import 'package:yumi/template/snack_bar.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileInitEvent>(_porfileInit);

    on<ProfileLoadingEvent>(
        (_, emit) => emit(state.copyWith(status: Status.loading)));

    on<ProfileLoadedEvent>(
        (_, emit) => emit(state.copyWith(status: Status.idle)));

    on<ProfileFormSavedEvent>(
      (event, emit) async {
        emit(state.copyWith(profile: event.profile, status: Status.formSaved));
      },
    );

    on<ProfileUpdateEvent>(_profileUpdate);

    on<ProfileUploadPhotosEvent>((event, emit) {
      var photos0 = [
        ...event.photos,
        for (var i = event.photos.length; i < 5; i++) null
      ];

      var profile = state.profile.copyWith(
        eventPhoto0: photos0[0],
        eventPhoto1: photos0[1],
        eventPhoto2: photos0[2],
        eventPhoto3: photos0[3],
        eventPhoto4: photos0[4],
      );

      emit(state.copyWith(profile: profile, status: Status.formSaved));
    });

    on<ProfileDeletePhotoEvent>((event, emit) {
      bool removed = false;
      List<String> photos = state.profile.eventPhotos.where((element) {
        if (removed) return true;
        if (element != event.photo) return true;
        removed = true;
        return false;
      }).toList();

      photos = [...photos, for (var i = photos.length; i < 5; i++) ''];

      var profile = state.profile.copyWith(
        eventPhoto0: photos[0],
        eventPhoto1: photos[1],
        eventPhoto2: photos[2],
        eventPhoto3: photos[3],
        eventPhoto4: photos[4],
      );

      emit(state.copyWith(profile: profile, status: Status.formSaved));
    });

    on<ProfileDeleteEvent>(
      (event, emit) async {
        await xProfileSrc.deleteAccount().then(
              (value) {},
            );
      },
    );

    // on<ProfileLoadReviewsEvent>((event, emit) async {
    //   await xProfileSrc.getReviews().then((value) {
    //     final EntityStatus<List<Review>> reviews = state.reviews.copyWith(
    //       value: value,
    //       status: Status.success,
    //       message: '',
    //     );

    //     debugPrint(reviews.toString());
    //     emit(state.copyWith(
    //       reviews: reviews,
    //       status: Status.success,
    //     ));
    //   });
    // });
  }

  _porfileInit(ProfileInitEvent event, emit) async {
    emit(state.copyWith(status: Status.init));
    emit(state.copyWith(status: Status.loading));

    await xProfileSrc
        .getProfile(
      G.cContext.read<UserBloc>().state.user.id,
    )
        .then(
      (value) {
        //
        // Emit new state
        var newProfile = Profile.fromJson(value).copyWith(
          updatedBy: '366',
          email: G.read<UserBloc>().state.user.email,
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
            profile: newProfile,
            status: Status.initSuccess,
          ),
        );

        if (event.action != null) event.action!(newProfile);
      },
    ).catchError(
      (error) {
        //
        // Emit new state

        emit(
          state.copyWith(
            status: Status.initError,
          ),
        );
        if (event.failedAction != null) event.failedAction!(state.profile);
      },
    );
  }

  _profileUpdate(ProfileUpdateEvent event, emit) async {
    emit(state.copyWith(status: Status.loading));

    await xProfileSrc.updateProfile(event.profile.toJson()).then(
      (value) {
        if (value != null && value != false) {
          emit(
            state.copyWith(
                profile: event.profile,
                status: Status.success,
                apiMessage: value.toString()),
          );

          if (event.update) add(const ProfileInitEvent());

          // if (event.context.mounted) {}
        } else {
          emit(
            state.copyWith(status: Status.error),
          );

          if (G.cContext.mounted) {
            ScaffoldMessenger.of(G.cContext).showSnackBar(
              SnackBar(
                content:
                    SnackBarMassage(massage: S.of(G.cContext).connectionError),
              ),
            );
          }
        }
      },
    ).catchError(
      (err) {
        emit(
          state.copyWith(status: Status.error),
        );
      },
    );
  }
}
