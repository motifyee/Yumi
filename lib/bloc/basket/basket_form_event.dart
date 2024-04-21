part of 'basket_form_bloc.dart';

@immutable
abstract class BasketFormEvent {}

class BasketFormUpdateEvent implements BasketFormEvent {
  final InvoiceModel invoice;
  final bool isPickUpOnly;
  BasketFormUpdateEvent({required this.invoice, required this.isPickUpOnly});
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

class BasketFormCalcEvent implements BasketFormEvent {}

class BasketFormResetEvent implements BasketFormEvent {}

class BasketFormPostRequestEvent implements BasketFormEvent {
  BuildContext context;
  bool? isDone;

  BasketFormPostRequestEvent({required this.context, this.isDone = false});
}
