import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class DeleteBasket extends UseCase<Response, DeleteBasketParam> {
  final BasketRepo basketRepo;

  DeleteBasket({BasketRepo? basketRepo})
      : basketRepo = basketRepo ?? getIt<BasketRepo>();

  @override
  Future<Either<Failure, Response>> call(DeleteBasketParam params) async {
    return basketRepo.deleteBasket(basket: params.basket).run();
  }
}

class DeleteBasketParam extends Params {
  final Basket basket;
  DeleteBasketParam({required this.basket});

  @override
  List<Object?> get props => [basket];
}
