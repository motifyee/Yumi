import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class CreateBasket extends UseCase<Basket, CreateBasketParams> {
  final BasketRepo basketRepo;

  CreateBasket({BasketRepo? basketRepo})
      : basketRepo = basketRepo ?? getIt<BasketRepo>();

  @override
  Future<Either<Failure, Basket>> call(CreateBasketParams params) async {
    return await basketRepo
        .createOrderOrPreOrderPickUp(
          basket: params.basket,
          isPreOrder: params.isPreOrder,
        )
        .run();
  }
}

class CreateBasketParams extends Params {
  final Basket basket;
  final bool isPreOrder;

  CreateBasketParams({required this.basket, required this.isPreOrder});

  @override
  List<Object?> get props => throw UnimplementedError();
}
