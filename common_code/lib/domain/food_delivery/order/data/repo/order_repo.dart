import 'package:common_code/common_code.dart';
import 'package:fpdart/src/task_either.dart';

abstract class OrderRepo {
  TaskEither<Failure, PaginatedData<Order>> getOrders(
      {required String apiKeys, required PaginatedData<Order> ordersPage});

  TaskEither<Failure, bool> putAction({
    required Order order,
    required String apiKey,
    bool isFakeBody = true,
  });

  TaskEither<Failure, Order> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? pagination});
}
