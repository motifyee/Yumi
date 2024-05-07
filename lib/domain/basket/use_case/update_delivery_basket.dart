import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class UpdateDeliveryBasket extends UseCase<Basket, UpdateDeliveryBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(
      UpdateDeliveryBasketParams params) async {
    return Right(params.basket.copyWith(isDelivery: true, isPickup: false));
  }
}

class UpdateDeliveryBasketParams extends Params {
  final Basket basket;

  UpdateDeliveryBasketParams({required this.basket});

  @override
  List<Object?> get props => [];
}
