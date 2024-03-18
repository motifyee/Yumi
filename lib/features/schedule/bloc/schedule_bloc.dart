import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/features/schedule/model/model.dart';
import 'package:yumi/features/schedule/repository/interface.dart';

part 'schedule_bloc.freezed.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final IScheduleRepo scheduleRepo;

  ScheduleBloc({required this.scheduleRepo}) : super(const ScheduleState()) {
    on<ScheduleEvent>(
      (events, emit) async {
        await events.map(
          init: (value) async {
            emit(state.copyWith(status: BlocStatus.loading));

            await scheduleRepo.getSchedule().then(
                  (value) => emit(state.copyWith(
                      schedule: value, status: BlocStatus.loaded)),
                );
          },
          setDay: (evt) {
            emit(state.copyWith(
                schedule: state.schedule.copyWithScheduleDay(evt.scheduleDay)));
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
