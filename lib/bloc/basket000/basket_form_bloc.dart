import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/extensions/date_time_extension.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/invoice_transaction_model/invoice_transaction_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/template/snack_bar.dart';

part 'basket_form_event.dart';
part 'basket_form_state.dart';

class BasketFormBloc extends Bloc<BasketFormEvent, BasketFormState> {
  BasketFormBloc()
      : super(
          BasketFormState(
            basket: Basket(
              invoice: Invoice.initial(),
              invoiceDetails: [],
            ),
          ),
        ) {
    on<BasketFormUpdateScheduleEvent>((event, emit) {
      if (event.date != null) {
        emit(state.copyWith(
          basket: state.basket.copyWith(
            invoice: state.basket.invoice.copyWith(
              scheduleDate: event.date,
            ),
          ),
        ));
      }

      if (event.time != null) {
        emit(state.copyWith(
          basket: state.basket.copyWith(
            invoice: state.basket.invoice.copyWith(
              scheduleDate:
                  (state.basket.invoice.scheduleDate ?? DateTime.now())
                      .copyWith(
                hour: int.parse(event.time!.split(":")[0]),
                minute: int.parse(event.time!.split(":")[1]),
              ),
            ),
          ),
        ));
      }
    });

    /// done
    on<BasketFormUpdateMealEvent>((event, emit) {
      if (event.newQuantity.isEmpty || int.parse(event.newQuantity) <= 0) {
        return;
      }

      List<InvoiceDetails> invoiceDetails =
          List.from(state.basket.invoiceDetails);
      invoiceDetails[event.indexInList] =
          invoiceDetails[event.indexInList].copyWith(
        quantity: event.newQuantity,
      );

      emit(state.copyWith(
          basket: state.basket.copyWith(
        invoiceDetails: invoiceDetails,
      )));

      add(BasketFormCalcEvent());
    });

    /// done
    on<BasketFormRemoveMealEvent>((event, emit) {
      List<InvoiceDetails> invoiceDetails =
          List.from(state.basket.invoiceDetails);
      invoiceDetails.removeWhere(
          (e) => e.productVarintId == event.invoiceDetails.productVarintId);

      emit(state.copyWith(
          basket: state.basket.copyWith(invoiceDetails: invoiceDetails)));

      add(BasketFormCalcEvent());
    });

    ///done
    on<BasketFormAddMealEvent>((event, emit) {
      List<InvoiceDetails> invoiceDetails = state.basket.invoiceDetails;
      invoiceDetails.add(event.invoiceDetails);

      emit(state.copyWith(
        basket: state.basket.copyWith(
          invoiceDetails: invoiceDetails,
          isPreorder:
              event.invoiceDetails.meal?.isPreOrder ?? state.basket.isPreorder,
          invoice: state.basket.invoice.copyWith(
              chefID: event.invoiceDetails.meal?.chefId ??
                  state.basket.invoice.chefID),
        ),
      ));

      add(BasketFormUpdateIsPickUpOnlyEvent(isPickUpOnly: event.isPickUpOnly));
      add(BasketFormCalcEvent());
    });

    /// done
    on<BasketFormUpdateIsPickUpOnlyEvent>((event, emit) {
      emit(state.copyWith(isPickUpOnly: event.isPickUpOnly));
    });

    ///done
    on<BasketFormGetNotFinishedEvent>((event, emit) async {
      Response res = await OrderService.getBaskets();

      if (res.data['data']?.isNotEmpty) {
        emit(state.copyWith(
            basket: Basket.fromJson({
              ...res.data['data'][0],
              'invoice': res.data['data'][0],
            }),
            isPickUpOnly: false));
        add(BasketFormCalcEvent());
        G.context.router.replaceAll([BasketRoute()]);
      }
    });

    /// done
    on<BasketFormResetEvent>((event, emit) async {
      if (event.basket != null) {
        Response res = await OrderService.deleteInvoice(invoice: event.basket!);
      }
      emit(
        BasketFormState(
          basket: Basket(
            invoice: Invoice.initial(),
            invoiceDetails: [],
          ),
        ),
      );
    });

    /// done
    on<BasketFormCalcEvent>((event, emit) {
      double totalPrice = double.parse(state.basket.invoiceDetails
          .fold(0.0,
              (p, e) => p + (e.productVarintPrice * int.parse(e.quantity)))
          .toStringAsFixed(2));

      double invoiceTax = double.parse(
          (((totalPrice - state.basket.invoice.invoiceDiscount) * .3) * .25)
              .toStringAsFixed(2));

      double finalPrice = double.parse((totalPrice -
              state.basket.invoice.invoiceDiscount +
              invoiceTax +
              state.basket.invoice.deliveryAreaPrice)
          .toStringAsFixed(2));

      emit(state.copyWith(
          basket: state.basket.copyWith(
        invoice: state.basket.invoice.copyWith(
          totalPrice: totalPrice,
          invoiceTax: invoiceTax,
          finalPrice: finalPrice,
        ),
      )));
      add(BasketFormPostRequestEvent(context: G.context));
    });

    /// done
    on<BasketFormUpdateEvent>((event, emit) {
      emit(state.copyWith(
          basket: event.basket, isPickUpOnly: event.isPickUpOnly));
      add(BasketFormCalcEvent());
    });

    /// done
    on<BasketFormPostRequestEvent>((event, emit) async {
      emit(state.copyWith(
          basket: state.basket.copyWith(
              shippedAddressId:
                  event.context.read<UserBloc>().state.user.multiAddressID)));

      late Response res;
      if (event.isDone == true) {
        res = await OrderService.closeInvoice(
            basket: state.basket,
            invoiceTransaction: event.invoiceTransaction!);
      } else {
        if (state.basket.id == null) {
          if (state.basket.isDelivery == true) {
            res = await OrderService.createOrderOrPreOrderDelivery(
                context: event.context,
                invoice: state.basket,
                isPreOrder: state.basket.isPreorder ?? false);
          }
          if (state.basket.isPickup == true) {
            res = await OrderService.createOrderOrPreOrderPickUp(
                context: event.context,
                invoice: state.basket,
                isPreOrder: state.basket.isPreorder ?? false);
          }
        } else {
          res = await OrderService.updateInvoice(basket: state.basket);
        }
      }

      if (res.statusCode == 200) {
        if (event.isDone == true) {
          add(BasketFormResetEvent());
          ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(
              content: SnackBarMassage(
                massage: S.current.orderCreatedSuccessfully,
              ),
            ),
          );
          event.context.router.replaceAll([HomeRoute()]);
        }
        if (state.basket.id == null) {
          emit(state.copyWith(
              basket: state.basket.copyWith(id: res.data['invoiceId'])));
        }
      } else if (res.statusCode! <= 400) {
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: SnackBarMassage(
              massage: res.data['message'],
            ),
          ),
        );
      }
    });
  }
}
