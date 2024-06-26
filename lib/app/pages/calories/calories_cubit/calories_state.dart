part of 'calories_cubit.dart';

@freezed
class CaloriesState with _$CaloriesState {
  const factory CaloriesState({
    required PaginatedData<Calories> pagination,
  }) = _CaloriesState;

  factory CaloriesState.initail() {
    return CaloriesState(
      pagination: const PaginatedData<Calories>(data: <Calories>[]),
    );
  }

  factory CaloriesState.fromJson(Map<String, dynamic> json) =>
      _$CaloriesStateFromJson(json);
}
