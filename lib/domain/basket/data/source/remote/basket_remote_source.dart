import 'package:dio/dio.dart';
import 'package:yumi/domain/basket/data/source/basket_source.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/basket/entity/voucher.dart';
import 'package:common_code/common_code.dart';

class BasketRemoteSource implements BasketSource {
  @override
  Future<Basket> createOrderOrPreOrderDelivery({
    required Basket basket,
    required bool isPreOrder,
  }) async {
    var res = await APIClient().post(
        isPreOrder ? Endpoints().preOrderDelivery : Endpoints().orderDelivery,
        data: basket.toJson());
    return basket.copyWith(
        id: res.data['invoiceId'],
        invoice: basket.invoice.copyWith(createdDate: res.data['createdDate']));
  }

  @override
  Future<Basket> createOrderOrPreOrderPickUp({
    required Basket basket,
    required bool isPreOrder,
  }) async {
    var res = await APIClient().post(
        isPreOrder ? Endpoints().preOrderPickUp : Endpoints().orderPickUp,
        data: basket.toJson());
    return basket.copyWith(
        id: res.data['invoiceId'],
        invoice: basket.invoice.copyWith(createdDate: res.data['createdDate']));
  }

  @override
  Future<Response> getOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? pagination}) async {
    Response res =
        await APIClient().get(apiKeys, queryParameters: {...?pagination});
    return res;
  }

  @override
  Future<Response> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? pagination}) async {
    Response res =
        await APIClient().get('$apiKeys$id', queryParameters: {...?pagination});
    return res;
  }

  @override
  Future<Response> putActionOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? pagination}) async {
    Response res = await APIClient().put(apiKeys,
        data: {'driver_ID': null}, queryParameters: {...?pagination});
    return res;
  }

  @override
  Future<Basket?> getBaskets({Map<String, dynamic>? pagination}) async {
    Response res = await APIClient().get(Endpoints().order,
        queryParameters: {...?pagination}
          ..removeWhere((key, value) => value == null));

    if (res.data['data'].isEmpty) return null;

    List<dynamic> invoiceDetails =
        res.data['data'][0]['invoiceDetails'].map((e) {
      return <String, dynamic>{
        ...e,
        'meal': {
          'name': e['product']['productName'],
          'photo': e['image'],
          'price1': e['productVarintPrice'],
          'productVariantID': e['productVariantID'],
          'ingredients': e['product']['ingredients'],
        }
      };
    }).toList();

    return Basket.fromJson({
      ...res.data['data'][0],
      'invoice': res.data['data'][0],
      'invoiceDetails': invoiceDetails,
    });
  }

  @override
  Future<Response> closeBasket(
      {required Basket basket, Map<String, dynamic>? pagination}) async {
    Response res = await APIClient().post(Endpoints().order,
        queryParameters: {...?pagination, 'orderId': basket.id}
          ..removeWhere((key, value) => value == null));

    return res;
  }

  @override
  Future<Basket> updateBasket({required Basket basket}) async {
    Response res = await APIClient().put(
      Endpoints().order,
      data: basket.toJson(),
      queryParameters: {'orderId': basket.id, 'voucherId': basket.voucherId}
        ..removeWhere((key, value) => value == null),
    );
    return basket;
  }

  @override
  Future<Response> deleteBasket({required Basket basket}) async {
    Response res = await APIClient().delete(
      Endpoints().order,
      queryParameters: {'orderId': basket.id},
    );

    return res;
  }

  @override
  Future<Basket> checkVoucherBasket(
      {required Basket basket, required String voucher}) async {
    Response res = await APIClient().get('${Endpoints().voucher}/$voucher');
    if (res.statusCode == 200) {
      Voucher voucher = Voucher.fromJson({...res.data, ...res.data['voucher']});
      return basket.copyWith(
          voucherId: voucher.id,
          invoice: basket.invoice.copyWith(invoiceDiscount: voucher.amount));
    }
    return basket;
  }
}
