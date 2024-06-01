import 'dart:async';

import 'package:dio/dio.dart';
import 'package:yumi/domain/order/data/source/order_source.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pagination_helper.dart';

class OrderSourceRemote extends OrderSource {
  Future<PaginationHelper<Order>> getOrders(
      {required String apiKeys,
      required PaginationHelper<Order> paginationHelper}) async {
    Response res = await DioClient.simpleDio()
        .get(apiKeys, queryParameters: {...paginationHelper.toJson()});

    List<Order> data =
        res.data['data'].map<Order>((e) => Order.fromJson(e)).toList();

    return paginationHelper.copyWith(
      data: <Order>[...paginationHelper.data, ...data].unique((e) => e.id),
      isLoading: false,
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as PaginationHelper<Order>;
  }

  @override
  Future<bool> putOrders(
      {required String apiKeys,
      int? orderId,
      bool isFakeBody = true,
      required PaginationHelper<Order> paginationHelper}) async {
    Response res = await DioClient.simpleDio().put(apiKeys,
        data: isFakeBody ? {'driver_ID': null} : null,
        queryParameters: {...paginationHelper.toJson(), 'orderId': orderId}
          ..removeWhere((key, value) => value == null));

    return res.statusCode == 200;
  }
}
