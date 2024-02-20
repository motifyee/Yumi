import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(UserState(
            user: UserModel(
          accessToken: '',
          chefId: '',
          code: '',
          email: '',
          expiresIn: '',
          message: '',
          userName: '',
        ))) {
    on<UserFromJsonEvent>((event, emit) {
      emit(state.copyWith(user: UserModel.fromJson(event.user)));
    });
  }
}