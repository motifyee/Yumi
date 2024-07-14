import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';

class APIInterceptor extends Interceptor {
  /// Called when the request is about to be sent.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers.addAll({
      "Content-Type": "application/json",
    });

    if (APIClient.getToken().isNotEmpty) {
      options.headers.addAll({
        "Authorization": "Bearer ${APIClient.getToken()}",
      });
    }

    handler.next(options);
  }

  /// Called when the response is about to be resolved.
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  /// Called when an exception was occurred during the request.
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
  }
}
