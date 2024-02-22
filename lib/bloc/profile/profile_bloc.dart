import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/model/profile_model.dart';
import 'package:yumi/service/profile_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(profile: ProfileModel())) {
    on<ProfileEvent>((event, emit) async {
      final res = await ProfileService.getProfile(
          context: event.context,
          id: event.context.read<UserBloc>().state.user.chefId);

      emit(state.copyWith(profile: state.profile.fromJson(value: res)));
    });
  }
}
