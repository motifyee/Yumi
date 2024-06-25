import 'dart:async';

import 'package:dio/dio.dart';
import 'package:yumi/domain/order/data/source/order_source.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pagination.dart';

class OrderSourceRemote extends OrderSource {
  @override
  Future<Pagination<Order>> getOrders(
      {required String apiKeys, required Pagination<Order> ordersPage}) async {
    Response res = await DioClient.simpleDio()
        .get(apiKeys, queryParameters: {...ordersPage.toJson()});

    List<Order> data =
        res.data['data'].map<Order>((e) => Order.fromJson(e)).toList();

    return ordersPage.copyWith(
      data: <Order>[...ordersPage.data, ...data].unique((e) => e.id),
      isLoading: false,
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as Pagination<Order>;
  }

  @override
  Future<bool> putOrders({
    required String apiKeys,
    int? orderId,
    bool isFakeBody = true,
  }) async {
    Response res = await DioClient.simpleDio().put(apiKeys,
        data: isFakeBody ? {'driver_ID': null} : null,
        queryParameters: {'orderId': orderId}
          ..removeWhere((key, value) => value == null));

    return res.statusCode == 200;
  }
}
