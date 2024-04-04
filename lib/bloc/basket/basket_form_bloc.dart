import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/extensions/date_time_extension.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/invoice_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/template/snack_bar.dart';

part 'basket_form_event.dart';
part 'basket_form_state.dart';

class BasketFormBloc extends Bloc<BasketFormEvent, BasketFormState> {
  BasketFormBloc()
      : super(BasketFormState(
            invoice: InvoiceModel(
          invoice: Invoice(),
          invoiceDetails: [],
        ))) {
    on<BasketFormResetEvent>((event, emit) {
      emit(
        BasketFormState(
          invoice: InvoiceModel(
            invoice: Invoice(),
            invoiceDetails: [],
          ),
        ),
      );
    });
    on<BasketFormUpdateEvent>((event, emit) {
      emit(state.copyWith(invoice: event.invoice));
    });

    on<BasketFormUpdateIsPickUpOnlyEvent>((event, emit) {
      emit(state.copyWith(isPickUpOnly: event.isPickUpOnly));
    });

    on<BasketFormAddMealEvent>((event, emit) {
      List<InvoiceDetails> invoiceDetails = state.invoice.invoiceDetails ?? [];
      invoiceDetails.add(event.invoiceDetails);

      emit(state.copyWith(
        invoice: state.invoice.copyWith(
          invoiceDetails: invoiceDetails,
          isPreorder:
              event.invoiceDetails.meal?.isPreOrder ?? state.invoice.isPreorder,
          invoice: state.invoice.invoice?.copyWith(
              chefID: event.invoiceDetails.meal?.chefId ??
                  state.invoice.invoice?.chefID),
        ),
      ));

      add(BasketFormUpdateIsPickUpOnlyEvent(isPickUpOnly: event.isPickUpOnly));
      add(BasketFormCalcEvent());
    });

    on<BasketFormUpdateScheduleEvent>((event, emit) {
      if (event.date != null) {
        emit(state.copyWith(
          invoice: state.invoice.copyWith(
            invoice: state.invoice.invoice?.copyWith(
              scheduleDate: event.date,
            ),
          ),
        ));
      }

      if (event.time != null) {
        emit(state.copyWith(
          invoice: state.invoice.copyWith(
            invoice: state.invoice.invoice?.copyWith(
              scheduleDate:
                  (state.invoice.invoice!.scheduleDate ?? DateTime.now())
                      .copyWith(
                hour: int.parse(event.time!.split(":")[0]),
                minute: int.parse(event.time!.split(":")[1]),
              ),
            ),
          ),
        ));
      }
    });

    on<BasketFormRemoveMealEvent>((event, emit) {
      List<InvoiceDetails> invoiceDetails = state.invoice.invoiceDetails ?? [];
      invoiceDetails.removeWhere(
          (e) => e.productVarintId == event.invoiceDetails.productVarintId);

      emit(state.copyWith(
          invoice: state.invoice.copyWith(invoiceDetails: invoiceDetails)));

      add(BasketFormCalcEvent());
    });

    on<BasketFormUpdateMealEvent>((event, emit) {
      if (event.newQuantity.isEmpty || int.parse(event.newQuantity) <= 0)
        return;

      List<InvoiceDetails> invoiceDetails = state.invoice.invoiceDetails ?? [];
      invoiceDetails[event.indexInList] =
          invoiceDetails[event.indexInList].copyWith(
        quantity: event.newQuantity,
      );

      emit(state.copyWith(
          invoice: state.invoice.copyWith(
        invoiceDetails: invoiceDetails,
      )));

      add(BasketFormCalcEvent());
    });

    on<BasketFormCalcEvent>((event, emit) {
      InvoiceModel invoice = state.invoice;

      invoice.invoice!.totalPrice = double.parse(invoice.invoiceDetails!
          .fold(0.0,
              (p, e) => p + (e.productVarintPrice! * int.parse(e.quantity!)))
          .toStringAsFixed(2));

      invoice.invoice!.invoiceTax = double.parse(
          (((invoice.invoice!.totalPrice! - invoice.invoice!.invoiceDiscount!) *
                      .3) *
                  .25)
              .toStringAsFixed(2));

      invoice.invoice!.finalPrice = double.parse((invoice.invoice!.totalPrice! -
              invoice.invoice!.invoiceDiscount! +
              invoice.invoice!.invoiceTax! +
              invoice.invoice!.deliveryAreaPrice!)
          .toStringAsFixed(2));

      emit(state.copyWith(invoice: invoice));
    });

    on<BasketFormPostRequestEvent>((event, emit) async {
      emit(state.copyWith(
          invoice: state.invoice.copyWith(
              shippedAddressId:
                  event.context.read<UserBloc>().state.user.multiAddressID)));

      late Response res;
      if (state.invoice.isDelivery == true) {
        res = await OrderService.createOrderOrPreOrderDelivery(
            context: event.context,
            invoice: state.invoice,
            isPreOrder: state.invoice.isPreorder ?? false);
      }
      if (state.invoice.isPickup == true) {
        res = await OrderService.createOrderOrPreOrderPickUp(
            context: event.context,
            invoice: state.invoice,
            isPreOrder: state.invoice.isPreorder ?? false);
      }

      if (res.statusCode == 200) {
        add(BasketFormResetEvent());
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: SnackBarMassage(
              massage: S.current.orderCreatedSuccessfully,
            ),
          ),
        );
        event.context.router.replaceAll([HomeRoute()]);
      } else {
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
