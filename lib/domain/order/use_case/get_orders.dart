import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pager.dart';

class GetOrders extends UseCase<Pager<Order>, GetOrdersParams> {
  final OrderRepo orderRepo;

  GetOrders({OrderRepo? orderRepo})
      : orderRepo = orderRepo ?? getIt<OrderRepo>();

  @override
  Future<Either<Failure, Pager<Order>>> call(GetOrdersParams params) =>
      orderRepo
          .getOrders(
            apiKeys: params.apiKeys,
            pager: params.pager,
          )
          .run();
}

class GetOrdersParams extends Params {
  final Pager<Order> pager;
  final String apiKeys;

  GetOrdersParams({required this.pager, required this.apiKeys});

  @override
  List<Object?> get props => [pager, apiKeys];
}
