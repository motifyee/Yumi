import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/data/source/order_source.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/pagination.dart';

class OrderRepoRemote extends OrderRepo {
  final OrderSource orderSource;

  OrderRepoRemote({OrderSource? orderSource})
      : orderSource = orderSource ?? getIt<OrderSource>();

  @override
  TaskEither<Failure, Pagination<Order>> getOrders(
      {required String apiKeys, required Pagination<Order> pagination}) {
    return TaskEither.tryCatch(
      () => orderSource.getOrders(apiKeys: apiKeys, pagination: pagination),
      (error, stackTrace) {
        return ServerFailure(error, stackTrace);
      },
    );
  }
}
