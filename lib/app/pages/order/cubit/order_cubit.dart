import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/domain/order/use_case/get_orders.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'order_cubit.freezed.dart';
part 'order_cubit.g.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required PaginationHelper<Order> paginationHelper,
  }) = _OrderState;

  factory OrderState.initial() {
    return OrderState(paginationHelper: PaginationHelper<Order>(data: []));
  }

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  resetOrders() => emit(OrderState.initial());

  getOrders({required String apiKeys}) async {
    if (state.paginationHelper.canRequest) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)
              as PaginationHelper<Order>));

      final fpdart.Either<Failure, PaginationHelper<Order>> task =
          await GetOrders().call(GetOrdersParams(
              paginationHelper: state.paginationHelper, apiKeys: apiKeys));

      task.fold(
        (l) => null,
        (r) => emit(state.copyWith(paginationHelper: r)),
      );
    }
  }
}
