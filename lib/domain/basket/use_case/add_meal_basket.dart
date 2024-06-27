import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/meal/entity/meal.dart';

class AddMealToBasket extends UseCase<Basket, AddMealToBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(AddMealToBasketParams params) async {
    List<InvoiceDetails> invoiceDetails = List.from(params.basket.invoiceDetails);

    invoiceDetails.add(InvoiceDetails.fromMeal(meal: params.meal));

    return Right(params.basket.copyWith(
      invoiceDetails: invoiceDetails,
      isPreorder: params.meal.isPreOrder ?? params.basket.isPreorder,
      invoice: params.basket.invoice.copyWith(chefID: params.meal.chefId ?? params.basket.invoice.chefID),
    ));
  }
}

class AddMealToBasketParams extends Params {
  final Meal meal;
  final Basket basket;

  AddMealToBasketParams({required this.meal, required this.basket});

  @override
  List<Object?> get props => [meal];
}
