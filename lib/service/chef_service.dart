import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';

class ChefService {
  static Future<dynamic> getChefs({
    required BuildContext context,
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio(context).get(
        ApiKeys.getApiKeyString(
            apiKey: isPreOrder ? ApiKeys.chefsPreOrder : ApiKeys.chefsOrder),
        queryParameters: {
          ...?queryParameters,
          'latitude': latitude,
          'longitude': longitude
        });

    return res;
  }
}
