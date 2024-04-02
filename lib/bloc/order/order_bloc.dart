import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/service/order_service.dart';
import 'package:yumi/statics/pagination_helper.dart';

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
          orders: data,
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
    Response res =
        await OrderService.putActionOrderOrPreOrder(apiKeys: event.apiKey);

    if (res.statusCode == 200) {
      add(const OrderEvent.reset());
      add(OrderEvent.getRequest(apiKey: event.getApiKey));
    }
  }
}
