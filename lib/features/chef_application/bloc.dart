import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/model/model.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/features/settings/profile/model/profile_model.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/meal_model.dart';

// =============================================================================
// Events

class ChefFlowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChefFlowEventStart extends ChefFlowEvent {}

class ChefFlowEventNext extends ChefFlowEvent {
  final int idx;

  ChefFlowEventNext({required this.idx});

  @override
  List<Object?> get props => [idx];
}

class ChefFlowEventSubmit extends ChefFlowEvent {}

// =============================================================================
// State

class ChefFlowState extends Equatable {
  final bool started;
  final int activeIdx;

  const ChefFlowState(this.activeIdx, {this.started = false});

  ChefFlowState copyWith({int? activeIdx, bool? started}) => ChefFlowState(
        activeIdx ?? this.activeIdx,
        started: started ?? this.started,
      );

  bool get profileSheetDone {
    Profile profile = G.read<ProfileBloc>().state.profile;

    return profile.profileSheetDone;
  }

  bool get menuActive => profileSheetDone;
  bool get menuDone {
    List<MealModel> meals = G.read<MealListBloc>().state.meals;
    bool hasScheduledDays =
        G.read<ScheduleBloc>().state.schedule.hasScheduledDays;

    return meals.isNotEmpty && hasScheduledDays;
  }

  bool get docsActive => menuActive && menuDone;
  bool get docsDone => true;

  bool get approvalActive => docsActive && docsDone;
  bool get approvalDone => true;

  bool get contractActive => approvalActive && approvalDone;
  bool get contractDone => true;

  @override
  List<Object> get props => [activeIdx, started];
}

// =============================================================================
// Bloc

class ChefFlowBloc extends Bloc<ChefFlowEvent, ChefFlowState> {
  ChefFlowBloc() : super(const ChefFlowState(0, started: true)) {
    on<ChefFlowEventStart>((event, emit) {
      emit(state.copyWith(started: true));
    });

    on<ChefFlowEventNext>((event, emit) {
      if (!state.started || state.activeIdx > event.idx) return;

      emit(state.copyWith(activeIdx: event.idx));
    });

    on<ChefFlowEventSubmit>((event, emit) {
      emit(state.copyWith(started: false));
    });
  }
}
