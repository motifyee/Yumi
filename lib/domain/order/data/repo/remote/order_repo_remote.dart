import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/data/source/order_source.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/paginatedData.dart';

class OrderRepoRemote extends OrderRepo {
  final OrderSource orderSource;

  OrderRepoRemote({OrderSource? orderSource})
      : orderSource = orderSource ?? getIt<OrderSource>();

  @override
  TaskEither<Failure, PaginatedData<Order>> getOrders(
      {required String apiKeys, required PaginatedData<Order> ordersPage}) {
    return TaskEither.tryCatch(
      () => orderSource.getOrders(apiKeys: apiKeys, ordersPage: ordersPage),
      (error, stackTrace) {
        return ServerFailure(error, stackTrace);
      },
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
        (error, stackTrace) => ServerFailure(error, stackTrace));
  }
}
