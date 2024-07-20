import 'package:dio/dio.dart';
import 'package:common_code/domain/profile/entities/review_model.dart';
import 'package:common_code/common_code.dart';

class ReviewService {
  static Future<dynamic> getAllReviews({
    required String chefId,
    bool loginCustomer = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await APIClient().get(EndPoints.review,
        queryParameters: {
          ...?queryParameters,
          'chefId': chefId,
          'loginCustomer': loginCustomer,
        }..removeWhere((key, value) => value == null));
    return res;
  }

  static Future<dynamic> updateRate({
    required ReviewModel review,
    String? chefId,
    String? driverId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await APIClient().put(EndPoints.review,
        data: review.toJson()
          ..removeWhere((key, value) => key == 'buddiesUserId'),
        queryParameters: {
          ...?queryParameters,
          'chefId': chefId,
          'driverId': driverId
        }..removeWhere((key, value) => value == null));
    return res;
  }
}
