import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/domain/profile/entities/review.dart';
import 'package:yumi/statics/api_statics.dart';

class xProfileSrc {
  static Future<dynamic> getProfile(String id) async {
    final res = await DioClient.dio
        .get('${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}/$id')
        .then((value) => value.data)
        .catchError((_) => false);
    return res;
  }

  static Future<dynamic> updateProfile(Map<String, dynamic> data) async {
    try {
      final res = await DioClient.dio.put(
          '${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}?id=${data['guid']}',
          data: data);
      return res.data;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<dynamic> deleteAccount() async {
    try {
      final res = await DioClient.dio.delete(
        '/accounts?isDelete=true',
        // '/${ApiKeys.getApiKeyString(apiKey: ApiKeys.profile)}?isDelete=true',
      );
      return res.data;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<List<Review>> getReviews() async {
    final Response res;

    try {
      res = await DioClient.dio.get(
        '/accounts/review',
      );
    } catch (e) {
      return [];
    }

    if (res.data?['data'] == null) return [];

    final List<Review> reviews =
        res.data['data'].map<Review>((e) => Review.fromJson(e)).toList();

    return reviews;
  }
}
