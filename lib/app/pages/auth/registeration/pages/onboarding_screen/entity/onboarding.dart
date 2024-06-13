import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';

class Onboarding {
  bool get profileSheetDone {
    Profile profile = G.rd<ProfileCubit>().state.form;

    return profile.profileSheetDone;
  }

  // ---------------------------------------------------------------------------

  // chefs only
  bool get mealsActive =>
      _onboardingProgress > 0 || approvalDone || profileSheetDone;
  bool get mealsDone {
    if (!mealsActive) return false;
    if (G.read<MealListBloc>().state.meals.isEmpty) return false;

    if (!G.rd<ScheduleCubit>().state.schedule.validSchedule) return false;

    return true;
  }

  // drivers only
  bool get ridesActive =>
      _onboardingProgress > 0 || approvalDone || profileSheetDone;
  bool get ridesDone {
    if (!ridesActive) return false;

    if (G.rd<RegCubit>().state.vehicle.vehicleName()?.isEmpty ?? false) {
      return false;
    }

    if (!G.rd<ScheduleCubit>().state.schedule.validSchedule) return false;

    return true;
  }

  bool get stepTwoDone {
    if (G.isDriverApp) return ridesDone;

    return mealsDone;
  }

  // ---------------------------------------------------------------------------

  bool get docsActive => approvalDone || _onboardingProgress > 1 || stepTwoDone;
  bool get docsDone =>
      docsActive && G.rd<ProfileCubit>().state.form.documentaionDone;

  bool get approvalActive =>
      _onboardingProgress > 2 || approvalDone || docsDone;

  bool get approvalDone => G.rd<ProfileCubit>().state.form.accountApproved;
  // approvalActive &&

  // ---------------------------------------------------------------------------

  bool get contractActive => approvalDone;
  bool get contractDone =>
      (contractActive && G.rd<ProfileCubit>().state.form.contractPhoto != null);

  bool get contractApprovalActive =>
      _onboardingProgress > 4 || contractApprovalDone || contractDone;
  bool get contractApprovalDone {
    Profile profile = G.rd<ProfileCubit>().state.form;

    return contractDone && (profile.contractApproved ?? false);
  }

  // ---------------------------------------------------------------------------

  int get _onboardingProgress => 0; //G.rd<RegCubit>().state.onboardingProgress;
  int get calcOnboardingProgress {
    int progress = 0;

    if (profileSheetDone) {
      progress += 1;
    } else {
      return progress;
    }
    if (stepTwoDone) {
      progress += 1;
    } else {
      return progress;
    }

    if (approvalDone) {
      progress += 2;
    } else if (docsDone) {
      progress += 1;
      return progress;
    } else {
      return progress;
    }
    if (contractDone) progress += 1;
    if (contractApprovalDone) progress += 1;

    return progress;
  }

  bool get onboardingComplete {
    return calcOnboardingProgress == 5;
  }

  bool get onboardingRequired {
    return calcOnboardingProgress < 5;
  }
}
