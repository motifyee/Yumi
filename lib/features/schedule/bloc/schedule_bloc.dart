import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/schedule/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/features/schedule/repository/interface.dart';

part 'schedule_state.dart';
part 'schedule_event.dart';
part 'schedule_bloc.freezed.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final IScheduleRepo scheduleRepo;

  ScheduleBloc({required this.scheduleRepo}) : super(const ScheduleState()) {
    on<ScheduleEvent>(
      (events, emit) async {
        await events.map(
          init: (value) async {
            emit(state.copyWith(status: BlocStatus.loading));

            await scheduleRepo.getMySchedule(value.ctx).then(
                  (value) => emit(state.copyWith(
                    schedule: value,
                    scheduleForm: value,
                    status: BlocStatus.loaded,
                  )),
                );
          },
          saveSchedule: (evt) async {
            emit(state.copyWith(status: BlocStatus.loading));
            // sends the form to the repo
            await scheduleRepo.saveMySchedule(evt.ctx, state.scheduleForm);

            // updates the schedule in the state
            emit(state.copyWith(
                schedule: state.scheduleForm, status: BlocStatus.loaded));
          },
          saveScheduleDay: (evt) {
            // only updates the schedule form
            emit(state.copyWith(
                scheduleForm:
                    state.scheduleForm.copyWithScheduleDay(evt.scheduleDay)));
          },
          loading: (evt) {},
          loaded: (evt) {},
          saved: (evt) {},
        );
      },
    );
  }
}
