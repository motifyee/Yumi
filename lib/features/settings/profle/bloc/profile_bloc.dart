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
  }

  _porfileInit(ProfileInitEvent event, emit) async {
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
            status: BlocStatus.success,
          ),
        );
      },
    ).catchError(
      (error) {
        //
        // Emit new state

        emit(
          state.copyWith(
            status: BlocStatus.error,
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
            ),
          );

          if (event.context.mounted) {
            Navigator.of(event.context).pop();

            ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(
                content: SnackBarMassage(
                  massage: value.toString(),
                ),
              ),
            );
          }
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
