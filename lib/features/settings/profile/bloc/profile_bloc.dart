import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/driver/driver_reg_cubit.dart';
import 'package:yumi/features/registeration/bloc/bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/features/settings/profile/model/profile_model.dart';
import 'package:yumi/features/settings/profile/profile_service.dart';
import 'package:yumi/global.dart';
import 'package:yumi/template/snack_bar.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileInitEvent>(_porfileInit);

    on<ProfileLoadingEvent>(
        (_, emit) => emit(state.copyWith(status: BlocStatus.loading)));

    on<ProfileLoadedEvent>(
        (_, emit) => emit(state.copyWith(status: BlocStatus.loaded)));

    on<ProfileFailedEvent>(
        (_, emit) => emit(state.copyWith(status: BlocStatus.error)));

    on<ProfileUpdateEvent>(_profileUpdate);

    on<ProfileFormSavedEvent>(
      (event, emit) async {
        emit(state.copyWith(
            profile: event.profile, status: BlocStatus.formSaved));
      },
    );

    on<ProfileFormResetEvent>(
      (_, emit) => emit(
        state.copyWith(
          profile: const Profile(),
          status: BlocStatus.formReset,
        ),
      ),
    );

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

      emit(state.copyWith(profile: profile, status: BlocStatus.formSaved));
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

      emit(state.copyWith(profile: profile, status: BlocStatus.formSaved));
    });
  }

  _porfileInit(ProfileInitEvent event, emit) async {
    emit(state.copyWith(status: BlocStatus.init));
    emit(state.copyWith(status: BlocStatus.loading));

    await ProfileService.getProfile(
      G.cContext.read<UserBloc>().state.user.id,
    ).then(
      (value) {
        //
        // Emit new state
        var newProfile = Profile.fromJson(value).copyWith(
          updatedBy: '366',
          email: G.cContext.read<UserBloc>().state.user.email,
          //
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
            status: BlocStatus.initSuccess,
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
            status: BlocStatus.initError,
          ),
        );
        if (event.failedAction != null) event.failedAction!(state.profile);
      },
    );
  }

  _profileUpdate(ProfileUpdateEvent event, emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    await ProfileService.updateProfile(event.profile.toJson()).then(
      (value) {
        if (value != null && value != false) {
          emit(
            state.copyWith(
                profile: event.profile,
                status: BlocStatus.success,
                apiMessage: value.toString()),
          );

          if (event.update) add(const ProfileInitEvent());

          // if (event.context.mounted) {}
        } else {
          emit(
            state.copyWith(status: BlocStatus.error),
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
          state.copyWith(status: BlocStatus.error),
        );
      },
    );
  }
}

bool profileInfoSelector(ProfileState state) {
  return (state is! ProfileFormSavedEvent && state is! ProfileFormResetEvent);
}

// void load() {
//   emit(state.copyWith(status: BlocStatus.loading));

//   ProfileService.getProfile(G.read<UserBloc>().state.user.id).then((value) {
//     var profile = Profile.fromJson(value).copyWith(
//       updatedBy: '366',
//       email: G.read<UserBloc>().state.user.email,
//     );

//     emit(state.copyWith(profile: profile, status: BlocStatus.initSuccess));
//   }).catchError((_) {
//     emit(state.copyWith(status: BlocStatus.initError));
//   });
// }

// void update(Profile profile) {
//   emit(state.copyWith(status: BlocStatus.loading));

//   ProfileService.updateProfile(profile.toJson()).then((value) {
//     if (value == null || value == false) throw '';

//     emit(state.copyWith(
//       profile: profile,
//       status: BlocStatus.success,
//       message: value.toString(),
//     ));
//   }).catchError((_) {
//     emit(state.copyWith(status: BlocStatus.loading));
//   });
// }
