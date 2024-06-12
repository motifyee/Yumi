import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class CalcBasket extends UseCase<Basket, CalcBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(CalcBasketParams params) async {
    params.basket = params.basket.copyWith(
        invoice: params.basket.invoice.copyWith(
      deliveryAreaPrice: params.basket.isPickup == true ? 0 : 4.5,
      deliveryCostPrice: params.basket.isPickup == true ? 0 : 4.5,
    ));

    double totalPrice = params.basket.invoiceDetails.fold(
        0.0, (p, e) => p + (e.productVarintPrice * int.parse(e.quantity)));

    double invoiceTax =
        ((totalPrice - params.basket.invoice.invoiceDiscount) * .3) * .25;

    double finalPrice = totalPrice -
        params.basket.invoice.invoiceDiscount +
        invoiceTax +
        params.basket.invoice.deliveryAreaPrice;

    return Right(
      params.basket.copyWith(
        invoice: params.basket.invoice.copyWith(
          totalPrice: double.parse(totalPrice.toStringAsFixed(2)),
          invoiceTax: double.parse(invoiceTax.toStringAsFixed(2)),
          finalPrice: double.parse(finalPrice.toStringAsFixed(2)),
        ),
      ),
    );
  }
}

class CalcBasketParams extends Params {
  Basket basket;

  CalcBasketParams({required this.basket});

  @override
  // TODO: implement props
  List<Object?> get props => [basket];
}
