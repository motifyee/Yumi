import 'dart:io';

import 'package:common_code/common_code.dart';
import 'package:common_code/domain/auth/entities/signup_data.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:dependencies/dependencies.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumi/app/pages/auth/registeration/pages/onboarding_screen/onboarding_steps.dart';
import 'package:yumi/app/pages/auth/registeration/repository/address_repo.dart';
import 'package:yumi/app/pages/auth/registeration/verify_otp_sheet.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/count_down_cubit/count_down_cubit.dart';
import 'package:common_code/domain/vehicle/entities/vehicle.dart';
import 'package:yumi/app/pages/auth/registeration/pages/onboarding_screen/entity/onboarding.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app_target.dart';
import 'package:common_code/domain/vehicle/use_cases/add_vehicle.dart';
import 'package:common_code/domain/vehicle/use_cases/get_vehicle.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';

part 'reg_cubit.freezed.dart';

const String regStepKey = 'reg_step';
const String partialFlowKey = 'partial_flow';
const String onboardingProgressKey = 'onboarding_progress';

enum RegStep {
  // signup
  signup,
  addPhone,
  otp,
  location,
  onboarding,

  // onboarding:
  // bio,
  // meals,
  // rides,
  // schedule,
  // docs,
  // accountApproval,
  // contract,
  // contractApproval,
}

@freezed
abstract class RegState with _$RegState {
  const factory RegState({
    @Default(false)

    /// allows using single components/pages from the registration flow extenally
    bool partialFlow,
    @Default(false) bool registerationStarted,
    @Default(false) bool finished,
    @Default(-1) int step,

    /// stops automatic flow at [lastStep]
    @Default(-1) int lastStep, // applies to partial flow
    //
    String? email,
    String? willVerifyEmail,
    String? verifiedEmail,
    String? emailOTP,
    @Default(Status.init) Status verifiedEmailStatus,
    //
    @Default(SignupData()) SignupData signupData, // step: 0
    @Default('') String singupError,
    String? phone, // step: 1
    String? otp, // step: 2
    @Default(Address(isDefault: true)) Address address, // step: 3
    //
    @Default('') String message,
    @Default(Status.init) Status status,
    @Default('') String addressMessage,
    @Default(Status.init) Status addressStatus,
    //
    @Default(Vehicle(typeCode: 0)) Vehicle vehicle,
    @Default(Status.init) Status ridesStatus,
    //
    @Default(0) int storedOnboardingProgress,
    Unique? unique,
    int? countDown,
  }) = _Initial;

  factory RegState.initial() => const RegState();

  Future<bool> get canAddVehicle async {
    var regCub = G().rd<RegCubit>();

    regCub.setRidesLoading();
    final task = await GetVehicle().call(NoParams());
    regCub.setRidesLoading(false);
    return task.fold(
      (l) => true,
      (vehicle) {
        regCub.setVehicleType(vehicle);
        return false;
      },
    );
  }

  const RegState._();

  Onboarding get onboarding => Onboarding(); // step: 4
}

class RegCubit extends Cubit<RegState> {
  RegCubit() : super(RegState.initial());

// -----------------------------------------------------------------------------

  void setStatus(Status status) => emit(state.copyWith(status: status));

  Future<bool> hasActiveRegisteration() async {
    return await G().prefs.then((prefs) {
      if ((prefs.getBool(partialFlowKey) ?? false)) return false;

      return prefs.getInt(regStepKey) != null;
    });
  }

  Future<void> initReg({bool partialFlow = false, int lastStep = -1}) async {
    setStatus(Status.loading);

    //return finish();

    // read step index from shared preferences
    var pref = await SharedPreferences.getInstance();
    var step = pref.getInt(regStepKey) ?? 0;

    if (G().rd<UserCubit>().state.user.accessToken.isEmpty) step = 0;

    if (!state.registerationStarted) {
      emit(
        state.copyWith(
          registerationStarted: true,
          partialFlow: partialFlow,
          lastStep: lastStep,
          signupData: SignupData(
            code: CodeGenerator.getRandomCode(),
            fullName: '',
            userName: '',
            // mobile: '',
            signupType: '2',
            countryID: '3',
            email: '',
            password: '',
            branchId: AppTarget.branch,
          ),
        ),
      );
    }

    if (step >= 0) await navigateToIdx(step);

    await loadOnboardingProgress();

    if (step > 0) {
      await G().rd<ProfileCubit>().getProfileForm();
      if (G().isDriverApp) await getVehicle();
      if (G().isChefApp) {
        G().rd<MealCubit>().reset();
        G()
            .rd<MealCubit>()
            .updateMeals(chefId: G().rd<UserCubit>().state.user.chefId);
      }
      if (!G().isCustomerApp) {
        G().rd<ScheduleCubit>().reset();
        await G().rd<ScheduleCubit>().loadSchedule();
      }
    }

    setStatus(Status.idle);
  }

