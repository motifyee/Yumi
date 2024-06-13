import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class UpdateBasket extends UseCase<Basket, UpdateBasketParams> {
  final BasketRepo basketRepo;

  UpdateBasket({BasketRepo? basketRepo})
      : basketRepo = basketRepo ?? getIt<BasketRepo>();
  @override
  Future<Either<Failure, Basket>> call(UpdateBasketParams params) {
    return basketRepo.updateBasket(basket: params.basket).run();
  }
}

class UpdateBasketParams extends Params {
  final Basket basket;

  UpdateBasketParams({required this.basket});

  @override
  List<Object?> get props => throw UnimplementedError();
}
