import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/domain/order/use_case/get_orders.dart';
import 'package:yumi/domain/order/use_case/put_action_orders.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'order_cubit.freezed.dart';
part 'order_cubit.g.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required PaginationHelper<Order> paginationHelper,
  }) = _OrderState;

  factory OrderState.initial({bool loading = false}) {
    return OrderState(
        paginationHelper:
            PaginationHelper<Order>(data: [], isLoading: loading));
  }

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  resetOrders({bool loading = false}) =>
      emit(OrderState.initial(loading: loading));

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

  putAction({
    required Order order,
    required String apiKey,
    required String getApiKey,
    bool isFakeBody = true,
    Function()? navFun,
    String? customMessage,
  }) async {
    List<Order> orders = List.from(state.paginationHelper.data);
    orders[orders.indexWhere((e) => e.id == order.id)] =
        orders[orders.indexWhere((e) => e.id == order.id)]
            .copyWith(isLoading: true);

    emit(state.copyWith(
        paginationHelper: state.paginationHelper.copyWith(data: orders)
            as PaginationHelper<Order>));

    final fpdart.Either<Failure, bool> task = await PutActionOrders().call(
        PutActionOrdersParams(
            order: order, apiKey: apiKey, isFakeBody: isFakeBody));

    task.fold(
      (l) {
        G.snackBar((l.error as DioException).response?.data['message']);
        List<Order> orders = List.from(state.paginationHelper.data);
        orders[orders.indexWhere((e) => e.id == order.id)] =
            orders[orders.indexWhere((e) => e.id == order.id)]
                .copyWith(isLoading: false);

        emit(state.copyWith(
            paginationHelper: state.paginationHelper.copyWith(data: orders)
                as PaginationHelper<Order>));
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
