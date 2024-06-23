part of 'reviews_bloc.dart';

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState({
    @Default([]) List<ReviewModel> reviews,
    @Default(Pager(
      pageSize: 20,
      pageNumber: 0,
      lastPage: 1,
      isLoading: false,
    ))
    Pager pager,
  }) = _ReviewsState;
}
