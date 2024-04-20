import 'package:dio/dio.dart';
import 'package:yumi/model/review_model/review_model.dart';
import 'package:yumi/statics/api_statics.dart';

class ReviewService {
  static Future<dynamic> getAllReviews({
    required String chefId,
    bool customerLogin = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.review,
        queryParameters: {
          ...?queryParameters,
          'chefId': chefId,
          'customerLogin': customerLogin,
        }..removeWhere((key, value) => value == null));
    return res;
  }

  static Future<dynamic> updateRate({
    required ReviewModel review,
    String? chefId,
    String? driverId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().put(ApiKeys.review,
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
