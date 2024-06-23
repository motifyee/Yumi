import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/global.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/statics/pagination.dart';

part 'order_bloc.freezed.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState.Initial()) {
    on<OrderEvent>((event, emit) {
      event.map(
        reset: (_resetEvent value) => emit(OrderState.Initial()),
        update: (_updateEvent value) => _update(event: value, emit: emit),
        getRequest: (_getRequestEvent value) =>
            _getRequest(event: value, emit: emit),
        putAction: (_putActionEvent value) =>
            _putAction(event: value, emit: emit),
      );
    });
  }

  _getRequest({
    required _getRequestEvent event,
    required Emitter<OrderState> emit,
  }) async {
    if (state.pagination.pageNumber < state.pagination.lastPage &&
        !state.pagination.isLoading) {
      emit(
        state.copyWith(
          pagination: state.pagination.copyWith(isLoading: true),
        ),
      );

      Response res = await OrderService.getOrderOrPreOrder(
        apiKeys: event.apiKey,
        pagination: state.pagination.toJson(),
      );

      if (res.statusCode == 200) {
        List<Order> data = res.data['data']
            .map<Order>(
              (e) => Order.fromJson(e),
            )
            .toList();

        add(
          OrderEvent.update(
            orders: [...state.orders, ...data].unique(),
            pagination: state.pagination.copyWith(
              pageNumber: res.data['pagination']['page'],
              lastPage: res.data['pagination']['pages'],
              isLoading: false,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            pagination: state.pagination.copyWith(isLoading: false),
          ),
        );
      }
    }
  }

  _update({required _updateEvent event, required Emitter<OrderState> emit}) {
    emit(
      state.copyWith(
        orders: event.orders,
        pagination: event.pagination,
      ),
    );
  }

  _putAction({
    required _putActionEvent event,
    required Emitter<OrderState> emit,
  }) async {
    List<Order> orders = List.from(state.orders);

    final idx = orders.indexWhere((e) => e.id == event.order.id);
    orders[idx] = orders[idx].copyWith(isLoading: true);

    emit(state.copyWith(orders: orders));

    OrderService.putActionOrderOrPreOrder(
      apiKeys: event.apiKey,
      orderId: event.order.id,
      isFakeBody: event.isFakeBody,
    ).then((onValue) {
      if (onValue.statusCode == 200) {
        add(const OrderEvent.reset());
        add(OrderEvent.getRequest(apiKey: event.getApiKey));
        if (event.navFun != null) event.navFun!();
      }
    }).catchError((error) {
      G.snackBar((error as DioException).response?.data['message']);

      List<Order> newOrders = List.from(state.orders);

      final idx = newOrders.indexWhere((e) => e.id == event.order.id);
      newOrders[idx] = newOrders[idx].copyWith(isLoading: false);

      add(OrderEvent.update(
        orders: newOrders,
        pagination: state.pagination,
      ));
    });
  }
}
