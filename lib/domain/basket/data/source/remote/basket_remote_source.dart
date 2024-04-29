import 'package:dio/dio.dart';
import 'package:yumi/domain/basket/data/source/basket_source.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/model/invoice_transaction_model/invoice_transaction_model.dart';
import 'package:yumi/statics/api_statics.dart';

class BasketRemoteSource implements BasketSource {
  @override
  Future<Basket> createOrderOrPreOrderDelivery({
    required Basket basket,
    required bool isPreOrder,
  }) async {
    var res = await DioClient.simpleDio().post(
        ApiKeys.getApiKeyString(
            apiKey:
                isPreOrder ? ApiKeys.preOrderDelivery : ApiKeys.orderDelivery),
        data: basket.toJson());
    return basket.copyWith(id: res.data['invoiceId']);
  }

  @override
  Future<Basket> createOrderOrPreOrderPickUp({
    required Basket basket,
    required bool isPreOrder,
  }) async {
    var res = await DioClient.simpleDio().post(
        ApiKeys.getApiKeyString(
            apiKey: isPreOrder ? ApiKeys.preOrderPickUp : ApiKeys.orderPickUp),
        data: basket.toJson());
    return basket.copyWith(id: res.data['invoiceId']);
  }

  @override
  Future<Response> getOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio()
        .get(apiKeys, queryParameters: {...?paginationHelper});
    return res;
  }

  @override
  Future<Response> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio()
        .get('$apiKeys$id', queryParameters: {...?paginationHelper});
    return res;
  }

  @override
  Future<Response> putActionOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio().put(apiKeys,
        data: {'driver_ID': null}, queryParameters: {...?paginationHelper});
    return res;
  }

  @override
  Future<Basket?> getBaskets({Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio().get(ApiKeys.order,
        queryParameters: {...?paginationHelper}
          ..removeWhere((key, value) => value == null));
    if (res.data['data'].isEmpty) return null;
    return Basket.fromJson(res.data['data'][0]);
  }

  @override
  Future<Response> closeBasket(
      {required Basket basket,
      required InvoiceTransactionModel invoiceTransaction,
      Map<String, dynamic>? paginationHelper}) async {
    Response res = await DioClient.simpleDio().post(ApiKeys.order,
        data: invoiceTransaction.toJson(),
        queryParameters: {...?paginationHelper, 'orderId': basket.id}
          ..removeWhere((key, value) => value == null));

    return res;
  }

  @override
  Future<Basket> updateBasket({required Basket basket}) async {
    Response res = await DioClient.simpleDio().put(
      ApiKeys.order,
      data: basket.toJson(),
      queryParameters: {'orderId': basket.id},
    );
    return basket;
  }

  @override
  Future<Response> deleteBasket({required Basket basket}) async {
    Response res = await DioClient.simpleDio().delete(
      ApiKeys.order,
      queryParameters: {'orderId': basket.id},
    );

    return res;
  }
}
