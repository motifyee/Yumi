import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class OrderSource {
  Future<PaginationHelper<Order>> getOrders(
      {required String apiKeys,
      required PaginationHelper<Order> paginationHelper});

  Future<bool> putOrders(
      {required String apiKeys,
      int? orderId,
      bool isFakeBody = true,
      required PaginationHelper<Order> paginationHelper});
}
