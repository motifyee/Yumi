part of 'chef_cubit.dart';

@freezed
class ChefsState with _$ChefsState {
  factory ChefsState({
    @Default(Pagination<Chef>()) Pagination<Chef> chefsPage,
    @Default(0) int chefsUpdated,
  }) = _ChefsState;
}
