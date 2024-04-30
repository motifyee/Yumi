part of 'basket_form_bloc.dart';

@immutable
class BasketFormState extends Equatable {
  final Basket basket;
  final bool isPickUpOnly;

  const BasketFormState({required this.basket, this.isPickUpOnly = false});

  BasketFormState copyWith({Basket? basket, bool? isPickUpOnly}) {
    return BasketFormState(
      basket: basket ?? this.basket,
      isPickUpOnly: isPickUpOnly ?? this.isPickUpOnly,
    );
  }

  @override
  List<Object?> get props => [basket, isPickUpOnly];
}
