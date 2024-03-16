part of 'basket_form_bloc.dart';

@immutable
  class BasketFormState  extends Equatable{

  InvoiceModel invoice;

  BasketFormState({required this.invoice});

  BasketFormState copyWith({InvoiceModel? invoice}){
    return BasketFormState(invoice: invoice ?? this.invoice);
  }

  @override
  List<Object?> get props => [invoice];
}

