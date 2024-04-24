import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yumi/model/invoice_model.dart';
import 'package:yumi/model/invoice_transaction_model/invoice_transaction_model.dart';
import 'package:yumi/statics/api_statics.dart';

class OrderService {
  static Future<dynamic> createOrderOrPreOrderDelivery({
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

  static Future<dynamic> createOrderOrPreOrderPickUp({
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

  static Future<Response> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio()
        .get('$apiKeys$id', queryParameters: {...?paginationHelper});
    return res;
  }

  static Future<Response> putActionOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio().put(apiKeys,
        data: {'driver_ID': null}, queryParameters: {...?paginationHelper});
    return res;
  }

  static Future<Response> closeInvoice(
      {required InvoiceModel invoice,
      required InvoiceTransactionModel invoiceTransaction,
      Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio().post(ApiKeys.order,
        data: invoiceTransaction.toJson(),
        queryParameters: {...?paginationHelper, 'orderId': invoice.id}
          ..removeWhere((key, value) => value == null));
    return res;
  }

  static Future<Response> deleteInvoice(
      {required InvoiceModel invoice,
      Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio().delete(ApiKeys.order,
        queryParameters: {...?paginationHelper, 'orderId': invoice.id}
          ..removeWhere((key, value) => value == null));
    return res;
  }
}
