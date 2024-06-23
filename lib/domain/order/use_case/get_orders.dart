import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pagination.dart';

class GetOrders extends UseCase<Pagination<Order>, GetOrdersParams> {
  final OrderRepo orderRepo;

  GetOrders({OrderRepo? orderRepo})
      : orderRepo = orderRepo ?? getIt<OrderRepo>();

  @override
  Future<Either<Failure, Pagination<Order>>> call(GetOrdersParams params) =>
      orderRepo
          .getOrders(
            apiKeys: params.apiKeys,
            pagination: params.pagination,
          )
          .run();
}

class GetOrdersParams extends Params {
  final Pagination<Order> pagination;
  final String apiKeys;

  GetOrdersParams({required this.pagination, required this.apiKeys});

  @override
  List<Object?> get props => [pagination, apiKeys];
}
