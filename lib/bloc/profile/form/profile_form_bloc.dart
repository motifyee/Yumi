import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/model/profile_model.dart';

part './profile_form_event.dart';
part './profile_form_state.dart';

class ProfileFormBloc extends Bloc<ProfileFormEvent, ProfileFormState> {
  ProfileFormBloc() : super(ProfileFormState(profileModel: ProfileModel())) {
    on<ProfileFormUpdateEvent>((event, emit) {
      emit(state.copyWith(profileModel: event.profileModel));
    });
  }
}
