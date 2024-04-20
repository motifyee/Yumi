part of 'reviews_bloc.dart';

@freezed
class ReviewsEvent with _$ReviewsEvent {
  const factory ReviewsEvent.getAll(
      {required String chefID,
      @Default(false) bool isMyReviews}) = _getAllEvent;
  const factory ReviewsEvent.updateReviews(
      {required ReviewsState reviewsState}) = _updateReviewsEvent;
  const factory ReviewsEvent.resetReviews() = _resetReviewsEvent;
}
