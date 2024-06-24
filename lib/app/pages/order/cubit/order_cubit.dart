import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/domain/order/use_case/get_orders.dart';
import 'package:yumi/domain/order/use_case/put_action_orders.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/pagination.dart';

part 'order_cubit.freezed.dart';
part 'order_cubit.g.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required Pagination<Order> pagination,
  }) = _OrderState;

  factory OrderState.initial({bool loading = false}) {
    return OrderState(
        pagination: Pagination<Order>(data: [], isLoading: loading));
  }

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  resetOrders({bool loading = false}) =>
      emit(OrderState.initial(loading: loading));

  getOrders({required String apiKeys}) async {
    if (state.pagination.canRequest) {
      emit(state.copyWith(
          pagination:
              state.pagination.copyWith(isLoading: true) as Pagination<Order>));

      final fpdart.Either<Failure, Pagination<Order>> task = await GetOrders()
          .call(
              GetOrdersParams(pagination: state.pagination, apiKeys: apiKeys));

      task.fold(
        (l) => G.snackBar((l.error as DioException).response?.data['message']),
        (r) => emit(state.copyWith(pagination: r)),
      );
    }
  }

  putAction({
    required Order order,
    required String apiKey,
    required String getApiKey,
    bool isFakeBody = true,
    Function()? navFun,
    String? customMessage,
  }) async {
    List<Order> orders = List.from(state.pagination.data);
    orders[orders.indexWhere((e) => e.id == order.id)] =
        orders[orders.indexWhere((e) => e.id == order.id)]
            .copyWith(isLoading: true);

    emit(state.copyWith(
        pagination:
            state.pagination.copyWith(data: orders) as Pagination<Order>));

    final fpdart.Either<Failure, bool> task = await PutActionOrders().call(
        PutActionOrdersParams(
            order: order, apiKey: apiKey, isFakeBody: isFakeBody));

    task.fold(
      (l) {
        G.snackBar((l.error as DioException).response?.data['message']);
        List<Order> orders = List.from(state.pagination.data);
        orders[orders.indexWhere((e) => e.id == order.id)] =
            orders[orders.indexWhere((e) => e.id == order.id)]
                .copyWith(isLoading: false);

        emit(state.copyWith(
            pagination:
                state.pagination.copyWith(data: orders) as Pagination<Order>));
      },
      (r) {
        resetOrders();
        getOrders(apiKeys: getApiKey);
        if (navFun != null) navFun();
        if (customMessage != null) G.snackBar(customMessage);
      },
    );
  }
}
