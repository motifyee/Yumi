import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';

class ChefService {
  static Future<dynamic> getChefs(
      {required BuildContext context,
      Map<String, dynamic>? queryParameters}) async {
    final Response res = await DioClient.simpleDio(context).get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.chefs),
        queryParameters: queryParameters);

    return res;
  }
}
