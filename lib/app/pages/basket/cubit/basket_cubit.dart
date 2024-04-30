import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/basket/use_case/add_meal_basket.dart';
import 'package:yumi/domain/basket/use_case/calc_basket.dart';
import 'package:yumi/domain/basket/use_case/close_basket.dart';
import 'package:yumi/domain/basket/use_case/create_basket.dart';
import 'package:yumi/domain/basket/use_case/delete_basket.dart';
import 'package:yumi/domain/basket/use_case/get_basket.dart';
import 'package:yumi/domain/basket/use_case/remove_meal_basket.dart';
import 'package:yumi/domain/basket/use_case/update_basket.dart';
import 'package:yumi/domain/basket/use_case/update_meal_basket.dart';
import 'package:yumi/domain/basket/use_case/update_schedule_basket.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/invoice_transaction_model/invoice_transaction_model.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';

part 'basket_cubit.freezed.dart';
part 'basket_cubit.g.dart';
part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(BasketState.initial());

  pickUpOnly({bool isPickUpOnly = true}) {
    emit(state.copyWith(isPickUpOnly: isPickUpOnly));
  }

  updateSchedule({DateTime? date, String? time}) async {
    final Either<Failure, Basket> task = await UpdateScheduleInBasket().call(
        UpdateScheduleInBasketParams(
            date: date, time: time, basket: state.basket));
    task.fold((l) => null, (r) => emit(state.copyWith(basket: r)));
  }

  addMeal({required MealModel meal}) async {
    final Either<Failure, Basket> task = await AddMealToBasket()
        .call(AddMealToBasketParams(meal: meal, basket: state.basket));
    task.fold((l) => null, (r) => calcBasket(basket: r));
  }

  updateMeal(
      {required InvoiceDetails invoiceDetails,
      required int indexInList,
      required String newQuantity,
      required String note}) async {
    final Either<Failure, Basket> task = await UpdateMealInBasket().call(
        UpdateMealInBasketParams(
            basket: state.basket,
            invoiceDetails: invoiceDetails,
            indexInList: indexInList,
            newQuantity: newQuantity,
            note: note));
    task.fold((l) => null, (r) => calcBasket(basket: r));
  }

  removeMeal({required InvoiceDetails invoiceDetails}) async {
    final Either<Failure, Basket> task = await RemoveMealFromBasket().call(
        RemoveMealFromBasketParams(
            basket: state.basket, invoiceDetails: invoiceDetails));
    task.fold((l) => null, (r) => calcBasket(basket: r));
  }

  getBaskets() async {
    final Either<Failure, Basket?> task = await GetBasket().call(NoParams());
    task.fold((l) => null, (r) async {
      if (r != null) {
        final Either<Failure, Basket> task2 =
            await CalcBasket().call(CalcBasketParams(basket: r));
        task2.fold((l) => null, (r) {
          emit(state.copyWith(basket: r, isPickUpOnly: false));
          G.router.replaceAll([BasketRoute()]);
        });
      }
    });
  }

  calcBasket({required Basket basket}) async {
    final Either<Failure, Basket> task =
        await CalcBasket().call(CalcBasketParams(basket: basket));

    task.fold((l) => null, (r) => updateBasket(basket: r));
  }

  createBasket({required Basket basket}) async {
    final Either<Failure, Basket> task = await CreateBasket().call(
        CreateBasketParams(basket: basket, isPreOrder: basket.isPreorder));
    task.fold((l) => null, (r) {
      emit(state.copyWith(basket: r, isPickUpOnly: r.isPreorder));
      G.router.replaceAll([BasketRoute()]);
    });
  }

  updateBasket({required Basket basket}) async {
    final Either<Failure, Basket> task =
        await UpdateBasket().call(UpdateBasketParams(basket: basket));

    task.fold((l) => null, (r) => emit(state.copyWith(basket: r)));
  }

  closeBasket() async {
    final Either<Failure, Response> task = await CloseBasket().call(
        CloseBasketParams(
            basket: state.basket,
            invoiceTransaction: InvoiceTransactionModel.initial(
                treasuryAmountPaid: state.basket.invoice.finalPrice)));
    task.fold((l) => null, (r) {
      emit(BasketState.initial());
      G.router.replaceAll([HomeRoute()]);
    });
  }

  deleteBasket() async {
    final Either<Failure, Response> task =
        await DeleteBasket().call(DeleteBasketParam(basket: state.basket));
    task.fold((l) => null, (r) {
      emit(BasketState.initial());
      G.router.replaceAll([HomeRoute()]);
    });
  }
}
