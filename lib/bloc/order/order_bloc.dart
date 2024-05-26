import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/statics/pagination_helper.dart';
import 'package:yumi/template/snack_bar.dart';

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

  _getRequest(
      {required _getRequestEvent event,
      required Emitter<OrderState> emit}) async {
    if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
        !state.paginationHelper.isLoading) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)));

      Response res = await OrderService.getOrderOrPreOrder(
          apiKeys: event.apiKey,
          paginationHelper: state.paginationHelper.toJson());

      List<OrderModel> data = res.data['data']
          .map<OrderModel>((e) => OrderModel.fromJson(e))
          .toList();

      add(
        OrderEvent.update(
          orders: [...state.orders, ...data].unique(),
          paginationHelper: state.paginationHelper.copyWith(
            pageNumber: res.data['pagination']['page'],
            lastPage: res.data['pagination']['pages'],
            isLoading: false,
          ),
        ),
      );
    }
  }

  _update({required _updateEvent event, required Emitter<OrderState> emit}) {
    emit(
      state.copyWith(
        orders: event.orders,
        paginationHelper: event.paginationHelper,
      ),
    );
  }

  _putAction(
      {required _putActionEvent event,
      required Emitter<OrderState> emit}) async {
    List<OrderModel> orders = List.from(state.orders);
    orders[orders.indexWhere((e) => e.id == event.order.id)] =
        orders[orders.indexWhere((e) => e.id == event.order.id)]
            .copyWith(isLoading: true);

    emit(state.copyWith(orders: orders));

    Response res = await OrderService.putActionOrderOrPreOrder(
        apiKeys: event.apiKey,
        orderId: event.order.id,
        isFakeBody: event.isFakeBody);

    if (res.statusCode == 200) {
      add(const OrderEvent.reset());
      add(OrderEvent.getRequest(apiKey: event.getApiKey));
      if (event.navFun != null) event.navFun!();
    } else {
      ScaffoldMessenger.of(G.context).showSnackBar(SnackBar(
        content: SnackBarMassage(
          massage: res.data['message'],
        ),
      ));
      List<OrderModel> newOrders = List.from(state.orders);
      newOrders[newOrders.indexWhere((e) => e.id == event.order.id)] =
          newOrders[newOrders.indexWhere((e) => e.id == event.order.id)]
              .copyWith(isLoading: false);
      print('updated -------------------------------');
      add(OrderEvent.update(
          orders: newOrders, paginationHelper: state.paginationHelper));
    }
  }
}
