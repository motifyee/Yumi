import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/extensions/date_time_extension.dart';
import 'package:yumi/model/invoice_model.dart';

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
      emit(BasketFormState(
          invoice: InvoiceModel(
        invoice: Invoice(),
        invoiceDetails: [],
      )));
    });
    on<BasketFormUpdateEvent>((event, emit) {
      emit(state.copyWith(invoice: event.invoice));
    });

    on<BasketFormAddMealEvent>((event, emit) {
      List<InvoiceDetails> invoiceDetails = state.invoice.invoiceDetails ?? [];
      invoiceDetails.add(event.invoiceDetails);

      emit(state.copyWith(
          invoice: state.invoice.copyWith(invoiceDetails: invoiceDetails)));
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
              scheduleDate: state.invoice.invoice!.scheduleDate?.copyWith(
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
          invoice: state.invoice.copyWith(invoiceDetails: invoiceDetails)));

      add(BasketFormCalcEvent());
    });

    on<BasketFormCalcEvent>((event, emit) {
      print('Calc started !!!!!!');
      print(state.invoice.toJson());

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

      print(invoice.toJson());
      // emit(BasketFormState(invoice: InvoiceModel()));
    });
  }
}
