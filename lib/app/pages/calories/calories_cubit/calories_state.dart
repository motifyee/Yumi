part of 'calories_cubit.dart';

@freezed
class CaloriesState with _$CaloriesState {
  factory CaloriesState({
    @Default(PaginatedData()) PaginatedData<Calorie> calories,
  }) = _CaloriesState;

  factory CaloriesState.fromJson(Map<String, dynamic> json) =>
      _$CaloriesStateFromJson(json);
}
