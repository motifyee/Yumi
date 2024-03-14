import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/profile_model.dart';
import 'package:yumi/features/settings/profle/profile_service.dart';
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
      List<String> photos = state.profile.eventPhotos
          .where((element) => element != event.photo)
          .toList();

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
      context: event.context,
      id: event.context.read<UserBloc>().state.user.chefId,
    ).then(
      (value) {
        //
        // Emit new state

        emit(
          state.copyWith(
            profile: Profile.fromJson(value: value).copyWith(
              updatedBy: '366',
              email: event.context.read<UserBloc>().state.user.email,
            ),
            status: BlocStatus.initSuccess,
          ),
        );
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
      },
    );
  }

  _profileUpdate(ProfileUpdateEvent event, emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    await ProfileService.updateProfile(
            context: event.context, data: event.profile.toJson())
        .then(
      (value) {
        if (value != null && value != false) {
          emit(
            state.copyWith(
                profile: event.profile,
                status: BlocStatus.success,
                apiMessage: value.toString()),
          );

          if (event.context.mounted) {}
        } else {
          emit(
            state.copyWith(status: BlocStatus.error),
          );

          if (event.context.mounted) {
            ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                content: SnackBarMassage(
                    massage: S.of(event.context).connectionError),
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
