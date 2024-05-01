import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class CloseBasket extends UseCase<Response, CloseBasketParams> {
  final BasketRepo basketRepo;

  CloseBasket({BasketRepo? basketRepo})
      : basketRepo = basketRepo ?? getIt<BasketRepo>();

  @override
  Future<Either<Failure, Response>> call(CloseBasketParams params) async {
    return await basketRepo.closeBasket(basket: params.basket).run();
  }
}

class CloseBasketParams extends Params {
  final Basket basket;

  CloseBasketParams({required this.basket});

  @override
  List<Object?> get props => [basket];
}
