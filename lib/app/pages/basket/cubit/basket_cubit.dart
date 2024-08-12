import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/basket/entity/invoice.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';
import 'package:yumi/domain/basket/use_case/add_meal_basket.dart';
import 'package:yumi/domain/basket/use_case/calc_basket.dart';
import 'package:yumi/domain/basket/use_case/close_basket.dart';
import 'package:yumi/domain/basket/use_case/create_basket.dart';
import 'package:yumi/domain/basket/use_case/delete_basket.dart';
import 'package:yumi/domain/basket/use_case/get_basket.dart';
import 'package:yumi/domain/basket/use_case/remove_meal_basket.dart';
import 'package:yumi/domain/basket/use_case/stripe_payment.dart';
import 'package:yumi/domain/basket/use_case/update_basket.dart';
import 'package:yumi/domain/basket/use_case/update_delivery_basket.dart';
import 'package:yumi/domain/basket/use_case/update_meal_basket.dart';
import 'package:yumi/domain/basket/use_case/update_pickUp_basket.dart';
import 'package:yumi/domain/basket/use_case/update_schedule_basket.dart';
import 'package:yumi/domain/basket/use_case/voucher_basket.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';

part 'basket_cubit.freezed.dart';
part 'basket_cubit.g.dart';
part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(BasketState.initial());

  pickUpOnly({bool isPickUpOnly = true}) {
    emit(state.copyWith(basket: state.basket.copyWith(isPickupOnly: isPickUpOnly)));
  }

  updateSchedule({DateTime? date, String? time}) async {
    final Either<Failure, Basket> task = await UpdateScheduleInBasket().call(UpdateScheduleInBasketParams(date: date, time: time, basket: state.basket));
    task.fold((l) => null, (r) => emit(state.copyWith(basket: r)));
  }

  addMeal({required Meal meal}) async {
    debugPrint('addMeal ...');
    final Either<Failure, Basket> task = await AddMealToBasket().call(AddMealToBasketParams(meal: meal, basket: state.basket));
    task.fold((l) => null, (r) => calcBasket(basket: r));
  }

  updateMeal({required InvoiceDetail invoiceDetails, required int indexInList, required String newQuantity, required String note}) async {
    final Either<Failure, Basket> task = await UpdateMealInBasket().call(UpdateMealInBasketParams(basket: state.basket, invoiceDetails: invoiceDetails, indexInList: indexInList, newQuantity: newQuantity, note: note));
    task.fold((l) => null, (r) => calcBasket(basket: r));
  }

  removeMeal({required InvoiceDetail invoiceDetails}) async {
    final Either<Failure, Basket> task = await RemoveMealFromBasket().call(RemoveMealFromBasketParams(basket: state.basket, invoiceDetails: invoiceDetails));
    task.fold((l) => null, (r) {
      if (r.invoiceDetails.isEmpty) return deleteBasket();
      calcBasket(basket: r);
    });
  }

  Future<dynamic> getBaskets() async {
    debugPrint('getBaskets ...');
    final Either<Failure, Basket?> task = await GetBasket().call(NoParams());
    return task.fold((l) => null, (r) async {
      if (r == null) return null;

      final Either<Failure, Basket> task2 = await CalcBasket().call(CalcBasketParams(basket: r));

      return task2.fold((l) {
        _message(l.toString());

        return null;
      }, (r2) {
        emit(state.copyWith(basket: r2));

        return () => G().router.replaceAll([BasketRoute()]);
      });
    });
  }

  updateDeliverPickUp({
    required bool isDelivery,
  }) async {
    final Either<Failure, Basket> task = isDelivery ? await UpdateDeliveryBasket().call(UpdateDeliveryBasketParams(basket: state.basket)) : await UpdatePickUpBasket().call(UpdatePickUpBasketParams(basket: state.basket));
    task.fold((l) => _message(l.toString()), (r) => calcBasket(basket: r));
  }

  calcBasket({required Basket basket, bool isUpdateBasket = true}) async {
    debugPrint('calcBasket ...');
    final Either<Failure, Basket> task = await CalcBasket().call(CalcBasketParams(basket: basket));
    task.fold((l) => _message(S.current.calculationError), (r) => isUpdateBasket ? updateBasket(basket: r) : null);
  }

  createBasket({required Basket basket}) async {
    debugPrint('createBasket ...');
    _loadingIndicator();
    final Either<Failure, Basket> task = await CalcBasket().call(CalcBasketParams(basket: basket));
    task.fold((l) => null, (r) async {
      final Either<Failure, Basket> task2 = await CreateBasket().call(CreateBasketParams(basket: r, isPreOrder: basket.isPreorder));

      task2.fold((l) => _message(l.toString()), (r) {
        _message(S.current.basketCreated);
        emit(state.copyWith(basket: r));
        G().router.replaceAll([BasketRoute()]);
      });
    });
  }

  updateBasket({required Basket basket}) async {
    debugPrint('updateBasket ...');
    _loadingIndicator();
    final Either<Failure, Basket> task = await UpdateBasket().call(UpdateBasketParams(basket: basket));

    task.fold((l) => _message(l.toString()), (r) {
      _message(S.current.basketUpdated);
      emit(state.copyWith(basket: r));
    });
    G().router.maybePop();
  }

  stripePayment() async {
    if (state.basket.isPaying) return;
    emit(state.copyWith(basket: state.basket.copyWith(isPaying: true)));
    final Either<Failure, bool> task = await StripePayment().call(StripePaymentParams(amount: state.basket.invoice.finalPrice, currency: StripeKeys.currency));
    emit(state.copyWith(basket: state.basket.copyWith(isPaying: false)));
    task.fold((l) => _message(l.error ?? S.current.stripeError, isReturn: false), (r) => closeBasket());
  }

  updatePayment({required int paymentType}) {
    updateBasket(basket: state.basket.copyWith(invoice: state.basket.invoice.copyWith(paymentType: paymentType)));
  }

  addVoucher({required String voucher}) async {
    _loadingIndicator();
    final Either<Failure, Basket> task = await VoucherBasket().call(VoucherBasketParams(basket: state.basket, voucher: voucher));
    task.fold((l) => _message(l.toString()), (r) {
      G().context.router.maybePop();
      calcBasket(basket: r);
    });
  }

  closeBasket() async {
    debugPrint('closeBasket ...');

    Basket basket = state.basket;

    if (state.basket.shippedAddressId == null && !state.basket.isPickup) {
      if (G().context.read<UserCubit>().state.address?.id == null) {
        return _message(S.current.pleaseSelectLocation);
      }

      basket = state.basket.copyWith(shippedAddressId: G().context.read<UserCubit>().state.address?.id);
    }

    _loadingIndicator();

    final Either<Failure, Response> task = await CloseBasket().call(CloseBasketParams(basket: basket));
    task.fold((l) => _message(l.toString()), (r) {
      _message(S.current.OrderCreated);
      emit(BasketState.initial());
      G().router.replaceAll([HomeRoute()]);
    });
  }

  void deleteBasket({isLocationChange = false}) async {
    debugPrint('deleteBasket ...');
    if (state.basket.id == null) return;
    _loadingIndicator();

    final Either<Failure, Response> task = await DeleteBasket().call(DeleteBasketParam(basket: state.basket));
    task.fold((l) {
      G().router.replaceAll([HomeRoute()]);
      _message(l.toString());
    }, (r) {
      _message(S.current.basketDeleted);
      emit(BasketState.initial());
      if (isLocationChange) {
        G().router.replaceAll([const CustomerLocationRoute()]);
      } else {
        G().router.replaceAll([HomeRoute()]);
      }
    });
  }
}

void _loadingIndicator() => showDialog(
    barrierDismissible: false,
    context: G().context,
    builder: (context) => const Center(
            child: SizedBox(
          width: CommonDimens.defaultGapExtraExtreme,
          height: CommonDimens.defaultGapExtraExtreme,
          child: PacmanLoadingWidget(),
        )));

void _message(String message, {bool isReturn = true}) {
  if (isReturn) G().context.router.maybePop();
  ScaffoldMessenger.of(G().context).showSnackBar(
    SnackBar(
      content: SnackBarMassage(
        massage: message,
      ),
    ),
  );
}
