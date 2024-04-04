import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yumi/features/registeration/model/address.dart';
import 'package:yumi/model/user_model.dart';
import 'package:yumi/statics/local_storage.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(
            user: UserModel(
          accessToken: '',
          chefId: '',
          code: '',
          email: '',
          expiresIn: '',
          message: '',
          userName: '',
        ))) {
    on<UserUpdateLocationEvent>((event, emit) async {
      await LocalStorage.sharedRef
          .setValue(LocalStorage.userLocation, event.address);
      emit(state.copyWith(address: event.address));
    });
    on<UserFromJsonEvent>((event, emit) async {
      await LocalStorage.sharedRef.setValue(LocalStorage.user, event.user);
      emit(state.copyWith(user: UserModel.fromJson(event.user)));
      if (event.routeAfterLogin != null) event.routeAfterLogin!();
    });

    on<UserFromSharedRefEvent>((event, emit) async {
      Map<String, dynamic>? user =
          await LocalStorage.sharedRef.getValue(LocalStorage.user);
      Map<String, dynamic>? userLocation =
          await LocalStorage.sharedRef.getValue(LocalStorage.user);

      if (user != null) {
        add(UserFromJsonEvent(user: user));
        if (userLocation != null) {
          add(UserUpdateLocationEvent(address: Address.fromJson(userLocation)));
        }
        event.afterFetchSuccess(event.context, event.route);
      } else {
        event.autoLogin(event.context);
      }
      FlutterNativeSplash.remove();
    });

    on<UserResetEvent>((event, emit) async {
      await LocalStorage.sharedRef.removeValue(LocalStorage.user);
      print('user reset ..........');
      emit(state.copyWith(
          user: const UserModel(
        accessToken: '',
        chefId: '',
        code: '',
        email: '',
        expiresIn: '',
        message: '',
        userName: ' ',
      )));
    });
  }
}
