import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:common_code/common_code.dart';

class AddressService {
  static Future<dynamic> getAddresses(
      {required BuildContext context,
      required Map<String, dynamic> pagination,
      Map<String, dynamic>? queryParameters}) async {
    final Response res = await APIClient().get(EndPoints.address,
        queryParameters: {...pagination, ...?queryParameters});
    return res;
  }

  static Future<dynamic> updateAddresses({
    required BuildContext context,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await APIClient().put(EndPoints.address,
        data: address.toJson(),
        queryParameters: {'addressid': address.id, ...?queryParameters});
    return res;
  }

  static Future<dynamic> deleteAddresses({
    required BuildContext context,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response res = await APIClient().delete(EndPoints.address,
        queryParameters: {'addressid': address.id, ...?queryParameters});
    return res;
  }
}
