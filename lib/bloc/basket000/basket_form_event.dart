part of 'basket_form_bloc.dart';

@immutable
abstract class BasketFormEvent {}

class BasketFormUpdateEvent implements BasketFormEvent {
  final Basket basket;
  final bool isPickUpOnly;
  BasketFormUpdateEvent({required this.basket, required this.isPickUpOnly});
}

class BasketFormUpdateIsPickUpOnlyEvent implements BasketFormEvent {
  final bool isPickUpOnly;
  BasketFormUpdateIsPickUpOnlyEvent({required this.isPickUpOnly});
}

class BasketFormAddMealEvent implements BasketFormEvent {
  final InvoiceDetails invoiceDetails;
  final bool isPickUpOnly;
  BasketFormAddMealEvent(
      {required this.invoiceDetails, required this.isPickUpOnly});
}

class BasketFormUpdateMealEvent implements BasketFormEvent {
  final InvoiceDetails invoiceDetails;
  final int indexInList;
  String newQuantity;
  String note;

  BasketFormUpdateMealEvent({
    required this.invoiceDetails,
    required this.indexInList,
    required this.newQuantity,
    this.note = '',
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

class BasketFormGetNotFinishedEvent implements BasketFormEvent {}

class BasketFormCalcEvent implements BasketFormEvent {}

class BasketFormResetEvent implements BasketFormEvent {
  Basket? basket;

  BasketFormResetEvent({this.basket});
}

class BasketFormPostRequestEvent implements BasketFormEvent {
  BuildContext context;
  bool? isDone;
  InvoiceTransactionModel? invoiceTransaction;

  BasketFormPostRequestEvent(
      {required this.context, this.invoiceTransaction, this.isDone = false});
}
