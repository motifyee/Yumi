import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/domain/order/use_case/get_orders.dart';
import 'package:yumi/statics/pagination.dart';

part 'order_cubit.freezed.dart';
part 'order_cubit.g.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required Pagination<Order> pagination,
  }) = _OrderState;

  factory OrderState.initial() {
    return OrderState(pagination: const Pagination<Order>(data: []));
  }

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  resetOrders() => emit(OrderState.initial());

  getOrders({required String apiKeys}) async {
    if (state.pagination.canRequest) {
      emit(state.copyWith(
          pagination:
              state.pagination.copyWith(isLoading: true) as Pagination<Order>));

      final fpdart.Either<Failure, Pagination<Order>> task = await GetOrders()
          .call(
              GetOrdersParams(pagination: state.pagination, apiKeys: apiKeys));

      task.fold(
        (l) => null,
        (r) => emit(state.copyWith(pagination: r)),
      );
    }
  }
}
