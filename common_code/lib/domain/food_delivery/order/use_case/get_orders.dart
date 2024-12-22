import 'package:fpdart/src/either.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/order/data/repo/order_repo.dart';

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
