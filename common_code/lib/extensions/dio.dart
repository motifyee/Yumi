import 'package:dio/dio.dart';

extension DioExceptionX on DioException {
  String? get errorMsg {
    if (response?.data is String) return response!.data;

    return response?.data['message'];
  }
}
