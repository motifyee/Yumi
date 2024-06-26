part of 'chef_cubit.dart';

@freezed
class ChefsState with _$ChefsState {
  factory ChefsState({
    @Default([]) List<Chef> chefs,
    @Default(Pagination()) Pagination chefsPagination,
    @Default('') String error,
    @Default(false) bool errorReported,
    @Default(0) int chefsUpdated,
  }) = _ChefsState;

  ChefsState._();

  String? get errorText => error.isNotEmpty && !errorReported ? error : null;
}
