import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pagination.dart';

abstract class OrderSource {
  Future<Pagination<Order>> getOrders(
      {required String apiKeys, required Pagination<Order> pagination});

  Future<bool> putOrders({
    required String apiKeys,
    int? orderId,
    bool isFakeBody = true,
  });
}
