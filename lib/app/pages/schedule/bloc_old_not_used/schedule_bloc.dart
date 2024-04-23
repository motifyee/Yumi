import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/app/pages/schedule/model/model.dart';
import 'package:yumi/app/pages/schedule/repository/interface.dart';
import 'package:yumi/global.dart';

part 'schedule_bloc.freezed.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final IScheduleRepo scheduleRepo;

  ScheduleBloc({required this.scheduleRepo}) : super(const ScheduleState()) {
    on<ScheduleEvent>(
      (events, emit) async {
        await events.map<FutureOr<void>>(
          init: (value) async {
            emit(state.copyWith(status: ObseleteStatusEnum.loading));

            await scheduleRepo.getMySchedule(G.cContext).then((value) {
              emit(
                state.copyWith(
                  schedule: value,
                  scheduleForm: value,
                  status: ObseleteStatusEnum.idle,
                ),
              );
            }).catchError(
              (err) {
                emit(state.copyWith(status: ObseleteStatusEnum.error));
              },
            );
          },
          saveSchedule: (evt) async {
            emit(state.copyWith(status: ObseleteStatusEnum.loading));
            // sends the form to the repo
            await scheduleRepo
                .saveMySchedule(G.cContext, state.scheduleForm)
                .then((val) => emit(state.copyWith(
                    schedule: state.scheduleForm,
                    status: ObseleteStatusEnum.idle)))
                .catchError((err) =>
                    emit(state.copyWith(status: ObseleteStatusEnum.error)));

            // updates the schedule in the state
          },
          saveScheduleDay: (evt) {
            // only updates the schedule form
            emit(state.copyWith(
                scheduleForm:
                    state.scheduleForm.copyWithScheduleDay(evt.scheduleDay)));
          },
          loading: (evt) => {_onInit(evt, emit)},
          loaded: (evt) {},
          saved: (evt) {},
        );
      },
    );
  }

  _onInit(evt, emit) {}
}