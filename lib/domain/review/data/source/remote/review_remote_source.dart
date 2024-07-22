import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:yumi/domain/review/data/source/review_source.dart';
import 'package:yumi/domain/review/entity/review.dart';

class ReviewRemoteSource extends ReviewSource {
  @override
  Future<PaginatedData<Review>> getAllReviews({required String chefId, required PaginatedData<Review> paginatedData, bool loginCustomer = false, Map<String, dynamic>? queryParameters}) async {
    late Response res;
    try {
      res = await APIClient().get(EndPoints.review,
          queryParameters: {
            ...?queryParameters,
            ...paginatedData.toJson(),
            'chefId': chefId,
            'loginCustomer': loginCustomer,
          }..removeWhere((key, value) => value == null));
    } catch (error) {
      ServerException(error as DioException);
    }

    List<Review> data = res.data['data'].map<Review>((e) => Review.fromJson(e)).toList();
    return paginatedData.copyWith(data: data, pageNumber: res.data['pagination']['page'], lastPage: res.data['pagination']['pages'], total: res.data['pagination']['total'], isLoading: false) as PaginatedData<Review>;
  }

  @override
  Future<bool> updateRate({required Review review, String? chefId, String? driverId, Map<String, dynamic>? queryParameters}) async {
    late Response res;
    try {
      res =
          await APIClient().put(EndPoints.review, data: review.toJson()..removeWhere((key, value) => key == 'buddiesUserId'), queryParameters: {...?queryParameters, 'chefId': chefId, 'driverId': driverId}..removeWhere((key, value) => value == null));
    } catch (error) {
      ServerException(error as DioException);
    }

    return res.statusCode == 200;
  }
}