  Future<void> finish([bool login = true]) async {
    final user = G().rd<UserCubit>().state.user;

    if (!login || user.email.isEmpty || (user.password ?? '').isEmpty) {
      return _gotoHomePageAndFinish();
    }

    final params = LoginWithEmailParams(LoginData(
      email: state.signupData.email?.onEmpty(user.email) ?? '',
      password: state.signupData.password?.onEmpty(user.password ?? '') ?? '',
    ));

    final task = await LoginWithEmail().call(params);
    task.fold(
      (l) => _gotoHomePageAndFinish(),
      (r) async {
        await G().rd<UserCubit>().saveUser(r);
        await G().rd<UserCubit>().saveLocation(Address.fromJson(r.toJson()));
        _gotoHomePageAndFinish();
      },
    );
  }

  Future<void> _gotoHomePageAndFinish() async {
    await G().router.replaceAll([HomeRoute()]).then(
      (value) => reset(finished: true),
    );
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

// -----------------------------------------------------------------------------
// Account

  Future<bool> setAccount(
    SignupData signupData, [
    bool navigateToNext = false,
  ]) async {
    // TODO keep in storage

    emit(state.copyWith(signupData: signupData));
    if (navigateToNext) await navigateToIdx(1);
    return true;
  }

  Future<bool> signup() async {
    final params = SignupParams(state.signupData);
    final task = await Signup().call(params);

    return task.fold(
      (l) {
        emit(state.copyWith(singupError: l.toString()));
        return false;
      },
      (r) {
        G().rd<UserCubit>().saveUser(r).then((_) {
          G().rd<ProfileCubit>().getProfileForm();
        });
        return true;
      },
    );
  }

  void setWillVerifyEmail(String email) {
    emit(state.copyWith(willVerifyEmail: email));
  }

  Future<bool> getEmailOTP(String email) async {
    emit(state.copyWith(verifiedEmailStatus: Status.loading));
    final verify = await VerifyEmail().call(VerifyEmailParams(email));

    return verify.fold(
      (l) {
        emit(state.copyWith(verifiedEmailStatus: Status.error));
        return false;
      },
      (r) {
        emit(
          state.copyWith(
            emailOTP: r,
            email: email,
            verifiedEmailStatus: Status.success,
          ),
        );
        return true;
      },
    );
  }

  bool verifyEmailOTP(String otp) {
    if (otp != state.emailOTP) return false;

    emit(state.copyWith(verifiedEmail: state.email));
    return true;
  }

// -----------------------------------------------------------------------------
// Mobile

  Future<String?> setMobile(String phone) async {
    var profile = G().rd<ProfileCubit>().state.form.copyWith(mobile: phone);
    var update = await G().rd<ProfileCubit>().updateProfileForm(profile);

    if (update.isLeft()) {
      setStatus(Status.error);
      return G()
          .rd<ProfileCubit>()
          .state
          .form
          .entityStatus
          .message
          .onEmpty('The mobile number is already used.');
    }

    emit(state.copyWith(phone: phone));

    return (await getMobileOTP()).fold(
      (l) => 'Something went wrong. try again.',
      (r) {
        return null;
      },
    );
  }

  Future<Either<Failure, String>> getMobileOTP() async {
    setStatus(Status.loading);
    final getOTP = await GetMobileOTP().call(NoParams());

    getOTP.fold(
      (l) {
        setStatus(Status.error);
      },
      (r) {
        emit(state.copyWith(status: Status.success, otp: r));
        startCountDown();
      },
    );

    return getOTP;
  }

  Future verifyMobileOTP(String otp) async {
    setStatus(Status.loading);
    final verify = await VerifyMobileOTP().call(VerifyOTPParams(otp));

    verify.fold(
      (l) => setStatus(Status.error),
      (r) async {
        stopCountDown();

        setStatus(Status.idle);
        if (state.lastStep == RegStep.addPhone.index) {
          G().rd<ProfileCubit>().getProfileForm();
          return G().pop();
        }

        navigateToIdx(3);
      },
    );
  }

// -----------------------------------------------------------------------------
// Location

  void setLocation(Address address) {
    emit(state.copyWith(address: address));
  }

  Future<void> saveLocation({
    Function({required Address address})? routeFn,
  }) async {
    if (state.addressStatus == Status.loading) return;
    emit(state.copyWith(addressStatus: Status.loading));
    await tryCall(
      () => AddressRepo.addAddress(address: state.address),
    ).then((res) async {
      if (res == null) {
        emit(state.copyWith(addressStatus: Status.success));

        if (routeFn != null) return routeFn(address: state.address);
        if (G().isCustomerApp) return finish(true);
        return await navigateToIdx(4);
      }

      emit(state.copyWith(
        addressMessage: res,
        addressStatus: Status.error,
        unique: unique(),
      ));
    });
  }

// -----------------------------------------------------------------------------
// Onboarding

  void refresh() {
    onboardingProgress;
    if (state.registerationStarted) {
      loadOnboardingProgress();
      emit(state.copyWith(unique: unique()));
    }
  }

  int get onboardingProgress {
    var p = state.onboarding.calcOnboardingProgress; // calculated steps
    var sp = state.storedOnboardingProgress; // emitted from shared_prefrences

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

    emit(state.copyWith(storedOnboardingProgress: idx));
  }

  Future<void> loadOnboardingProgress() async {
    var pref = await SharedPreferences.getInstance();
    var idx = pref.getInt(onboardingProgressKey) ?? 0;
    emit(state.copyWith(storedOnboardingProgress: idx));
  }

  void nextButtonPressed() async {
    var context = G().context;
    setStatus(Status.loading);

    await context.read<ProfileCubit>().getProfileForm().then((value) async {
      setStatus(Status.idle);

      var stepsInfo = G().isChefApp
          ? chefOnboardingSteps(context, state)
          : driverOnboardingSteps(context, state);

      var idx = onboardingProgress;
      if (idx < stepsInfo.length) return stepsInfo[idx].onTap();

      await finish(true);
    });
  }

// -----------------------------------------------------------------------------
// Vehicle

  Future<void> getVehicle() async {
    final task = await GetVehicle().call(NoParams());
    task.fold(
      (l) => null,
      (vehicle) => emit(state.copyWith(vehicle: vehicle)),
    );
  }

  Future<Either<Failure, String>> saveVehicleType() async {
    final params = AddVehicleParams(vehicle: state.vehicle);
    final task = await AddVehicle().call(params);
    task.fold(
      (l) => emit(
        state.copyWith(
            ridesStatus: Status.error,
            message: 'could\'nt update your vehicle!'),
      ),
      (r) => emit(state.copyWith(vehicle: state.vehicle)),
    );

    return task;
  }

  void setVehicleType(Vehicle vehicle) {
    emit(state.copyWith(vehicle: vehicle));
  }

  void setRidesLoading([bool loading = true]) {
    emit(state.copyWith(ridesStatus: loading ? Status.loading : Status.idle));
  }

// -----------------------------------------------------------------------------
// Navigation

  // navigate to corresponding page based on step index
  // TODO should only be called from within widgets
  Future<void> navigateToIdx(int step) async {
    if (step > 4) step = 4;
    if (step < 0) step = 0;
    if (!Platform.isAndroid && !Platform.isIOS && step == 3) step = 4;
    if (G().isCustomerApp && step == 4) return finish(true);

    var path = G().router.currentPath;

    // if (path.contains('/login')) return;
    if (!state.registerationStarted) return;
    if (path == '/registeration/${RegStep.values[step].name}') return;

    await G().router.navigate(RegisterationRoute(children: [_getPage(step)]));
    final storageKey = VerifyOtpSheet.storageKey(OTPType.email);
    if (step == 0) {
      // if (await hasActiveCountDown(storageKey: storageKey)) {
      final email = await counterStoredValue(storageKey: storageKey);

      emit(
        state.copyWith(
          willVerifyEmail: email,
        ),
      );
      // }
    }

    emit(state.copyWith(step: step));
    await saveStepToCache(step);
  }

  Future saveStepToCache(int step) async {
    // save step index to shared preferences
    var pref = await SharedPreferences.getInstance();
    pref.setInt(regStepKey, step);
    pref.setBool(partialFlowKey, state.partialFlow);
  }

  Future<void> reset({bool finished = false}) async {
    emit(RegState(finished: finished));

    await G().prefs.then((prefs) async {
      await prefs.remove(regStepKey);
      await prefs.remove(partialFlowKey);
      await prefs.remove(onboardingProgressKey);
    });

    G().rd<ProfileCubit>().reset();
    if (!G().isCustomerApp) {
      G().rd<ScheduleCubit>().reset();
      G().rd<DocsCubit>().reset();
    }
    if (G().isChefApp) {
      G().rd<MealCubit>().reset();
    }
  }
}

PageRouteInfo _getPage(int step) => switch (RegStep.values[step]) {
      RegStep.signup => const SignUpRoute(),
      RegStep.addPhone => const AddPhoneRoute(),
      RegStep.otp => const OTPRoute(),
      RegStep.location => LocationRoute(),
      // RegStep.onboarding => const OnboardingRoute(),
      _ => const OnboardingRoute(),
    };
