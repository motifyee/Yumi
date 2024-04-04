// TODO check progress to determine required api calls
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/driver/driver_reg_cubit.dart';
import 'package:yumi/features/chef_application/documentation/bloc/cubit/docs_cubit.dart';
import 'package:yumi/features/chef_application/documentation/bloc/documentation_bloc.dart';
import 'package:yumi/features/chef_application/flow_step_info.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/features/settings/profile/model/profile_model.dart';
import 'package:yumi/global.dart';

class Onboarding {
  bool get profileSheetDone {
    Profile profile = G.read<ProfileBloc>().state.profile;

    return profile.profileSheetDone;
  }

  // chefs only
  bool get mealsActive => approvalDone || profileSheetDone;
  bool get mealsDone {
    if (!mealsActive) return false;
    if (G.read<MealListBloc>().state.meals.isEmpty) return false;
    if (!G.read<ScheduleBloc>().state.schedule.hasScheduledDays) return false;

    return true;
  }

  // drivers only
  bool get ridesActive => approvalDone || profileSheetDone;
  bool get ridesDone {
    if (!ridesActive) return false;
    // if (G.cread<RegCubit>().state.vehicleType == null) return false;
    if (G.rd<RegCubit>().state.vehicle.vehicleName()?.isEmpty ?? false) {
      return false;
    }
    if (!G.read<ScheduleBloc>().state.schedule.validSchedule) return false;

    return true;
  }

  bool get stepTwoDone {
    if (approvalDone) return true;

    if (G.yumiApp.config.appTargetUser == AppTargetUser.drivers) {
      return ridesDone;
    }
    return mealsDone;
  }

  bool get docsActive => stepTwoDone;
  bool get docsDone => docsActive && G.rd<DocsCubit>().state.finished;

  bool get approvalActive => approvalDone || docsDone;
  bool get approvalDone => true;
  // bool get approvalDone => G.read<ProfileBloc>().state.profile.accountApproved;

  bool get contractActive => approvalDone;
  bool get contractDone =>
      contractActive &&
      G.read<ProfileBloc>().state.profile.contractPhoto != null;

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
    if (docsDone) {
      progress += 1;
    } else {
      return progress;
    }
    if (approvalDone) {
      progress += 1;
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
