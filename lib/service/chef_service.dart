import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';

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

  static Future<dynamic> getFavoriteChefs({
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio()
        .get(ApiKeys.favoriteChefs, queryParameters: {...?queryParameters});

    return res;
  }

  static Future<dynamic> getIsChefFavorite({
    required String chefId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.favoriteChef,
        queryParameters: {...?queryParameters, 'chefId': chefId});

    return res;
  }

  static Future<dynamic> getChefStatus({
    required String accountId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.chefStatus,
        queryParameters: {...?queryParameters, 'accountId': accountId});

    return res;
  }

  static Future<dynamic> addFavoriteChef({
    required String chefId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().post(ApiKeys.favoriteChefs,
        data: {'code': CodeGenerator.getRandomCode(codeLength: 15)},
        queryParameters: {...?queryParameters, 'chefId': chefId});

    return res;
  }

  static Future<dynamic> removeFavoriteChef({
    required String chefId,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().delete(
        ApiKeys.favoriteChefs,
        queryParameters: {...?queryParameters, 'chefId': chefId});

    return res;
  }
}
