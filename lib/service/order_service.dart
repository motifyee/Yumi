import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/model/invoice_model.dart';
import 'package:yumi/statics/api_statics.dart';

class OrderService {
  static Future<dynamic> createPreOrderDelivery({
    required BuildContext context,
    required InvoiceModel invoice,
    required bool isPreOrder,
  }) async {
    var res = await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(
            apiKey:
                isPreOrder ? ApiKeys.preOrderDelivery : ApiKeys.orderDelivery),
        data: invoice.toJson());
    return res;
  }

  static Future<dynamic> createPreOrderPickUp({
    required BuildContext context,
    required InvoiceModel invoice,
    required bool isPreOrder,
  }) async {
    var res = await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(
            apiKey: isPreOrder ? ApiKeys.preOrderPickUp : ApiKeys.orderPickUp),
        data: invoice.toJson());
    return res;
  }

  static Future<Response> getOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio()
        .get(apiKeys, queryParameters: {...?paginationHelper});
    return res;
  }
}
