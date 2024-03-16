part of 'schedule_bloc.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.init() = _init;
  const factory ScheduleEvent.loading() = _loading;
  const factory ScheduleEvent.loaded() = _loaded;
  const factory ScheduleEvent.setDay(ScheduleDay scheduleDay) = _setDay;
  const factory ScheduleEvent.saved() = _saved;
}
