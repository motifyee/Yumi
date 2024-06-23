part of 'calories_cubit.dart';

@freezed
class CaloriesState with _$CaloriesState {
  const factory CaloriesState({
    required Pagination<Calories> pagination,
  }) = _CaloriesState;

  factory CaloriesState.initail() {
    return CaloriesState(
      pagination: const Pagination<Calories>(data: <Calories>[]),
    );
  }

  factory CaloriesState.fromJson(Map<String, dynamic> json) =>
      _$CaloriesStateFromJson(json);
}
