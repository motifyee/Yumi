part of 'calories_cubit.dart';

@freezed
class CaloriesState with _$CaloriesState {
  const factory CaloriesState({
    required Pager<Calories> pager,
  }) = _CaloriesState;

  factory CaloriesState.initail() {
    return const CaloriesState(
      pager: Pager<Calories>(data: <Calories>[]),
    );
  }

  factory CaloriesState.fromJson(Map<String, dynamic> json) =>
      _$CaloriesStateFromJson(json);
}
