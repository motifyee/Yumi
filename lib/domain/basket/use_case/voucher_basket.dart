import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class VoucherBasket extends UseCase<Basket, VoucherBasketParams> {
  final BasketRepo basketRepo;

  VoucherBasket({BasketRepo? basketRepo}) : basketRepo = basketRepo ?? getIt<BasketRepo>();

  @override
  Future<Either<Failure, Basket>> call(VoucherBasketParams params) {
    return basketRepo.checkVoucherBasket(basket: params.basket, voucher: params.voucher).run();
  }
}

class VoucherBasketParams extends Params {
  final Basket basket;
  final String voucher;

  VoucherBasketParams({required this.basket, required this.voucher});

  @override
  List<Object?> get props => [basket, voucher];
}
