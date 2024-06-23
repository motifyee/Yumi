import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class OrderRepo {
  TaskEither<Failure, PaginationHelper<Order>> getOrders(
      {required String apiKeys,
      required PaginationHelper<Order> paginationHelper});

  TaskEither<Failure, bool> putAction(
      {
        required Order order,
        required String apiKey,

   bool isFakeBody = true,

         });
}
