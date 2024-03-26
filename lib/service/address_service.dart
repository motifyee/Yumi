import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/features/registeration/model/address.dart';
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
    bool isDelete = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio(context).put(ApiKeys.address,
        data: isDelete ? null : address.toJson(),
        queryParameters: {'addressid': address.id, ...?queryParameters});
    return res;
  }
}
