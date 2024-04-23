import 'package:flutter/foundation.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/app/pages/chef_application/documentation/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/schedule/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/domain/profile/entities/profile.dart';
import 'package:yumi/global.dart';

class Onboarding {
  bool get profileSheetDone {
    Profile profile = G.read<ProfileBloc>().state.profile;

    // Profile profile = ProfileBloc().r.state.profile;

    return profile.profileSheetDone;
  }

  // chefs only
  bool get mealsActive =>
      _onboardingProgress > 0 || approvalDone || profileSheetDone;
  bool get mealsDone {
    if (!mealsActive) return false;
    if (G.read<MealListBloc>().state.meals.isEmpty) return false;
    // if (!G.read<ScheduleBloc>().state.schedule.hasScheduledDays) return false;
    if (!G.rd<ScheduleCubit>().state.schedule.hasScheduledDays) return false;

    return true;
  }

  // drivers only
  bool get ridesActive =>
      _onboardingProgress > 0 || approvalDone || profileSheetDone;
  bool get ridesDone {
    if (!ridesActive) return false;
    // if (G.cread<RegCubit>().state.vehicleType == null) return false;
    if (G.rd<RegCubit>().state.vehicle.vehicleName()?.isEmpty ?? false) {
      return false;
    }
    // if (!G.read<ScheduleBloc>().state.schedule.validSchedule) return false;
    if (!G.rd<ScheduleCubit>().state.schedule.validSchedule) return false;

    return true;
  }

  bool get stepTwoDone {
    if (approvalDone) return true;

    if (G.yumiApp.config.appTargetUser == AppTargetUser.drivers) {
      return ridesDone;
    }
    return mealsDone;
  }

  bool get docsActive => _onboardingProgress > 1 || stepTwoDone;
  bool get docsDone => docsActive && G.rd<DocsCubit>().state.finished;

  bool get approvalActive =>
      _onboardingProgress > 2 || approvalDone || docsDone;
  // bool get approvalDone => true;
  bool get approvalDone => G.read<ProfileBloc>().state.profile.accountApproved;

  bool get contractActive => approvalDone;
  bool get contractDone => (contractActive &&
      G.read<ProfileBloc>().state.profile.contractPhoto != null);

  int get _onboardingProgress => G.rd<RegCubit>().state.onboardingProgress;
  int get onboardingProgress {
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

    return progress;
  }

  bool get onboardingComplete {
    return onboardingProgress == 5;
  }

  bool get onboardingRequired {
    return onboardingProgress < 5;
  }
}
