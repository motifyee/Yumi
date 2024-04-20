part of 'reviews_bloc.dart';

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState({
    required List<ReviewModel> reviews,
    required PaginationHelper paginationHelper,
  }) = _ReviewsState;

  factory ReviewsState.initial() {
    return ReviewsState(
        reviews: [],
        paginationHelper: PaginationHelper(
          pageSize: 20,
          pageNumber: 0,
          lastPage: 1,
          isLoading: false,
        ));
  }
}
