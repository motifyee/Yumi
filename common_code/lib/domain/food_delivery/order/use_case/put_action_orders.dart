import 'package:fpdart/src/either.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/food_delivery/order/data/repo/order_repo.dart';
import 'package:common_code/domain/food_delivery/order/entity/order.dart';

class PutActionOrders implements UseCase<bool, PutActionOrdersParams> {
  final OrderRepo orderRepo;

  PutActionOrders({OrderRepo? orderRepo})
      : orderRepo = orderRepo ?? getIt<OrderRepo>();

  @override
  Future<Either<Failure, bool>> call(PutActionOrdersParams params) async {
    return orderRepo
        .putAction(
          order: params.order,
          apiKey: params.apiKey,
          isFakeBody: params.isFakeBody,
        )
        .run();
  }
}

class PutActionOrdersParams extends Params {
  final Order order;
  final String apiKey;
  final bool isFakeBody;
  PutActionOrdersParams(
      {required this.order, required this.apiKey, this.isFakeBody = true});

  @override
  List<Object?> get props => [];
}
