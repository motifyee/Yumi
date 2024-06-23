import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/order/entity/invoice_transaction_model.dart';
import 'package:yumi/statics/api_statics.dart';

class OrderService {
  static Future<dynamic> createOrderOrPreOrderDelivery({
    required BuildContext context,
    required Basket invoice,
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
    required Basket invoice,
    required bool isPreOrder,
  }) async {
    var res = await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(
            apiKey: isPreOrder ? ApiKeys.preOrderPickUp : ApiKeys.orderPickUp),
        data: invoice.toJson());
    return res;
  }

  static Future<Response> getOrderOrPreOrder({
    required String apiKeys,
    Map<String, dynamic>? pager,
  }) async {
    Response res =
        await DioClient.simpleDio().get(apiKeys, queryParameters: {...?pager});

    return res;
  }

  static Future<Response> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? pager}) async {
    Response res = await DioClient.simpleDio()
        .get('$apiKeys$id', queryParameters: {...?pager});
    return res;
  }

  static Future<Response> putActionOrderOrPreOrder(
      {required String apiKeys,
      int? orderId,
      bool isFakeBody = true,
      Map<String, dynamic>? pager}) async {
    Response res = await DioClient.simpleDio().put(apiKeys,
        data: isFakeBody ? {'driver_ID': null} : null,
        queryParameters: {...?pager, 'orderId': orderId}
          ..removeWhere((key, value) => value == null));

    return res;
  }

  static Future<Response> getBaskets({Map<String, dynamic>? pager}) async {
    debugger();
    Response res = await DioClient.simpleDio().get(ApiKeys.order,
        queryParameters: {...?pager}
          ..removeWhere((key, value) => value == null));
    return res;
  }

  static Future<Response> closeInvoice(
      {required Basket basket,
      required InvoiceTransactionModel invoiceTransaction,
      Map<String, dynamic>? pager}) async {
    Response res = await DioClient.simpleDio().post(ApiKeys.order,
        data: invoiceTransaction.toJson(),
        queryParameters: {...?pager, 'orderId': basket.id}
          ..removeWhere((key, value) => value == null));
    return res;
  }

  static Future<Response> updateInvoice({required Basket basket}) async {
    Response res = await DioClient.simpleDio().put(
      ApiKeys.order,
      data: basket.toJson(),
      queryParameters: {'orderId': basket.id},
    );
    return res;
  }

  static Future<Response> deleteInvoice(
      {required Basket invoice, Map<String, dynamic>? pager}) async {
    Response res = await DioClient.simpleDio().delete(ApiKeys.order,
        queryParameters: {...?pager, 'orderId': invoice.id}
          ..removeWhere((key, value) => value == null));
    return res;
  }
}
