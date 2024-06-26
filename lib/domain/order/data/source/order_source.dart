import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class OrderSource {
  Future<PaginatedData<Order>> getOrders(
      {required String apiKeys, required PaginatedData<Order> ordersPage});

  Future<bool> putOrders({
    required String apiKeys,
    int? orderId,
    bool isFakeBody = true,
  });
}
