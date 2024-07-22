import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/review/data/repo/review_repo.dart';
import 'package:yumi/domain/review/entity/review.dart';

class UpdateReview extends UseCase<bool, UpdateReviewParams> {
  final ReviewRepo reviewRepo;

  UpdateReview({ReviewRepo? reviewRepo}) : reviewRepo = reviewRepo ?? getIt<ReviewRepo>();

  @override
  Future<Either<Failure, bool>> call(UpdateReviewParams params) {
    return reviewRepo.updateRate(review: params.review, queryParameters: params.queryParameters, driverId: params.driverId, chefId: params.chefId).run();
  }
}

class UpdateReviewParams extends Params {
  final Review review;
  final String? chefId;
  final String? driverId;
  final Map<String, dynamic>? queryParameters;

  UpdateReviewParams({required this.review, required this.chefId, required this.driverId, required this.queryParameters});

  @override
  List<Object?> get props => [];
}
