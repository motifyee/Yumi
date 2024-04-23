import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/app/pages/auth/register/model/address.dart';
import 'package:yumi/statics/api_statics.dart';

class AddressService {
  static Future<dynamic> getAddresses(
      {required BuildContext context,
      required Map<String, dynamic> pagination,
      Map<String, dynamic>? queryParameters}) async {
    final Response res = await DioClient.simpleDio(context).get(ApiKeys.address,
        queryParameters: {...pagination, ...?queryParameters});
    return res.data;
  }

  static Future<dynamic> updateAddresses({
    required BuildContext context,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio(context).put(ApiKeys.address,
        data: address.toJson(),
        queryParameters: {'addressid': address.id, ...?queryParameters});
    return res;
  }

  static Future<dynamic> deleteAddresses({
    required BuildContext context,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio(context).delete(
        ApiKeys.address,
        queryParameters: {'addressid': address.id, ...?queryParameters});
    return res;
  }
}
