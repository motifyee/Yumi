import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/domain/order/use_case/get_orders.dart';
import 'package:yumi/domain/order/use_case/put_action_orders.dart';
import 'package:yumi/global.dart';
import 'package:yumi/statics/paginatedData.dart';

part 'order_cubit.freezed.dart';
part 'order_cubit.g.dart';

@freezed
class OrderState with _$OrderState {
  factory OrderState({
    @Default(PaginatedData()) PaginatedData<Order> ordersPage,
  }) = _OrderState;

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState());

  resetOrders({bool loading = false}) => emit(OrderState());

  getOrders({required String apiKeys}) async {
    if (state.ordersPage.canRequest) {
      emit(state.copyWith.ordersPage(isLoading: true));

      final fpdart.Either<Failure, PaginatedData<Order>> task =
          await GetOrders().call(
        GetOrdersParams(
          ordersPage: state.ordersPage,
          apiKeys: apiKeys,
        ),
      );

      task.fold(
        (l) => G.snackBar((l.error as DioException).response?.data['message']),
        (r) => !isClosed ? emit(state.copyWith(ordersPage: r)) : null,
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
    void emitOrderIsLoading(bool isLoading) {
      List<Order> orders = List.from(
        state.ordersPage.data.map(
            (e) => e.id == order.id ? e.copyWith(isLoading: isLoading) : e),
      );
      emit(state.copyWith.ordersPage(data: orders));
    }

    emitOrderIsLoading(true);

    final fpdart.Either<Failure, bool> task = await PutActionOrders().call(
      PutActionOrdersParams(
        order: order,
        apiKey: apiKey,
        isFakeBody: isFakeBody,
      ),
    );

    task.fold(
      (l) {
        G.snackBar((l.error as DioException).response?.data['message']);

        emitOrderIsLoading(false);
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
