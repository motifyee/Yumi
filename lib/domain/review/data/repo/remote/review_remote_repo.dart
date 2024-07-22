import 'package:common_code/common_code.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/domain/entities/paginatedData.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:yumi/domain/review/data/repo/review_repo.dart';
import 'package:yumi/domain/review/data/source/review_source.dart';
import 'package:yumi/domain/review/entity/review.dart';

class ReviewRemoteRepo extends ReviewRepo {
  final ReviewSource reviewSource;

  ReviewRemoteRepo({ReviewSource? reviewSource}) : reviewSource = reviewSource ?? getIt<ReviewSource>();

  @override
  TaskEither<Failure, PaginatedData<Review>> getAllReviews({required String chefId, required PaginatedData<Review> paginatedData, bool loginCustomer = false, Map<String, dynamic>? queryParameters}) {
    return TaskEither.tryCatch(() => reviewSource.getAllReviews(chefId: chefId, paginatedData: paginatedData, loginCustomer: loginCustomer, queryParameters: queryParameters), (error, stackTrace) => ServerFailure((error as CException).error));
  }

  @override
  TaskEither<Failure, bool> updateRate({required Review review, String? chefId, String? driverId, Map<String, dynamic>? queryParameters}) {
    return TaskEither.tryCatch(() => reviewSource.updateRate(review: review, queryParameters: queryParameters, chefId: chefId, driverId: driverId), (error, stackTrace) => ServerFailure((error as CException).error));
  }
}
