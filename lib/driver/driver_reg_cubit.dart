import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/driver/model/vehicle.dart';
import 'package:yumi/driver/onboarding.dart';
import 'package:yumi/driver/rides_service.dart';
import 'package:yumi/features/chef_application/flow_step_info.dart';
import 'package:yumi/features/registeration/maps/permission.dart';
import 'package:yumi/features/registeration/model/address.dart';
import 'package:yumi/features/registeration/model/registeration.dart';
import 'package:yumi/features/registeration/repository/address_repo.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/features/settings/profile/profile_service.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/util/util.dart';

part 'driver_reg_cubit.freezed.dart';

const String regStepKey = 'reg_step';
const String onboardingProgressKey = 'onboarding_progress';

enum RegStep { signup, addPhone, otp, location, onboarding }

// TODO Handle async errors
@freezed
class NRegState with _$NRegState {
  const factory NRegState({
    @Default(false) bool registerationStarted,
    @Default(0) int step,
    //
    RegisterationForm? singupData, // step: 0
    String? phone, // step: 1
    String? otp, // step: 2
    @Default(Address(isDefault: true)) Address address, // step: 3
    //
    @Default('') String message,
    @Default(BlocStatus.init) BlocStatus status,
    @Default('') String addressMessage,
    @Default(BlocStatus.init) BlocStatus addressStatus,
    //
    // bool? otherVehicle,
    // String? vehicleType,
    @Default(Vehicle(typeCode: 0)) Vehicle vehicle,
    //
    @Default(0) int onboardingProgress,
    // timeStamp forces comparison of the same state to fail
    Unique? unique,
  }) = _Initial;

  factory NRegState.initial() => const NRegState();

  Future<bool> get canAddVehicle async {
    return await VehicleService.getVehicle() == null;
  }

  const NRegState._();

  Onboarding get onboarding => Onboarding(); // step: 4

  List<String> get screenNames => [
        'signup',
        'addPhone',
        'otp',
        'location',
        'onboarding',
      ];
}

class RegCubit extends Cubit<NRegState> {
  RegCubit() : super(NRegState.initial());

// -----------------------------------------------------------------------------
// Navigation

  void init() async {
    // read step index from shared preferences
    var pref = await SharedPreferences.getInstance();
    var step = pref.getInt(regStepKey) ?? 0;
    // step = 0;
    if (G.read<UserBloc>().state.user.accessToken.isEmpty) step = 0;

    if (!state.registerationStarted) {
      emit(const NRegState(registerationStarted: true));
    }

    if (step > 0) _navigateToIdx(step);
  }

  // void next() {
  //   _navigateToIdx(state.step + 1);
  // }
  // void previous() {
  //   _navigateToIdx(state.step - 1);
  // }
  // void goto(int step) {
  //   _navigateToIdx(step);
  // }

  void refresh() {
    if (state.registerationStarted) {
      getOnboardingProgress();
      emit(state.copyWith(unique: unique()));
    }
  }

  int get onboardingProgress {
    return state.onboarding.onboardingProgress;
  }

  void setOnboardingProgress(int idx) {
    if (idx <= onboardingProgress) return;

    // save step index to shared preferences
    SharedPreferences.getInstance()
        .then((value) => value.setInt(onboardingProgressKey, idx));

    emit(state.copyWith(onboardingProgress: idx));
  }

  void getOnboardingProgress() async {
    var pref = await SharedPreferences.getInstance();
    var idx = pref.getInt(onboardingProgressKey) ?? 0;
    emit(state.copyWith(onboardingProgress: idx));
  }

  void nextButtonPressed() {
    var context = G.context;
    var stepsInfo = G.isChefApp
        ? chefStepsInfo(context, state)
        : driverStepsInfo(context, state);

    var idx = onboardingProgress;
    if (idx < stepsInfo.length) return stepsInfo[idx][2]();

    SharedPreferences.getInstance().then((value) => value.remove(regStepKey));
    context.router.replaceAll([HomeRoute()]);
  }
// -----------------------------------------------------------------------------
// Actions

  void setAccount(RegisterationForm signupData) {
    // TODO keep in storage
    emit(state.copyWith(singupData: signupData));
    _navigateToIdx(1);
  }

  void setPhone(String phone) async {
    var profile = G.read<ProfileBloc>().state.profile;
    await ProfileService.updateProfile(
      profile.copyWith(mobile: phone, updatedBy: '366').toJson(),
    ).then((res) {
      _navigateToIdx(2);
      emit(state.copyWith(phone: phone));
    });
  }

  void setOTP(String otp) {
    emit(state.copyWith(otp: otp));
    _navigateToIdx(3);
  }

  void setLocation(Address address) {
    emit(state.copyWith(address: address));
  }

  void saveLocation({
    Function({required Address address})? routeFn,
  }) async {
    await tryV(
      () => AddressRepo.addAddress(address: state.address),
    ).then((res) {
      if (res == null) {
        emit(state.copyWith(addressStatus: BlocStatus.success));

        if (routeFn != null) return routeFn(address: state.address);
        return _navigateToIdx(4);
      }

      emit(state.copyWith(
        addressMessage: res,
        addressStatus: BlocStatus.error,
        unique: unique(),
      ));
    });
  }

  void setVehicleType(Vehicle vehicle) {
    emit(state.copyWith(vehicle: vehicle));
  }

  // void setOtherVehicle(bool otherVehicle) {
  //   emit(state.copyWith(otherVehicle: otherVehicle));
  // }

  Future saveVehicleType() async {
    return VehicleService.addVehicle(state.vehicle)
        .then(
      (value) => emit(state.copyWith(vehicle: state.vehicle)),
    )
        .catchError((_) {
      emit(
        state.copyWith(
            status: BlocStatus.error,
            message: 'could\'nt update your vehicle!'),
      );

      throw 'could\'nt update your vehicle!';
    });
  }

  // navigate to corresponding page based on step index
  _navigateToIdx(int step) async {
    if (step > 4) step = 4;
    if (step < 0) step = 0;

    if (!Platform.isAndroid && !Platform.isIOS && step == 3) step = 4;

    var path = G.router.currentPath;

    if (path == '/registeration/${RegStep.values[step].name}') return;
    if (!state.registerationStarted) return;

    if (!path.contains("registeration")) {
      G.router
          .push(const RegisterationRoute())
          .then((value) => G.router.navigateNamed(RegStep.values[step].name));
    } else {
      G.router.navigateNamed(RegStep.values[step].name);
    }

    emit(state.copyWith(step: step));

    // save step index to shared preferences
    var pref = await SharedPreferences.getInstance();
    pref.setInt(regStepKey, step);
  }
}