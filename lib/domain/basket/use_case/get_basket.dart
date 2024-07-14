import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
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
