import 'dart:async';

import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:common_code/domain/food_delivery/order/data/source/order_source.dart';
import 'package:common_code/domain/food_delivery/order/entity/order.dart';

class OrderSourceRemote extends OrderSource {
  @override
  Future<PaginatedData<Order>> getOrders({
    required String apiKeys,
    required PaginatedData<Order> ordersPage,
  }) async {
    Response res;

    try {
      res = await APIClient().get(
        apiKeys,
        queryParameters: {...ordersPage.toJson()},
      );
    } catch (e) {
      throw ServerException((e as DioException));
    }
    try {
      List<Order> data =
          res.data['data'].map<Order>((e) => Order.fromJson(e)).toList();

      return ordersPage.copyWith(
        data: <Order>[...ordersPage.data, ...data].unique((e) => e.id),
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages'],
      ) as PaginatedData<Order>;
    } catch (e) {
      throw GenericException(e.toString());
    }
  }

  @override
  Future<bool> putOrders({
    required String apiKeys,
    int? orderId,
    bool isFakeBody = true,
  }) async {
    Response res;
    try {
      res = await APIClient().put(apiKeys,
          data: isFakeBody ? {'driver_ID': null} : null,
          queryParameters: {'orderId': orderId}
            ..removeWhere((key, value) => value == null));
    } catch (e) {
      throw ServerException((e as DioException));
    }

    return res.statusCode == 200;
  }

  @override
  Future<Order> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? pagination}) async {
    Response res;
    try {
      res = await APIClient().get('$apiKeys$id',
          queryParameters: {...?pagination}
            ..removeWhere((key, value) => value == null));
    } catch (e) {
      throw ServerException((e as DioException));
    }

    return Order.fromJson(
        res.data.runtimeType == List ? res.data[0] : res.data);
  }
}
