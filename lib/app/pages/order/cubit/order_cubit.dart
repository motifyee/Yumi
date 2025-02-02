import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:yumi/global.dart';

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
        (l) => G().snackBar(l.toString().onEmpty('Connection Error!')),
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
      final List<Order> orders = List.from(
        state.ordersPage.data.map(
          (e) => e.id == order.id ? e.copyWith(isLoading: isLoading) : e,
        ),
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
        G().snackBar(l.toString());

        emitOrderIsLoading(false);
      },
      (r) {
        resetOrders();
        getOrders(apiKeys: getApiKey);

        if (navFun != null) navFun();
        if (customMessage != null) G().snackBar(customMessage);
      },
    );
  }
}
