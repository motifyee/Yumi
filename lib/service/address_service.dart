import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/domain/address/entity/address.dart';
import 'package:yumi/statics/api_statics.dart';

class AddressService {
  static Future<dynamic> getAddresses({required BuildContext context, required Map<String, dynamic> pagination, Map<String, dynamic>? queryParameters}) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.address, queryParameters: {...pagination, ...?queryParameters});
    return res;
  }

  static Future<dynamic> updateAddresses({
    required BuildContext context,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().put(ApiKeys.address, data: address.toJson(), queryParameters: {'addressid': address.id, ...?queryParameters});
    return res;
  }

  static Future<dynamic> deleteAddresses({
    required BuildContext context,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await DioClient.simpleDio().delete(ApiKeys.address, queryParameters: {'addressid': address.id, ...?queryParameters});
    return res;
  }
}
