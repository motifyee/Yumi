import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pager.dart';

abstract class OrderSource {
  Future<Pager<Order>> getOrders(
      {required String apiKeys, required Pager<Order> pager});

  Future<bool> putOrders(
      {required String apiKeys,
      int? orderId,
      bool isFakeBody = true,
      required Pager<Order> pager});
}
