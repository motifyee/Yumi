import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class RemoveMealFromBasket extends UseCase<Basket, RemoveMealFromBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(
      RemoveMealFromBasketParams params) async {
    List<InvoiceDetails> invoiceDetails =
        List.from(params.basket.invoiceDetails);
    invoiceDetails.removeWhere(
        (e) => e.productVarintId == params.invoiceDetails.productVarintId);

    return Right(params.basket.copyWith(invoiceDetails: invoiceDetails));
  }
}

class RemoveMealFromBasketParams extends Params {
  final Basket basket;
  final InvoiceDetails invoiceDetails;

  RemoveMealFromBasketParams(
      {required this.basket, required this.invoiceDetails});

  @override
  List<Object?> get props => [basket, invoiceDetails];
}
