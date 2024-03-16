part of 'basket_form_bloc.dart';

@immutable
abstract class BasketFormEvent {}

class BasketFormUpdateEvent implements BasketFormEvent {
  final InvoiceModel invoice;
  BasketFormUpdateEvent({required this.invoice});
}

class BasketFormAddMealEvent implements BasketFormEvent {
  final InvoiceDetails invoiceDetails;

  BasketFormAddMealEvent({required this.invoiceDetails});
}

class BasketFormUpdateMealEvent implements BasketFormEvent {
  final InvoiceDetails invoiceDetails;
  final int indexInList;
  String newQuantity;

  BasketFormUpdateMealEvent({
    required this.invoiceDetails,
    required this.indexInList,
    required this.newQuantity,
  });
}

class BasketFormUpdateScheduleEvent implements BasketFormEvent {
  final DateTime? date;
  final String? time;
  BasketFormUpdateScheduleEvent({this.date, this.time});
}

class BasketFormRemoveMealEvent implements BasketFormEvent {
  final InvoiceDetails invoiceDetails;

  BasketFormRemoveMealEvent({required this.invoiceDetails});
}

class BasketFormCalcEvent implements BasketFormEvent {}

class BasketFormResetEvent implements BasketFormEvent {}

class BasketFormPostRequestEvent implements BasketFormEvent {
  BuildContext context;

  BasketFormPostRequestEvent({required this.context});
}
