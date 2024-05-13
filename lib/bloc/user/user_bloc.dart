import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yumi/app/pages/auth/register/model/address.dart';
import 'package:yumi/model/user/user_model.dart';
import 'package:yumi/service/user_status_service.dart';
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
          await LocalStorage.sharedRef.getValue(LocalStorage.userLocation);

      if (user != null) {
        add(UserFromJsonEvent(
            user: user,
            routeAfterLogin: () {
              if (userLocation != null) {
                add(UserUpdateLocationEvent(
                    address: Address.fromJson(userLocation)));
              }
              event.afterFetchSuccess(
                event.context,
                event.route,
                UserModel.fromJson(user),
              );
            }));
      } else {
        event.autoLogin(event.context);
      }
      FlutterNativeSplash.remove();
    });

    on<UserStatusUpdateEvent>((event, emit) async {
      if (state.loading) return;
      emit(state.copyWith(loading: true));

      int status = state.user.status == 1 ? 2 : 1;
      if (event.statusEnum == StatusEnum.ready) status = 1;
      if (event.statusEnum == StatusEnum.busy) status = 2;
      try {
        await UserStatusService.updateStatus(status: status);
        emit(state.copyWith(
          loading: false,
          user: state.user.copyWith(status: status),
        ));
      } catch (err) {
        emit(state.copyWith(
          loading: false,
        ));
      }
    });

    on<UserResetEvent>((event, emit) async {
      await LocalStorage.sharedRef.removeValue(LocalStorage.user);
      await LocalStorage.sharedRef.removeValue(LocalStorage.token);
      await LocalStorage.sharedRef.removeValue(LocalStorage.newsGuide);
      await LocalStorage.sharedRef.removeValue(LocalStorage.userLocation);
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
