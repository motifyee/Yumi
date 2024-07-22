import 'package:common_code/common_code.dart';
import 'package:yumi/domain/order/entity/order.dart';

abstract class OrderSource {
  Future<PaginatedData<Order>> getOrders({required String apiKeys, required PaginatedData<Order> ordersPage});

  Future<bool> putOrders({
    required String apiKeys,
    int? orderId,
    bool isFakeBody = true,
  });

  Future<Order> getOrderOrPreOrderDriverById({required String apiKeys, required String id, Map<String, dynamic>? pagination});
}
