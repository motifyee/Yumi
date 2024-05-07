part of 'calories_cubit.dart';

@freezed
class CaloriesState with _$CaloriesState {
  const factory CaloriesState({
    required PaginationHelper<Calories> paginationHelper,
  }) = _CaloriesState;

  factory CaloriesState.initail() {
    return CaloriesState(
      paginationHelper: const PaginationHelper<Calories>(data: []),
    );
  }

  factory CaloriesState.fromJson(Map<String, dynamic> json) =>
      _$CaloriesStateFromJson(json);
}
