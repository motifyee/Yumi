part of 'basket_form_bloc.dart';

@immutable
class BasketFormState extends Equatable {
  final InvoiceModel invoice;
  final bool isPickUpOnly;

  const BasketFormState({required this.invoice, this.isPickUpOnly = false});

  BasketFormState copyWith({InvoiceModel? invoice, bool? isPickUpOnly}) {
    return BasketFormState(
      invoice: invoice ?? this.invoice,
      isPickUpOnly: isPickUpOnly ?? this.isPickUpOnly,
    );
  }

  @override
  List<Object?> get props => [invoice, isPickUpOnly];
}
