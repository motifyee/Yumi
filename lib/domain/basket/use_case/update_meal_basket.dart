import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class UpdateMealInBasket extends UseCase<Basket, UpdateMealInBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(UpdateMealInBasketParams params) async {
    if (params.newQuantity.isEmpty || int.parse(params.newQuantity) <= 0) {
      return Right(params.basket);
    }

    List<InvoiceDetails> invoiceDetails =
        List.from(params.basket.invoiceDetails);
    invoiceDetails[params.indexInList] =
        invoiceDetails[params.indexInList].copyWith(
      quantity: params.newQuantity,
    );

    return Right(params.basket.copyWith(invoiceDetails: invoiceDetails));
  }
}

class UpdateMealInBasketParams extends Params {
  final Basket basket;
  final InvoiceDetails invoiceDetails;
  final int indexInList;
  final String newQuantity;
  final String note;

  UpdateMealInBasketParams(
      {required this.basket,
      required this.invoiceDetails,
      required this.indexInList,
      required this.newQuantity,
      required this.note});

  @override
  List<Object?> get props =>
      [basket, invoiceDetails, indexInList, newQuantity, note];
}
