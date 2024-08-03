import 'package:fpdart/src/task_either.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/order/data/repo/order_repo.dart';
import 'package:common_code/domain/food_delivery/order/data/source/order_source.dart';
import 'package:common_code/domain/food_delivery/order/entity/order.dart';

class OrderRepoRemote extends OrderRepo {
  final OrderSource orderSource;

  OrderRepoRemote({OrderSource? orderSource})
      : orderSource = orderSource ?? getIt<OrderSource>();

  @override
  TaskEither<Failure, PaginatedData<Order>> getOrders(
      {required String apiKeys, required PaginatedData<Order> ordersPage}) {
    return TaskEither.tryCatch(
      () => orderSource.getOrders(apiKeys: apiKeys, ordersPage: ordersPage),
      (error, stackTrace) => Failure.fromException(error),
    );
  }

  @override
  TaskEither<Failure, bool> putAction({
    required Order order,
    required String apiKey,
    bool isFakeBody = true,
  }) {
    return TaskEither.tryCatch(
        () => orderSource.putOrders(
              apiKeys: apiKey,
              isFakeBody: isFakeBody,
              orderId: order.id,
            ),
        (error, stackTrace) => ServerFailure(error.toString()));
  }

  @override
  TaskEither<Failure, Order> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? pagination}) {
    return TaskEither.tryCatch(
        () => orderSource.getOrderOrPreOrderDriverById(
            apiKeys: apiKeys, id: id, pagination: pagination),
        (error, stackTrace) => ServerFailure(error.toString()));
  }
}
