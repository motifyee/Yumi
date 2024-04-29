part of 'basket_cubit.dart';

@freezed
class BasketState with _$BasketState {
  const factory BasketState({
    required Basket basket,
    required bool isPickUpOnly,
  }) = _BasketState;

  factory BasketState.initial() {
    return BasketState(
        basket: Basket(invoice: Invoice.initial(), invoiceDetails: []),
        isPickUpOnly: false);
  }

  factory BasketState.fromJson(Map<String, dynamic> json) =>
      _$BasketStateFromJson(json);
}
