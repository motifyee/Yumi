import 'package:common_code/common_code.dart';

abstract class ReviewSource {
  Future<PaginatedData<Review>> getAllReviews({
    required String chefId,
    required PaginatedData<Review> paginatedData,
    bool loginCustomer = false,
    Map<String, dynamic>? queryParameters,
  });

  Future<bool> updateRate({
    required Review review,
    String? chefId,
    String? driverId,
    Map<String, dynamic>? queryParameters,
  });
}
