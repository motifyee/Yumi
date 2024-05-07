import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
import 'package:yumi/domain/basket/use_case/update_delivery_basket.dart';
import 'package:yumi/domain/basket/use_case/update_meal_basket.dart';
import 'package:yumi/domain/basket/use_case/update_pickUp_basket.dart';
import 'package:yumi/domain/basket/use_case/update_schedule_basket.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';

part 'basket_cubit.freezed.dart';
part 'basket_cubit.g.dart';
part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(BasketState.initial());

  pickUpOnly({bool isPickUpOnly = true}) {
    emit(state.copyWith(
        basket: state.basket.copyWith(isPickupOnly: isPickUpOnly)));
  }

  updateSchedule({DateTime? date, String? time}) async {
    final Either<Failure, Basket> task = await UpdateScheduleInBasket().call(
        UpdateScheduleInBasketParams(
            date: date, time: time, basket: state.basket));
    task.fold((l) => null, (r) => emit(state.copyWith(basket: r)));
  }

  addMeal({required MealModel meal}) async {
    print('addMeal ...');
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
    print('removeMeal ...');
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
        task2.fold((l) => _message(S.current.apiError), (r) {
          emit(state.copyWith(basket: r));
          G.router.replaceAll([BasketRoute()]);
        });
      }
    });
  }

  updateDeliverPickUp({
    required bool isDelivery,
  }) async {
    final Either<Failure, Basket> task = isDelivery
        ? await UpdateDeliveryBasket()
            .call(UpdateDeliveryBasketParams(basket: state.basket))
        : await UpdatePickUpBasket()
            .call(UpdatePickUpBasketParams(basket: state.basket));
    task.fold((l) => null, (r) => calcBasket(basket: r));
  }

  calcBasket({required Basket basket, bool isUpdateBasket = true}) async {
    print('calcBasket ...');
    final Either<Failure, Basket> task =
        await CalcBasket().call(CalcBasketParams(basket: basket));
    task.fold(
        (l) => null, (r) => isUpdateBasket ? updateBasket(basket: r) : null);
  }

  createBasket({required Basket basket}) async {
    print('createBasket ...');
    _loadingIndicator();
    emit(state.copyWith());
    final Either<Failure, Basket> task =
        await CalcBasket().call(CalcBasketParams(basket: basket));
    task.fold((l) => null, (r) async {
      final Either<Failure, Basket> task2 = await CreateBasket()
          .call(CreateBasketParams(basket: r, isPreOrder: basket.isPreorder));

      task2.fold((l) => _message(S.current.apiError), (r) {
        _message(S.current.basketCreated);
        emit(state.copyWith(basket: r));
        G.router.replaceAll([BasketRoute()]);
      });
    });
  }

  updateBasket({required Basket basket}) async {
    print('updateBasket ...');
    _loadingIndicator();
    final Either<Failure, Basket> task =
        await UpdateBasket().call(UpdateBasketParams(basket: basket));

    task.fold((l) => _message(S.current.apiError), (r) {
      _message(S.current.basketUpdated);
      emit(state.copyWith(basket: r));
    });
    G.router.popForced();
  }

  closeBasket() async {
    print('closeBasket ...');
    _loadingIndicator();

    final Either<Failure, Response> task =
        await CloseBasket().call(CloseBasketParams(basket: state.basket));
    task.fold((l) => _message(S.current.apiError), (r) {
      _message(S.current.OrderCreated);
      emit(BasketState.initial());
      G.router.replaceAll([HomeRoute()]);
    });
  }

  void deleteBasket({isLocationChange = false}) async {
    print('deleteBasket ...');
    _loadingIndicator();

    final Either<Failure, Response> task =
        await DeleteBasket().call(DeleteBasketParam(basket: state.basket));
    task.fold((l) => _message(S.current.apiError), (r) {
      _message(S.current.basketDeleted);
      emit(BasketState.initial());
      if (isLocationChange) {
        G.router.replaceAll([CustomerLocationRoute()]);
      } else {
        G.router.replaceAll([HomeRoute()]);
      }
    });
  }
}

void _loadingIndicator() => showDialog(
    context: G.context,
    builder: (context) => Center(
          child: SizedBox(
              width: ThemeSelector.statics.defaultGapExtraExtreme,
              height: ThemeSelector.statics.defaultGapExtraExtreme,
              child: const LoadingIndicator(indicatorType: Indicator.pacman)),
        ));

void _message(String message) {
  ScaffoldMessenger.of(G.context).showSnackBar(
    SnackBar(
      content: SnackBarMassage(
        massage: message,
      ),
    ),
  );
}
