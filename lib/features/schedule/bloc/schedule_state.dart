part of 'schedule_bloc.dart';

// class ScheduleState extends Equatable {
//   final Schedule? schedule;

//   const ScheduleState({this.schedule});

//   @override
//   List<Object?> get props => throw UnimplementedError();
// }

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default(Schedule()) Schedule schedule,
    @Default(Schedule()) Schedule scheduleForm,
    @Default(BlocStatus.init) BlocStatus status,
  }) = Initial;

  const ScheduleState._();

  bool get changed => schedule != scheduleForm;
}
