import 'package:fpdart/src/either.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class GetBasket extends UseCase<Basket?, NoParams> {
  final BasketRepo basketRepo;

  GetBasket({BasketRepo? basketRepo})
      : basketRepo = basketRepo ?? getIt<BasketRepo>();

  @override
  Future<Either<Failure, Basket?>> call(NoParams params) async {
    return await basketRepo.getBaskets().run();
  }
}
