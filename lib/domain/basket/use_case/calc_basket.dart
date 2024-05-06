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

    double totalPrice = double.parse(params.basket.invoiceDetails
        .fold(0.0, (p, e) => p + (e.productVarintPrice * int.parse(e.quantity)))
        .toStringAsFixed(2));

    double invoiceTax = double.parse(
        (((totalPrice - params.basket.invoice.invoiceDiscount) * .3) * .25)
            .toStringAsFixed(2));

    double finalPrice = double.parse((totalPrice -
            params.basket.invoice.invoiceDiscount +
            invoiceTax +
            params.basket.invoice.deliveryAreaPrice)
        .toStringAsFixed(2));

    return Right(
      params.basket.copyWith(
        invoice: params.basket.invoice.copyWith(
          totalPrice: totalPrice,
          invoiceTax: invoiceTax,
          finalPrice: finalPrice,
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
