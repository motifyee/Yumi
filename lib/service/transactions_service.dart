import 'package:dio/dio.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/statics/api_statics.dart';

class TransactionsService {
  static Future<dynamic> getAllTransactions({
    required String userId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.transactions,
        queryParameters: {
          ...?queryParameters,
          'chefId': AppTarget.user == AppTargetUser.chefs ? userId : null,
          'driverId': AppTarget.user == AppTargetUser.drivers ? userId : null,
          'customerId':
              AppTarget.user == AppTargetUser.customers ? userId : null,
          'dateFrom': '2000-01-01T00:00:00.000',
          'dateTo': DateTime.now().toIso8601String(),
        }..removeWhere((key, value) => value == null));
    return res;
  }
}
