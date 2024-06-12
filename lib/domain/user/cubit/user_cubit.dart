import 'package:bloc/bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/app/core/signal_r.dart';
import 'package:yumi/app_config/chef/chef_signalr.dart';
import 'package:yumi/app_config/customer/customer_signalr.dart';
import 'package:yumi/app_config/driver/driver_signalr.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/domain/user/entity/user.dart';
import 'package:yumi/service/user_status_service.dart';
import 'package:yumi/statics/local_storage.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  saveLocation(Address address) async {
    await LocalStorage.sharedRef.setValue(LocalStorage.userLocation, address);

    emit(state.copyWith(address: address));
  }

  Future<void> saveUser(dynamic userData) async {
    await LocalStorage.sharedRef.setValue(LocalStorage.user, userData);
    User user = User.fromJson(userData);

    /// must init Signalr with access token
    Signalr.accessToken = user.accessToken;

    Signalr.startConnection().then((value) {
      /// initial listen to global messages from signal r
      GlobalSignalR.initial();

      /// initial listen to chef messages from signal r
      ChefSignalR.initial();

      /// initial listen to customer messages from signal r
      CustomerSignalR.initial();

      /// initial listen to driver messages from signal r
      DriverSignalR.initial();
    });

    emit(state.copyWith(user: user));
  }

  Future<User?> loadUser() async {
    Map<String, dynamic>? user =
        await LocalStorage.sharedRef.getValue(LocalStorage.user);
    Map<String, dynamic>? userLocation =
        await LocalStorage.sharedRef.getValue(LocalStorage.userLocation);

    FlutterNativeSplash.remove();

    if (user != null) {
      await saveUser(user);

      if (userLocation != null) saveLocation(Address.fromJson(userLocation));
      return User.fromJson(user);
    }

    return null;
  }

  updateStatus([UserStatus? userStatus]) async {
    if (state.loading) return;
    emit(state.copyWith(loading: true));

    int status = state.user.status == 1 ? 0 : 1;
    if (userStatus == UserStatus.offline) status = 0;
    if (userStatus == UserStatus.online) status = 1;
    if (userStatus == UserStatus.busy) status = 2;
    try {
      await UserStatusService.updateStatus(status: status);

      await LocalStorage.sharedRef
          .setValue(LocalStorage.user, state.user.copyWith(status: status));
      emit(state.copyWith(
        loading: false,
        user: state.user.copyWith(status: status),
      ));
    } catch (err) {
      emit(state.copyWith(
        loading: false,
      ));
    }
  }

  reset() async {
    await LocalStorage.sharedRef.removeValue(LocalStorage.user);
    await LocalStorage.sharedRef.removeValue(LocalStorage.token);
    await LocalStorage.sharedRef.removeValue(LocalStorage.userLocation);

    Signalr.stopConnection();

    emit(const UserState());
  }
}
