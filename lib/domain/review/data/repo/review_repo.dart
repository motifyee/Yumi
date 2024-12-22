import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';

abstract class ReviewRepo {
  TaskEither<Failure, PaginatedData<Review>> getAllReviews({
    required String chefId,
    required PaginatedData<Review> paginatedData,
    bool loginCustomer = false,
    Map<String, dynamic>? queryParameters,
  });

  TaskEither<Failure, bool> updateRate({
    required Review review,
    String? chefId,
    String? driverId,
    Map<String, dynamic>? queryParameters,
  });
}
