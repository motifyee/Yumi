import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/domain/order/use_case/get_orders.dart';
import 'package:yumi/statics/pager.dart';

part 'order_cubit.freezed.dart';
part 'order_cubit.g.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required Pager<Order> pager,
  }) = _OrderState;

  factory OrderState.initial() {
    return const OrderState(pager: Pager<Order>(data: []));
  }

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  resetOrders() => emit(OrderState.initial());

  getOrders({required String apiKeys}) async {
    if (state.pager.canRequest) {
      emit(state.copyWith(
          pager: state.pager.copyWith(isLoading: true) as Pager<Order>));

      final fpdart.Either<Failure, Pager<Order>> task = await GetOrders()
          .call(GetOrdersParams(pager: state.pager, apiKeys: apiKeys));

      task.fold(
        (l) => null,
        (r) => emit(state.copyWith(pager: r)),
      );
    }
  }
}
