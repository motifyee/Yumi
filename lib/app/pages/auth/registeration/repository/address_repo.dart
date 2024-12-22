import 'dart:async';

import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:yumi/util/random_string.dart';

class AddressRepo {
  static Future<List<Address>?> getAddresses({
    required BuildContext context,
  }) async {
    try {
      final result = await APIClient().get('/accounts/address');

      return (result.data as List).map((e) => Address.fromJson(e)).toList();
    } catch (e) {
      return null;
    }
  }

  // !TODO! should return id of newly created object
  static Future<String?> addAddress({
    required Address address,
  }) async {
    final data = address.toJson();

    data['code'] = getRandomString(15);
    data.remove('id');

    String? res;
    await APIClient()
        .post<String?>('/accounts/address', data: data)
        .then((_) {})
        .catchError((err) {
      res = (err.response as Response).data['message'];
    });

    return res;
  }

  static Future<bool> updateAddress({
    required Address address,
    required BuildContext context,
  }) async {
    try {
      await APIClient().put(
        '/accounts/address',
        queryParameters: {'addressId': 'address.id'},
        data: address.toJson(),
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteAddress({
    required String addressId,
    required BuildContext context,
  }) async {
    try {
      await APIClient().delete(
        '/accounts/address',
        queryParameters: {'addressId': addressId},
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
