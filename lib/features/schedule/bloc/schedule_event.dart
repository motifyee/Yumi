part of 'schedule_bloc.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.init(BuildContext ctx) = _init;
  const factory ScheduleEvent.loading() = _loading;
  const factory ScheduleEvent.loaded() = _loaded;
  const factory ScheduleEvent.saveScheduleDay(
      BuildContext ctx, ScheduleDay scheduleDay) = _saveScheduleDay;
  const factory ScheduleEvent.saveSchedule(BuildContext ctx) = _saveSchedule;
  const factory ScheduleEvent.saved() = _saved;
}
