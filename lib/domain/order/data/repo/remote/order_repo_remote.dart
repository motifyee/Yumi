import 'package:fpdart/src/task_either.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/data/source/order_source.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pagination_helper.dart';

class OrderRepoRemote extends OrderRepo {
  final OrderSource orderSource;

  OrderRepoRemote({OrderSource? orderSource})
      : orderSource = orderSource ?? getIt<OrderSource>();

  @override
  TaskEither<Failure, PaginationHelper<Order>> getOrders(
      {required String apiKeys,
      required PaginationHelper<Order> paginationHelper}) {
    return TaskEither.tryCatch(
      () => orderSource.getOrders(
          apiKeys: apiKeys, paginationHelper: paginationHelper),
      (error, stackTrace) => ServerFailure(error, stackTrace),
    );
  }
}
