part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required List<Order> orders,
    required Pager pager,
  }) = _XOrderState;

  factory OrderState.Initial() {
    return const OrderState(
        orders: [],
        pager: Pager(
          pageSize: 20,
          pageNumber: 0,
          lastPage: 1,
          isLoading: false,
        ));
  }
}
