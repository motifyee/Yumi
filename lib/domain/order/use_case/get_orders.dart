import 'package:fpdart/src/either.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pagination_helper.dart';

class GetOrders extends UseCase<PaginationHelper<Order>, GetOrdersParams> {
  final OrderRepo orderRepo;

  GetOrders({OrderRepo? orderRepo})
      : orderRepo = orderRepo ?? getIt<OrderRepo>();

  @override
  Future<Either<Failure, PaginationHelper<Order>>> call(
          GetOrdersParams params) =>
      orderRepo
          .getOrders(
              apiKeys: params.apiKeys,
              paginationHelper: params.paginationHelper)
          .run();
}

class GetOrdersParams extends Params {
  final PaginationHelper<Order> paginationHelper;
  final String apiKeys;

  GetOrdersParams({required this.paginationHelper, required this.apiKeys});

  @override
  List<Object?> get props => throw UnimplementedError();
}
