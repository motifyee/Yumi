import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pagination.dart';

abstract class OrderRepo {
  TaskEither<Failure, Pagination<Order>> getOrders(
      {required String apiKeys, required Pagination<Order> pagination});

  TaskEither<Failure, bool> putAction({
    required Order order,
    required String apiKey,
    bool isFakeBody = true,
  });
}
