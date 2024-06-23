part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required List<Order> orders,
    required Pagination pagination,
  }) = _XOrderState;

  factory OrderState.Initial() {
    return const OrderState(
        orders: [],
        pagination: Pagination(
          pageSize: 20,
          pageNumber: 0,
          lastPage: 1,
          isLoading: false,
        ));
  }
}
