import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/schedule/data/repos/schedule_repo.dart';
import 'package:yumi/domain/schedule/entities/schedule.dart';
import 'package:yumi/domain/schedule/use_cases/apply_day_to_all.dart';
import 'package:yumi/domain/schedule/use_cases/load_schedule.dart';
import 'package:yumi/domain/schedule/use_cases/save_schedule.dart';

part 'schedule_cubit.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default(Schedule()) Schedule schedule,
    @Default(Schedule()) Schedule scheduleForm,
    @Default(Status.init) Status status,
  }) = Initial;

  const ScheduleState._();

  bool get changed => schedule != scheduleForm;
}

// -----------------------------------------------------------------------------

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleRepo repo;

  ScheduleCubit({ScheduleRepo? repo})
      : repo = repo ?? getIt<ScheduleRepo>(),
        super(const ScheduleState());

  void loadSchedule() async {
    emit(state.copyWith(status: Status.loading));

    final task = await LoadSchedule(repo).call(NoParams());

    task.fold(
      (l) => emit(state.copyWith(status: Status.error)),
      (r) => emit(
        state.copyWith(
          schedule: r,
          scheduleForm: r,
          status: Status.idle,
        ),
      ),
    );
  }

  void updateSchedule() async {
    emit(state.copyWith(status: Status.loading));

    final task =
        await SaveSchedule(repo).call(ScheduleParam(state.scheduleForm));

    task.fold(
      (l) => emit(state.copyWith(status: Status.error)),
      (r) => emit(
        state.copyWith(
          schedule: state.scheduleForm,
          status: Status.idle,
        ),
      ),
    );
  }

  void applyDayToAll(ScheduleDay scheduleDay) async {
    final apply = await ApplyDayToAll().call(ApplyDayToAllParams(
      scheduleDay,
      state.scheduleForm,
    ));

    apply.fold(
      (l) => emit(state.copyWith(status: Status.error)),
      (r) => emit(state.copyWith(scheduleForm: r, status: Status.success)),
    );
  }

  void saveScheduleDay(ScheduleDay scheduleDay) {
    // should be a use case
    emit(state.copyWith(
        scheduleForm: state.scheduleForm.copyWithScheduleDay(scheduleDay)));
  }

  void reset() {
    emit(const ScheduleState());
  }
}
