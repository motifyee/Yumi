import 'package:common_code/common_code.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:yumi/domain/order/entity/order.dart';

abstract class OrderRepo {
  TaskEither<Failure, PaginatedData<Order>> getOrders(
      {required String apiKeys, required PaginatedData<Order> ordersPage});

  TaskEither<Failure, bool> putAction({
    required Order order,
    required String apiKey,
    bool isFakeBody = true,
  });
}
