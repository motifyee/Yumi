import 'package:common_code/common_code.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:common_code/domain/food_delivery/order/entity/order.dart';

abstract class OrderRepo {
  TaskEither<Failure, PaginatedData<Order>> getOrders(
      {required String apiKeys, required PaginatedData<Order> ordersPage});

  TaskEither<Failure, bool> putAction({
    required Order order,
    required String apiKey,
    bool isFakeBody = true,
  });
}
