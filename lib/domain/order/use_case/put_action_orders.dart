import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/order/data/repo/order_repo.dart';
import 'package:yumi/domain/order/entity/order.dart';

class PutActionOrders implements UseCase<bool,PutActionOrdersParams>{
  final OrderRepo orderRepo;

  PutActionOrders({OrderRepo? orderRepo})
      : orderRepo = orderRepo ?? getIt<OrderRepo>();

  @override
  Future<Either<Failure, bool>> call(PutActionOrdersParams params) async{
   return orderRepo.putAction(order: params.order, apiKey: params.apiKey ,isFakeBody: params.isFakeBody,).run();
  }

}


class PutActionOrdersParams extends Params {

  final Order order;
  final String apiKey;
  final bool isFakeBody;
  PutActionOrdersParams({required this.order, required this.apiKey, this.isFakeBody = true});


  @override
  List<Object?> get props => [];

}