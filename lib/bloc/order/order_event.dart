part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.reset() = _resetEvent;
  const factory OrderEvent.update(
      {required List<OrderModel> orders,
      required PaginationHelper paginationHelper}) = _updateEvent;
  const factory OrderEvent.getRequest({required String apiKey}) =
      _getRequestEvent;

  const factory OrderEvent.putAction({
    required OrderModel order,
    required String apiKey,
    required String getApiKey,
    @Default(true) bool isFakeBody,
    Function()? navFun,
  }) = _putActionEvent;
}
