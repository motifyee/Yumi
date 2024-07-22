import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/entity/order.dart';

class GetOrderPreorderDriverById extends UseCase<Order, GetOrderPreorderDriverByIdParams> {
  final OrderRepo orderRepo;

  GetOrderPreorderDriverById({OrderRepo? orderRepo}) : orderRepo = orderRepo ?? getIt<OrderRepo>();

  @override
  Future<Either<Failure, Order>> call(GetOrderPreorderDriverByIdParams params) {
    return orderRepo.getOrderOrPreOrderDriverById(apiKeys: params.apiKeys, id: params.id, pagination: params.pagination).run();
  }
}

class GetOrderPreorderDriverByIdParams extends Params {
  final String apiKeys;
  final String id;
  final Map<String, dynamic>? pagination;

  GetOrderPreorderDriverByIdParams({required this.apiKeys, required this.id, this.pagination});
  @override
  List<Object?> get props => [];
}
