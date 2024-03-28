part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required List<OrderModel> orders,
    required PaginationHelper paginationHelper,
  }) = _OrderState;

  factory OrderState.Initial() {
    return OrderState(
        orders: [],
        paginationHelper: PaginationHelper(
          pageSize: 20,
          pageNumber: 0,
          lastPage: 1,
          isLoading: false,
        ));
  }
}
