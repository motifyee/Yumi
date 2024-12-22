import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class CalcBasket extends UseCase<Basket, CalcBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(CalcBasketParams params) async {
    params.basket = params.basket.copyWith(
      invoice: params.basket.invoice.copyWith(
        deliveryAreaPrice: params.basket.isPickup == true ? 0 : 4.5,
        deliveryCostPrice: params.basket.isPickup == true ? 0 : 4.5,
      ),
    );

    final double totalPrice = params.basket.invoiceDetails.fold(
      0.0,
      (p, e) => p + (e.productVarintPrice * int.parse(e.quantity)),
    );

    final double invoiceTax =
        ((totalPrice - params.basket.invoice.invoiceDiscount) * .25) * .19;

    final double finalPrice = totalPrice -
        params.basket.invoice.invoiceDiscount +
        invoiceTax +
        params.basket.invoice.deliveryAreaPrice;

    return Right(
      params.basket.copyWith(
        invoice: params.basket.invoice.copyWith(
          totalPrice: totalPrice.toFixed(2),
          invoiceTax: invoiceTax.toFixed(2),
          finalPrice: finalPrice.toFixed(2),
        ),
      ),
    );
  }
}

class CalcBasketParams extends Params {
  Basket basket;

  CalcBasketParams({required this.basket});

  @override
  List<Object?> get props => [basket];
}
