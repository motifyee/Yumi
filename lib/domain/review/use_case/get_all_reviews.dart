import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/review/data/repo/review_repo.dart';

class GetAllReviews
    extends UseCase<PaginatedData<Review>, GetAllReviewsParams> {
  final ReviewRepo reviewRepo;

  GetAllReviews({ReviewRepo? reviewRepo})
      : reviewRepo = reviewRepo ?? getIt<ReviewRepo>();

  @override
  Future<Either<Failure, PaginatedData<Review>>> call(
    GetAllReviewsParams params,
  ) async {
    return reviewRepo
        .getAllReviews(
          chefId: params.chefId,
          paginatedData: params.paginatedData,
          queryParameters: params.queryParameters,
          loginCustomer: params.loginCustomer,
        )
        .run();
  }
}

class GetAllReviewsParams extends Params {
  final String chefId;
  final PaginatedData<Review> paginatedData;
  final bool loginCustomer;
  final Map<String, dynamic>? queryParameters;

  GetAllReviewsParams({
    required this.chefId,
    required this.paginatedData,
    required this.loginCustomer,
    required this.queryParameters,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [chefId, paginatedData, loginCustomer, queryParameters];
}
