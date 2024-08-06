import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/util/global_context.dart';
import 'package:meta/meta.dart';
import 'package:yumi/domain/review/use_case/get_all_reviews.dart';
import 'package:yumi/domain/review/use_case/update_review.dart';
import 'package:yumi/generated/l10n.dart';

part 'review_cubit.freezed.dart';
part 'review_cubit.g.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState({
    required PaginatedData<Review> pagination,
  }) = _ReviewState;

  factory ReviewState.initial() {
    return ReviewState(pagination: const PaginatedData<Review>(data: []));
  }

  factory ReviewState.fromJson(Map<String, dynamic> json) =>
      _$ReviewStateFromJson(json);
}

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewState.initial());

  resetReviews() {
    emit(ReviewState.initial());
  }

  getReviews({required String chefID, bool isMyReviews = false}) async {
    if (!state.pagination.canRequest) return;
    emit(state.copyWith.pagination(isLoading: true));
    final task = await GetAllReviews().call(GetAllReviewsParams(
        chefId: chefID,
        paginatedData: state.pagination,
        loginCustomer: isMyReviews,
        queryParameters: const {}));
    task.fold((l) => GlobalContext().snackBar(l.error ?? S.current.apiError),
        (r) => emit(state.copyWith(pagination: r)));
  }

  Future<bool> updateReviews(
      {required Review review,
      String? chefId,
      String? driverId,
      Map<String, dynamic>? queryParameters}) async {
    final task = await UpdateReview().call(UpdateReviewParams(
        review: review,
        chefId: chefId,
        driverId: driverId,
        queryParameters: queryParameters));

    return task.fold((l) => false, (r) => true);
  }
}
