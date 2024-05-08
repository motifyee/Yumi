import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/driver/model/vehicle.dart';
import 'package:yumi/app/pages/driver/onboarding.dart';
import 'package:yumi/app/pages/driver/rides_service.dart';
import 'package:yumi/app/pages/chef_application/flow_step_info.dart';
import 'package:yumi/app/pages/auth/register/maps/permission.dart';
import 'package:yumi/app/pages/auth/register/model/address.dart';
import 'package:yumi/app/pages/auth/register/model/registeration.dart';
import 'package:yumi/app/pages/auth/register/repository/address_repo.dart';
import 'package:yumi/app/pages/schedule/cubit/schedule_cubit.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/profile/use_cases/get_otp.dart';
import 'package:yumi/domain/profile/use_cases/update_profile.dart';
import 'package:yumi/domain/profile/use_cases/verify_otp.dart';
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
    @Default(Status.init) Status status,
    @Default('') String addressMessage,
    @Default(Status.init) Status addressStatus,
    //
    // bool? otherVehicle,
    // String? vehicleType,
    @Default(Vehicle(typeCode: 0)) Vehicle vehicle,
    //
    @Default(0) int onboardingProgress,
    // timeStamp forces comparison of the same state to fail
    Unique? unique,
    int? countDown,
  }) = _Initial;

  factory NRegState.initial() => const NRegState();

  Future<bool> get canAddVehicle async {
    var regCub = G.rd<RegCubit>();

    regCub.setLoading();
    var vehicle = await VehicleService.getVehicle();
    regCub.setLoading(false);

    if (vehicle == null) return true;

    regCub.setVehicleType(vehicle);
    return false;
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

  void setLoading([bool loading = true]) {
    emit(state.copyWith(status: loading ? Status.loading : Status.idle));
  }

  void _initData() {
    if (G.read<UserBloc>().state.user.accessToken.isEmpty) return;

    if (G.rd<ProfileCubit>().state.form.guid.isEmpty) {
      G.rd<ProfileCubit>().getProfileForm();
    } else if ((G.read<UserBloc>().state.user.chefId?.isNotEmpty ?? false)) {
      G.read<MealListBloc>().add(
            MealListUpdateEvent(
              context: G.context,
              chefId: G.read<UserBloc>().state.user.chefId,
            ),
          );
    }
  }

  void init() async {
    // finish();
    _initData();

    // read step index from shared preferences
    var pref = await SharedPreferences.getInstance();
    var step = pref.getInt(regStepKey) ?? 0;
    // step = 0;
    if (G.read<UserBloc>().state.user.accessToken.isEmpty) step = 0;

    if (!state.registerationStarted) {
      emit(state.copyWith(registerationStarted: true));
    }

    getOnboardingProgress();
    getVehicle();
    // G.read<ScheduleBloc>().add(const ScheduleEvent.init());
    if (!G.isCustomerApp) G.rd<ScheduleCubit>().loadSchedule();

    if (step > 0) _navigateToIdx(step);
  }

  void finish() async {
    var pref = await SharedPreferences.getInstance();
    pref.remove(regStepKey);
    pref.remove(onboardingProgressKey);

    G.router.replaceAll([HomeRoute()]).then((value) {
      emit(state.copyWith(registerationStarted: false));
    });
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
    onboardingProgress;
    if (state.registerationStarted) {
      getOnboardingProgress();
      emit(state.copyWith(unique: unique()));
    }
  }

  int get onboardingProgress {
    var p = state.onboarding.onboardingProgress;
    var sp = state.onboardingProgress;
    if (p > sp) {
      setOnboardingProgress(p);
      return p;
    }
    setOnboardingProgress(sp);
    return sp;
  }

  void setOnboardingProgress(int idx) {
    // if (idx <= onboardingProgress) return;

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

  void nextButtonPressed() async {
    var context = G.context;
    setLoading();

    await context.read<ProfileCubit>().getProfileForm().then((value) {
      setLoading(false);

      var stepsInfo = G.isChefApp
          ? chefStepsInfo(context, state)
          : driverStepsInfo(context, state);

      var idx = onboardingProgress;
      if (idx < stepsInfo.length) return stepsInfo[idx][2]();

      finish();
    });
  }
// -----------------------------------------------------------------------------
// Actions

  void startCountDown([int seconds = 60, bool init = true]) {
    if (init) emit(state.copyWith(countDown: seconds));

    Future.delayed(const Duration(seconds: 1)).then((value) {
      if ((state.countDown ?? 0) <= 0) return;

      emit(state.copyWith(countDown: state.countDown! - 1));
      startCountDown(60, false);
    });
  }

  void stopCountDown() {
    emit(state.copyWith(countDown: null));
  }

  void setAccount(RegisterationForm signupData) {
    // TODO keep in storage
    emit(state.copyWith(singupData: signupData));
    _navigateToIdx(1);
  }

  void setPhone(String phone) async {
    var profile = G.rd<ProfileCubit>().state.form.copyWith(mobile: phone);
    var update = await G.rd<ProfileCubit>().updateProfileForm(profile);

    // final update = await UpdateProfile().call(UpdateProfileParam(profile));
    if (update == null) return emit(state.copyWith(status: Status.error));

    emit(state.copyWith(phone: phone));

    (await getOTP()).fold((l) => null, (r) => _navigateToIdx(2, otp: r));

    // update.fold(
    //   (l) => emit(state.copyWith(status: Status.error)),
    //   (r) async {
    //     emit(state.copyWith(phone: phone));

    //     (await getOTP()).fold((l) => null, (r) => _navigateToIdx(2, otp: r));
    //   },
    // );
  }

  Future<Either<Failure, String>> getOTP() async {
    emit(state.copyWith(status: Status.loading));
    final getOTP = await GetOTP().call(NoParams());

    getOTP.fold(
      (l) {
        emit(state.copyWith(status: Status.error));
      },
      (r) {
        emit(state.copyWith(status: Status.success, otp: r));
        startCountDown();
      },
    );

    return getOTP;
  }

  Future verifyOTP(String otp) async {
    emit(state.copyWith(status: Status.loading));
    final verify = await VerifyOTP().call(VerifyOTPParams(otp));

    // if (!kReleaseMode) {
    //   stopCountDown();
    //   _navigateToIdx(3);
    // }

    verify.fold(
      (l) => emit(state.copyWith(status: Status.error)),
      (r) {
        emit(state.copyWith(status: Status.success));
        stopCountDown();
        _navigateToIdx(3);
      },
    );
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
        emit(state.copyWith(addressStatus: Status.success));

        if (routeFn != null) return routeFn(address: state.address);
        if (G.isCustomerApp) return finish();
        return _navigateToIdx(4);
      }

      emit(state.copyWith(
        addressMessage: res,
        addressStatus: Status.error,
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

  void getVehicle() async {
    var vehicle = await VehicleService.getVehicle();
    if (vehicle == null) return;
    emit(state.copyWith(vehicle: vehicle));
  }

  Future saveVehicleType() async {
    return VehicleService.addVehicle(state.vehicle)
        .then(
      (value) => emit(state.copyWith(vehicle: state.vehicle)),
    )
        .catchError((_) {
      emit(
        state.copyWith(
            status: Status.error, message: 'could\'nt update your vehicle!'),
      );

      throw 'could\'nt update your vehicle!';
    });
  }

  // navigate to corresponding page based on step index
  // TODO should only be called from within widgets
  void _navigateToIdx(
    int step, {
    String? otp,
  }) async {
    if (step > 4) step = 4;
    if (step < 0) step = 0;

    if (!Platform.isAndroid && !Platform.isIOS && step == 3) step = 4;
    if (G.isCustomerApp && step == 4) return finish();

    var path = G.router.currentPath;

    if (path == '/registeration/${RegStep.values[step].name}') return;
    if (!state.registerationStarted) return;

    G.router.navigate(RegisterationRoute(children: [getPage(step, otp: otp)]));

    // if (path.contains("/registeration")) {
    //   G.router.navigateNamed(RegStep.values[step].name);
    // } else {
    //   G.router.replaceNamed('/registeration/${RegStep.values[step].name}');
    // }

    emit(state.copyWith(step: step));

    // save step index to shared preferences
    var pref = await SharedPreferences.getInstance();
    pref.setInt(regStepKey, step);
  }
}

PageRouteInfo getPage(
  int step, {
  String? otp,
}) {
  switch (RegStep.values[step]) {
    case RegStep.signup:
      return SignUpRoute();
    case RegStep.addPhone:
      return const AddPhoneRoute();
    case RegStep.otp:
      return const OTPRoute();
    case RegStep.location:
      return LocationRoute();
    case RegStep.onboarding:
      return const ChefApplicationFlowRoute();
  }
}
