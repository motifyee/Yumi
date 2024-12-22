import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';

class RemoveMealFromBasket extends UseCase<Basket, RemoveMealFromBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(
    RemoveMealFromBasketParams params,
  ) async {
    final List<InvoiceDetail> invoiceDetails =
        List.from(params.basket.invoiceDetails);
    invoiceDetails.removeWhere(
      (e) => e.productVarintId == params.invoiceDetails.productVarintId,
    );

    return Right(params.basket.copyWith(invoiceDetails: invoiceDetails));
  }
}

class RemoveMealFromBasketParams extends Params {
  final Basket basket;
  final InvoiceDetail invoiceDetails;

  RemoveMealFromBasketParams({
    required this.basket,
    required this.invoiceDetails,
  });

  @override
  List<Object?> get props => [basket, invoiceDetails];
}
