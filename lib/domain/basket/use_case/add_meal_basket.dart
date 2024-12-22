import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';

class AddMealToBasket extends UseCase<Basket, AddMealToBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(AddMealToBasketParams params) async {
    final List<InvoiceDetail> invoiceDetails =
        List.from(params.basket.invoiceDetails);

    invoiceDetails.add(InvoiceDetail.fromMeal(meal: params.meal));

    return Right(
      params.basket.copyWith(
        invoiceDetails: invoiceDetails,
        isPreorder: params.meal.isPreOrder ?? params.basket.isPreorder,
        invoice: params.basket.invoice.copyWith(
            chefID: params.meal.chefId ?? params.basket.invoice.chefID),
      ),
    );
  }
}

class AddMealToBasketParams extends Params {
  final Meal meal;
  final Basket basket;

  AddMealToBasketParams({required this.meal, required this.basket});

  @override
  List<Object?> get props => [meal];
}
