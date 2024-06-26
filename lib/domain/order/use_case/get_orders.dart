import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/paginatedData.dart';

class GetOrders extends UseCase<PaginatedData<Order>, GetOrdersParams> {
  final OrderRepo orderRepo;

  GetOrders({OrderRepo? orderRepo})
      : orderRepo = orderRepo ?? getIt<OrderRepo>();

  @override
  Future<Either<Failure, PaginatedData<Order>>> call(GetOrdersParams params) =>
      orderRepo
          .getOrders(
            apiKeys: params.apiKeys,
            ordersPage: params.ordersPage,
          )
          .run();
}

class GetOrdersParams extends Params {
  final PaginatedData<Order> ordersPage;
  final String apiKeys;

  GetOrdersParams({required this.ordersPage, required this.apiKeys});

  @override
  List<Object?> get props => [ordersPage, apiKeys];
}
